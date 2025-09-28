import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:logger/logger.dart';

import '../constants/api_constants.dart';
import '../errors/error_handler.dart' as app_error;
import 'network_info.dart';

/// Custom link responsible for handling errors returned from the GraphQL layer.
///
/// It intercepts errors, logs them, and delegates handling to the [ErrorHandler]
/// to show messages to the user and handle specific authentication failures.
class ErrorHandlingLink extends Link {
  /// Constructs an [ErrorHandlingLink].
  ErrorHandlingLink({this.logger});

  /// Optional logger instance for logging intercepted errors.
  final Logger? logger;

  @override
  Stream<Response> request(Request request, [NextLink? forward]) =>
      forward!(request).handleError((Object error) {
        logger?.e('GraphQL Link Error: $error');

        if (error is OperationException) {
          // Handle specific GraphQL errors
          _handleGraphQLError(error);
        } else {
          // Handle other errors
          final failure = app_error.ErrorHandler.handleException(error);
          app_error.ErrorHandler.showErrorToUser(failure);
        }
      });

  /// Handles [OperationException] errors, checking for specific GraphQL error codes.
  void _handleGraphQLError(OperationException error) {
    final failure = app_error.ErrorHandler.handleException(error);

    // Check for authentication errors
    if (error.graphqlErrors.any(
      (e) => e.extensions?['code'] == 'UNAUTHENTICATED',
    )) {
      app_error.ErrorHandler.handleAuthError(failure);
    } else {
      app_error.ErrorHandler.showErrorToUser(failure);
    }
  }
}

/// Link that automatically retries failed requests using an exponential backoff strategy.
class RetryLink extends Link {
  /// Constructs a [RetryLink].
  RetryLink({
    this.maxRetries = ApiConstants.maxRetries,
    this.initialDelay = ApiConstants.retryDelay,
    this.backoffMultiplier = 2.0,
    this.logger,
  });

  /// The maximum number of times to retry a failed request.
  final int maxRetries;

  /// The initial delay before the first retry attempt.
  final Duration initialDelay;

  /// The multiplier applied to the delay for each subsequent retry (e.g., 2.0 means delay doubles).
  final double backoffMultiplier;

  /// Optional logger instance for logging retry attempts.
  final Logger? logger;

  @override
  Stream<Response> request(Request request, [NextLink? forward]) =>
      _executeWithRetry(request, forward, 0);

  /// Executes the request, recursively retrying on failure until [maxRetries] is reached.
  Stream<Response> _executeWithRetry(
    Request request,
    NextLink? forward,
    int attempt,
  ) => forward!(request).handleError((Object error) async {
    if (attempt < maxRetries && _shouldRetry(error)) {
      final delay = _calculateDelay(attempt);
      logger?.w(
        'Request failed, retrying in ${delay.inMilliseconds}ms (attempt ${attempt + 1}/$maxRetries)',
      );

      await Future<void>.delayed(delay);
      return _executeWithRetry(request, forward, attempt + 1);
    } else {
      throw Exception('Error after maximum retries: $error');
    }
  });

  /// Determines if the given error is retryable.
  ///
  /// Requests are not retried for authentication or validation errors.
  bool _shouldRetry(dynamic error) {
    if (error is OperationException) {
      // Don't retry on authentication or validation errors
      if (error.graphqlErrors.any((e) {
        final code = e.extensions?['code'] as String?;
        return code == 'UNAUTHENTICATED' || code == 'VALIDATION_ERROR';
      })) {
        return false;
      }

      // Retry on network or server errors
      if (error.linkException != null) {
        return true;
      }
    }

    return false;
  }

  /// Calculates the next delay duration using exponential backoff.
  Duration _calculateDelay(int attempt) {
    final delayMs = initialDelay.inMilliseconds * (backoffMultiplier * attempt);
    return Duration(milliseconds: delayMs.round());
  }
}

/// Link that checks network connectivity before executing a request.
///
/// It prevents requests from being sent when the device is offline and
/// handles policies for metered/mobile connections for subscriptions.
class NetworkAwareLink extends Link {
  /// Constructs a [NetworkAwareLink].
  NetworkAwareLink({required this.networkInfo, this.logger});

  /// The utility class used to check network status.
  final NetworkInfo networkInfo;

  /// Optional logger instance for logging network status.
  final Logger? logger;

  @override
  Stream<Response> request(Request request, [NextLink? forward]) async* {
    final isConnected = await networkInfo.isConnected;

    if (!isConnected) {
      logger?.w(
        'No network connection, failing request: ${request.operation.operationName}',
      );
      // Throws a NetworkException wrapped in an OperationException for downstream handling
      throw OperationException(
        linkException: NetworkException(
          message: 'No internet connection',
          originalException: OperationException(),
          uri: null,
        ),
      );
    }

    // Check if this is a subscription and we're on a metered connection
    if (request.isSubscription) {
      final connectionType = await networkInfo.connectionType;
      if (connectionType == ConnectionType.mobile) {
        logger?.i(
          'Starting subscription on mobile connection: ${request.operation.operationName}',
        );
      }
    }

    yield* forward!(request);
  }
}

/// Link that implements custom cache policies for GraphQL queries.
///
/// It currently applies a maximum age to queries but does not implement
/// the full caching mechanism, leaving that to the GraphQL client.
class CachingLink extends Link {
  /// Constructs a [CachingLink].
  CachingLink({
    this.defaultMaxAge = ApiConstants.defaultCacheMaxAge,
    this.operationMaxAge = const {},
    this.logger,
  });

