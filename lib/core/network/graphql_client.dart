import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:logger/logger.dart';

import '../constants/api_constants.dart';
import '../constants/app_constants.dart';
import '../constants/storage_keys.dart';
import '../errors/error_handler.dart';

/// GraphQL client configuration and setup
class GraphQLClientConfig {
  static late GraphQLClient _client;
  static late Logger _logger;
  static late FlutterSecureStorage _secureStorage;

  /// Initialize GraphQL client
  static Future<void> initialize({
    required String baseUrl,
    Logger? logger,
    FlutterSecureStorage? secureStorage,
  }) async {
    _logger = logger ?? Logger();
    _secureStorage = secureStorage ?? const FlutterSecureStorage();

    final httpLink = HttpLink('$baseUrl${ApiConstants.graphqlEndpoint}');
    final wsLink = WebSocketLink(
      '${baseUrl.replaceFirst('http', 'ws')}${ApiConstants.graphqlWsEndpoint}',
      config: SocketClientConfig(
        autoReconnect: true,
        inactivityTimeout: Duration(seconds: 30),
        initialPayload: () async => await _getWebSocketPayload(),
      ),
    );

    final authLink = AuthLink(getToken: _getAuthToken);
    final errorLink = ErrorLink(errorHandler: _handleGraphQLError);
    final loggerLink = _createLoggerLink();

    // Combine links
    Link link = Link.from([
      errorLink,
      if (AppConstants.enableNetworkLogging) loggerLink,
      authLink,
    ]);

    // Split link for subscriptions vs queries/mutations
    link = Link.split(
      (request) => request.isSubscription,
      wsLink,
      link.concat(httpLink),
    );

    _client = GraphQLClient(
      link: link,
      cache: GraphQLCache(store: InMemoryStore()),
      defaultPolicies: DefaultPolicies(
        watchQuery: Policies(
          fetch: FetchPolicy.cacheAndNetwork,
          error: ErrorPolicy.all,
          cacheReread: CacheRereadPolicy.mergeOptimistic,
        ),
        query: Policies(
          fetch: FetchPolicy.cacheFirst,
          error: ErrorPolicy.all,
        ),
        mutate: Policies(
          fetch: FetchPolicy.networkOnly,
          error: ErrorPolicy.all,
        ),
        subscribe: Policies(
          fetch: FetchPolicy.networkOnly,
          error: ErrorPolicy.all,
        ),
      ),
    );

    _logger.i('GraphQL client initialized with baseUrl: $baseUrl');
  }

  /// Get the configured GraphQL client
  static GraphQLClient get client {
    return _client;
  }

  /// Get authentication token for requests
  static Future<String?> _getAuthToken() async {
    try {
      final token = await _secureStorage.read(key: StorageKeys.accessToken);
      return token != null ? 'Bearer $token' : null;
    } catch (e) {
      _logger.w('Failed to read auth token: $e');
      return null;
    }
  }

  /// Get WebSocket connection payload
  static Future<Map<String, dynamic>> _getWebSocketPayload() async {
    final token = await _getAuthToken();
    return {
      'authorization': token,
      'client': 'flutter',
      'version': AppConstants.appVersion,
    };
  }

  /// Handle GraphQL errors
  static void _handleGraphQLError(OperationException error) {
    _logger.e('GraphQL Error: ${error.toString()}');

    // Handle specific error types
    if (error.graphqlErrors.isNotEmpty) {
      for (final graphqlError in error.graphqlErrors) {
        final code = graphqlError.extensions?['code'] as String?;

        if (code == 'UNAUTHENTICATED') {
          _handleAuthenticationError();
        }
      }
    }

    // Convert to app failure and handle
    final failure = ErrorHandler.handleException(error);
    ErrorHandler.showErrorToUser(failure);
  }

  /// Handle authentication errors
  static void _handleAuthenticationError() async {
    _logger.w('Authentication error detected, clearing tokens');

    try {
      await _secureStorage.delete(key: StorageKeys.accessToken);
      await _secureStorage.delete(key: StorageKeys.refreshToken);
    } catch (e) {
      _logger.e('Failed to clear auth tokens: $e');
    }
  }

