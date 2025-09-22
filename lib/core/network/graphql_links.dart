import 'dart:async';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:logger/logger.dart';

import '../constants/api_constants.dart';
import '../errors/error_handler.dart';
import 'network_info.dart';

/// Custom error handling link
class ErrorHandlingLink extends Link {
  final Logger? logger;

  ErrorHandlingLink({this.logger});

  @override
  Stream<Response> request(Request request, [NextLink? forward]) {
    return forward!(request).handleError((error) {
      logger?.e('GraphQL Link Error: $error');

      if (error is OperationException) {
        // Handle specific GraphQL errors
        _handleGraphQLError(error);
      } else {
        // Handle other errors
        final failure = ErrorHandler.handleException(error);
        ErrorHandler.showErrorToUser(failure);
      }
    });
  }

  void _handleGraphQLError(OperationException error) {
    final failure = ErrorHandler.handleException(error);

    // Check for authentication errors
    if (error.graphqlErrors.any((e) => e.extensions?['code'] == 'UNAUTHENTICATED')) {
      ErrorHandler.handleAuthError(failure);
    } else {
      ErrorHandler.showErrorToUser(failure);
    }
  }
}

/// Retry link with exponential backoff
class RetryLink extends Link {
  final int maxRetries;
  final Duration initialDelay;
  final double backoffMultiplier;
  final Logger? logger;

  RetryLink({
    this.maxRetries = ApiConstants.maxRetries,
    this.initialDelay = ApiConstants.retryDelay,
    this.backoffMultiplier = 2.0,
    this.logger,
  });

  @override
  Stream<Response> request(Request request, [NextLink? forward]) {
    return _executeWithRetry(request, forward, 0);
  }

  Stream<Response> _executeWithRetry(Request request, NextLink? forward, int attempt) {
    return forward!(request).handleError((error) async {
      if (attempt < maxRetries && _shouldRetry(error)) {
        final delay = _calculateDelay(attempt);
        logger?.w('Request failed, retrying in ${delay.inMilliseconds}ms (attempt ${attempt + 1}/$maxRetries)');

        await Future.delayed(delay);
        return _executeWithRetry(request, forward, attempt + 1);
      } else {
        throw error;
      }
    });
  }

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

  Duration _calculateDelay(int attempt) {
    final delayMs = initialDelay.inMilliseconds * (backoffMultiplier * attempt);
    return Duration(milliseconds: delayMs.round());
  }
}

/// Network-aware link that handles offline scenarios
class NetworkAwareLink extends Link {
  final NetworkInfo networkInfo;
  final Logger? logger;

  NetworkAwareLink({
    required this.networkInfo,
    this.logger,
  });

  @override
  Stream<Response> request(Request request, [NextLink? forward]) async* {
    final isConnected = await networkInfo.isConnected;

    if (!isConnected) {
      logger?.w('No network connection, failing request: ${request.operation.operationName}');
      throw const OperationException(
        linkException: NetworkException('No internet connection'),
      );
    }

    // Check if this is a subscription and we're on a metered connection
    if (request.isSubscription) {
      final connectionType = await networkInfo.connectionType;
      if (connectionType == ConnectionType.mobile) {
        logger?.i('Starting subscription on mobile connection: ${request.operation.operationName}');
      }
    }

    yield* forward!(request);
  }
}

/// Caching link with custom cache policies
class CachingLink extends Link {
  final Duration defaultMaxAge;
  final Map<String, Duration> operationMaxAge;
  final Logger? logger;

  CachingLink({
    this.defaultMaxAge = ApiConstants.defaultCacheMaxAge,
    this.operationMaxAge = const {},
    this.logger,
  });

  @override
  Stream<Response> request(Request request, [NextLink? forward]) {
    // Only cache queries, not mutations or subscriptions
    if (request.operation.type != OperationType.query) {
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

/// Request deduplication link
class DeduplicationLink extends Link {
  final Map<String, StreamController<Response>> _pendingRequests = {};
  final Logger? logger;

  DeduplicationLink({this.logger});

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
      (response) {
        controller.add(response);
      },
      onError: (error) {
        controller.addError(error);
      },
      onDone: () {
        controller.close();
        _pendingRequests.remove(requestKey);
      },
    );

    return controller.stream;
  }

  String _generateRequestKey(Request request) {
    return '${request.operation.operationName}_${request.variables.hashCode}';
  }
}

/// Performance monitoring link
class PerformanceLink extends Link {
  final Logger? logger;

  PerformanceLink({this.logger});

  @override
  Stream<Response> request(Request request, [NextLink? forward]) {
    final stopwatch = Stopwatch()..start();
    final operationName = request.operation.operationName;

    logger?.d('Starting GraphQL operation: $operationName');

    return forward!(request).map((response) {
      stopwatch.stop();
      final duration = stopwatch.elapsedMilliseconds;

      logger?.i('GraphQL operation completed: $operationName in ${duration}ms');

      // Log slow operations
      if (duration > 1000) {
        logger?.w('Slow GraphQL operation detected: $operationName took ${duration}ms');
      }

      return response;
    }).handleError((error) {
      stopwatch.stop();
      final duration = stopwatch.elapsedMilliseconds;

      logger?.e('GraphQL operation failed: $operationName after ${duration}ms - $error');
    });
  }
}

/// Link factory for creating configured link chains
class LinkFactory {
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
      Link.split(
        (request) => request.isSubscription,
        wsLink,
        httpLink,
      ),
    ]);
  }

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
      Link.split(
        (request) => request.isSubscription,
        wsLink,
        httpLink,
      ),
    ]);
  }
}