  /// The default maximum age for cacheable queries.
  final Duration defaultMaxAge;

  /// A map to override the max age for specific operation names.
  final Map<String, Duration> operationMaxAge;

  /// Optional logger instance for logging cache status.
  final Logger? logger;

  @override
  Stream<Response> request(Request request, [NextLink? forward]) {
    // Only cache queries, not mutations or subscriptions
    if (request.operation.getOperationType() != OperationType.query) {
      return forward!(request);
    }

    final operationName = request.operation.operationName;
    final maxAge = operationMaxAge[operationName] ?? defaultMaxAge;

    logger?.d('Caching query: $operationName for ${maxAge.inMinutes} minutes');

    return forward!(request).map((response) {
      // Add cache headers or metadata if needed
      // This would integrate with the GraphQL cache system
      return response;
    });
  }
}

/// Link responsible for preventing identical requests from being executed simultaneously.
///
/// If a request for the same operation and variables is pending, it subscribes
/// to the existing request's stream instead of creating a new one.
class DeduplicationLink extends Link {
  /// Constructs a [DeduplicationLink].
  DeduplicationLink({this.logger});

  /// The map of pending requests, keyed by the request hash.
  final Map<String, StreamController<Response>> _pendingRequests = {};

  /// Optional logger instance for logging deduplication events.
  final Logger? logger;

  @override
  Stream<Response> request(Request request, [NextLink? forward]) {
    final requestKey = _generateRequestKey(request);

    // Check if we already have a pending request for this
    if (_pendingRequests.containsKey(requestKey)) {
      logger?.d('Deduplicating request: ${request.operation.operationName}');
      return _pendingRequests[requestKey]!.stream;
    }

    // Create new request
    final controller = StreamController<Response>();
    _pendingRequests[requestKey] = controller;

    forward!(request).listen(
      controller.add,
      onError: (Object error) {
        controller.addError(error);
      },
      onDone: () {
        controller.close();
        _pendingRequests.remove(requestKey);
      },
    );

    return controller.stream;
  }

  /// Generates a unique key for the request based on operation name and variables.
  String _generateRequestKey(Request request) =>
      '${request.operation.operationName}_${request.variables.hashCode}';
}

/// Link that measures and logs the time taken for each GraphQL operation.
class PerformanceLink extends Link {
  /// Constructs a [PerformanceLink].
  PerformanceLink({this.logger});

  /// Optional logger instance for logging performance metrics.
  final Logger? logger;

  @override
  Stream<Response> request(Request request, [NextLink? forward]) {
    final stopwatch = Stopwatch()..start();
    final operationName = request.operation.operationName;

    logger?.d('Starting GraphQL operation: $operationName');

    return forward!(request)
        .map((response) {
          stopwatch.stop();
          final duration = stopwatch.elapsedMilliseconds;

          logger?.i(
            'GraphQL operation completed: $operationName in ${duration}ms',
          );

          // Log slow operations
          if (duration > 1000) {
            logger?.w(
              'Slow GraphQL operation detected: $operationName took ${duration}ms',
            );
          }

          return response;
        })
        .handleError((Object error) {
          stopwatch.stop();
          final duration = stopwatch.elapsedMilliseconds;

          logger?.e(
            'GraphQL operation failed: $operationName after ${duration}ms - $error',
          );
        });
  }
}

/// Factory class to construct pre-configured GraphQL link chains.
class LinkFactory {
  /// Creates a comprehensive link chain suitable for **Development** environments.
  ///
  /// This chain includes performance monitoring and strict error handling.
  static Link createDevelopmentLink({
    required String httpUrl,
    required String wsUrl,
    required Future<String?> Function() getToken,
    required NetworkInfo networkInfo,
    Logger? logger,
  }) {
    final httpLink = HttpLink(httpUrl);
    final wsLink = WebSocketLink(wsUrl);
    final authLink = AuthLink(getToken: getToken);

    return Link.from([
      PerformanceLink(logger: logger),
      ErrorHandlingLink(logger: logger),
      RetryLink(logger: logger),
      NetworkAwareLink(networkInfo: networkInfo, logger: logger),
      DeduplicationLink(logger: logger),
      CachingLink(logger: logger),
      authLink,
      Link.split((request) => request.isSubscription, wsLink, httpLink),
    ]);
  }

  /// Creates an optimized link chain suitable for **Production** environments.
  ///
  /// This chain omits performance monitoring for reduced overhead.
  static Link createProductionLink({
    required String httpUrl,
    required String wsUrl,
    required Future<String?> Function() getToken,
    required NetworkInfo networkInfo,
    Logger? logger,
  }) {
    final httpLink = HttpLink(httpUrl);
    final wsLink = WebSocketLink(wsUrl);
    final authLink = AuthLink(getToken: getToken);

    return Link.from([
      ErrorHandlingLink(logger: logger),
      RetryLink(logger: logger),
      NetworkAwareLink(networkInfo: networkInfo, logger: logger),
      DeduplicationLink(logger: logger),
      CachingLink(logger: logger),
      authLink,
      Link.split((request) => request.isSubscription, wsLink, httpLink),
    ]);
  }
}