  /// Create logger link for debugging
  static Link _createLoggerLink() {
    return Link.function((request, [forward]) {
      _logger.d('GraphQL Request: ${request.operation.operationName}');
      _logger.d('Variables: ${request.variables}');

      return forward!(request).map((response) {
        if (response.errors?.isNotEmpty == true) {
          _logger.e('GraphQL Errors: ${response.errors}');
        }

        if (AppConstants.isDebugMode) {
          _logger.d('GraphQL Response: ${response.data}');
        }

        return response;
      });
    });
  }

  /// Refresh authentication token
  static Future<bool> refreshToken() async {
    try {
      final refreshToken = await _secureStorage.read(key: StorageKeys.refreshToken);
      if (refreshToken == null) {
        _logger.w('No refresh token available');
        return false;
      }

      // TODO: Implement token refresh mutation
      // This would be implemented with the actual GraphQL mutation
      // For now, return false to indicate refresh failed
      _logger.w('Token refresh not implemented yet');
      return false;
    } catch (e) {
      _logger.e('Failed to refresh token: $e');
      return false;
    }
  }

  /// Clear cache
  static Future<void> clearCache() async {
    try {
      await _client.cache.store.reset();
      _logger.i('GraphQL cache cleared');
    } catch (e) {
      _logger.e('Failed to clear GraphQL cache: $e');
    }
  }

  /// Update cache for optimistic updates
  static void updateCache({
    required String operationName,
    required Map<String, dynamic> data,
  }) {
    try {
      // TODO: Implement cache updates based on operation type
      _logger.d('Cache update for $operationName: $data');
    } catch (e) {
      _logger.e('Failed to update cache: $e');
    }
  }

  /// Dispose client resources
  static Future<void> dispose() async {
    try {
      await _client.cache.store.reset();
      _logger.i('GraphQL client disposed');
    } catch (e) {
      _logger.e('Failed to dispose GraphQL client: $e');
    }
  }
}

/// GraphQL operation helpers
class GraphQLHelpers {
  /// Execute query with error handling
  static Future<QueryResult<T>> executeQuery<T>(
    QueryOptions options, {
    bool showErrorToUser = true,
  }) async {
    try {
      final result = await GraphQLClientConfig.client.query<T>(options);

      if (result.hasException && showErrorToUser) {
        final failure = ErrorHandler.handleException(result.exception!);
        ErrorHandler.showErrorToUser(failure);
      }

      return result;
    } catch (e) {
      if (showErrorToUser) {
        final failure = ErrorHandler.handleException(e);
        ErrorHandler.showErrorToUser(failure);
      }
      rethrow;
    }
  }

  /// Execute mutation with error handling
  static Future<QueryResult<T>> executeMutation<T>(
    MutationOptions options, {
    bool showErrorToUser = true,
  }) async {
    try {
      final result = await GraphQLClientConfig.client.mutate<T>(options);

      if (result.hasException && showErrorToUser) {
        final failure = ErrorHandler.handleException(result.exception!);
        ErrorHandler.showErrorToUser(failure);
      }

      return result;
    } catch (e) {
      if (showErrorToUser) {
        final failure = ErrorHandler.handleException(e);
        ErrorHandler.showErrorToUser(failure);
      }
      rethrow;
    }
  }

  /// Subscribe with error handling
  static Stream<QueryResult<T>> executeSubscription<T>(
    SubscriptionOptions options, {
    bool showErrorToUser = true,
  }) {
    try {
      return GraphQLClientConfig.client.subscribe<T>(options).handleError((error) {
        if (showErrorToUser) {
          final failure = ErrorHandler.handleException(error);
          ErrorHandler.showErrorToUser(failure);
        }
      });
    } catch (e) {
      if (showErrorToUser) {
        final failure = ErrorHandler.handleException(e);
        ErrorHandler.showErrorToUser(failure);
      }
      rethrow;
    }
  }

  /// Check if operation was successful
  static bool isSuccess<T>(QueryResult<T> result) {
    return !result.hasException && result.data != null;
  }

  /// Extract data from result safely
  static T? extractData<T>(QueryResult<T> result) {
    if (isSuccess(result)) {
      return result.parsedData;
    }
    return null;
  }

  /// Get error message from result
  static String? getErrorMessage<T>(QueryResult<T> result) {
    if (result.exception?.graphqlErrors.isNotEmpty == true) {
      return result.exception!.graphqlErrors.first.message;
    }
    if (result.exception?.linkException != null) {
      return result.exception!.linkException.toString();
    }
    return null;
  }
}