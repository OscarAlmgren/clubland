import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:logger/logger.dart';

import '../../../../core/errors/exceptions.dart' as app_exceptions;
import '../../../../graphql/profile/current_user.graphql.dart';
import '../../../../graphql/profile/update_user.graphql.dart';

/// Abstract interface for profile remote data source
abstract class ProfileRemoteDataSource {
  /// Fetch the current authenticated user from the backend.
  Future<Map<String, dynamic>> getCurrentUser();

  /// Update user profile fields (firstName, lastName).
  Future<Map<String, dynamic>> updateUser({
    required String id,
    String? firstName,
    String? lastName,
  });
}

/// GraphQL implementation of [ProfileRemoteDataSource]
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  ProfileRemoteDataSourceImpl({required GraphQLClient client, Logger? logger})
    : _client = client,
      _logger = logger ?? Logger();

  final GraphQLClient _client;
  final Logger _logger;

  @override
  Future<Map<String, dynamic>> getCurrentUser() async {
    _logger.d('Fetching current user profile');

    final result = await _client.query(
      QueryOptions(
        document: documentNodeQueryCurrentUser,
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    if (result.hasException) {
      _logger.e('Failed to fetch current user', error: result.exception);
      throw app_exceptions.NetworkException(result.exception.toString());
    }

    final data = result.data?['me'] as Map<String, dynamic>?;
    if (data == null) {
      throw app_exceptions.NetworkException.notFound();
    }
    return data;
  }

  @override
  Future<Map<String, dynamic>> updateUser({
    required String id,
    String? firstName,
    String? lastName,
  }) async {
    _logger.d('Updating user profile: $id');

    final result = await _client.mutate(
      Options$Mutation$UpdateUser(
        variables: Variables$Mutation$UpdateUser(
          id: id,
          firstName: firstName,
          lastName: lastName,
        ),
      ),
    );

    if (result.hasException) {
      _logger.e('Failed to update user profile', error: result.exception);
      throw app_exceptions.NetworkException.badRequest(
        result.exception.toString(),
      );
    }

    final data = result.data?['updateUser'] as Map<String, dynamic>?;
    if (data == null) {
      throw app_exceptions.NetworkException('Update returned null');
    }
    return data;
  }
}
