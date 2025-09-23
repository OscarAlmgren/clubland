import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/user_entity.dart';

/// Hanko data source for passwordless authentication
abstract class HankoDataSource {
  Future<Either<Failure, HankoAuthResponse>> initiateLogin(String email);
  Future<Either<Failure, AuthSessionEntity>> completeLogin({
    required String sessionId,
    required String credential,
  });
  Future<Either<Failure, HankoAuthResponse>> initiateRegistration(String email);
  Future<Either<Failure, AuthSessionEntity>> completeRegistration({
    required String sessionId,
    required String credential,
    required String firstName,
    required String lastName,
  });
  Future<Either<Failure, bool>> isEmailRegistered(String email);
}

/// Hanko authentication response
class HankoAuthResponse {
  final String sessionId;
  final String status;
  final String? message;
  final Map<String, dynamic>? metadata;

  const HankoAuthResponse({
    required this.sessionId,
    required this.status,
    this.message,
    this.metadata,
  });

  factory HankoAuthResponse.fromJson(Map<String, dynamic> json) {
    return HankoAuthResponse(
      sessionId: json['sessionId'] as String,
      status: json['status'] as String,
      message: json['message'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  }
}

/// Implementation of Hanko data source
class HankoDataSourceImpl implements HankoDataSource {
  final Dio _dio;
  final Logger _logger;
  final String _baseUrl;
  final String _projectId;

  HankoDataSourceImpl({
    required Dio dio,
    required Logger logger,
    String? baseUrl,
    String? projectId,
  })  : _dio = dio,
        _logger = logger,
        _baseUrl = baseUrl ?? const String.fromEnvironment(
          'HANKO_BASE_URL',
          defaultValue: 'https://api.hanko.io',
        ),
        _projectId = projectId ?? const String.fromEnvironment(
          'HANKO_PROJECT_ID',
          defaultValue: 'demo-project',
        );

  @override
  Future<Either<Failure, HankoAuthResponse>> initiateLogin(String email) async {
    try {
      _logger.d('Initiating Hanko login for email: $email');

      final response = await _dio.post(
        '$_baseUrl/v1/projects/$_projectId/auth/login/init',
        data: {
          'email': email,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        final hankoResponse = HankoAuthResponse.fromJson(response.data);
        _logger.i('Hanko login initiated successfully');
        return Right(hankoResponse);
      } else {
        _logger.e('Hanko login initiation failed with status: ${response.statusCode}');
        return Left(AuthFailure.hankoError('Login initiation failed'));
      }
    } on DioException catch (e) {
      _logger.e('Hanko login initiation error: ${e.message}');
      return Left(_handleDioError(e));
    } catch (e) {
      _logger.e('Unexpected error during Hanko login initiation: $e');
      return Left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthSessionEntity>> completeLogin({
    required String sessionId,
    required String credential,
  }) async {
    try {
      _logger.d('Completing Hanko login for session: $sessionId');

      final response = await _dio.post(
        '$_baseUrl/v1/projects/$_projectId/auth/login/complete',
        data: {
          'sessionId': sessionId,
          'credential': credential,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        final sessionData = response.data;

        // Create user entity from Hanko response
        final user = UserEntity(
          id: sessionData['user']['id'],
          email: sessionData['user']['email'],
          firstName: sessionData['user']['firstName'],
          lastName: sessionData['user']['lastName'],
          status: UserStatus.active,
          createdAt: DateTime.parse(sessionData['user']['createdAt']),
          updatedAt: sessionData['user']['updatedAt'] != null
              ? DateTime.parse(sessionData['user']['updatedAt'])
              : null,
        );

        // Create auth session
        final session = AuthSessionEntity(
          accessToken: sessionData['accessToken'],
          refreshToken: sessionData['refreshToken'],
          expiresAt: DateTime.parse(sessionData['expiresAt']),
          user: user,
          hankoSessionId: sessionId,
        );

        _logger.i('Hanko login completed successfully');
        return Right(session);
      } else {
        _logger.e('Hanko login completion failed with status: ${response.statusCode}');
        return Left(AuthFailure.hankoError('Login completion failed'));
      }
    } on DioException catch (e) {
      _logger.e('Hanko login completion error: ${e.message}');
      return Left(_handleDioError(e));
    } catch (e) {
      _logger.e('Unexpected error during Hanko login completion: $e');
      return Left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, HankoAuthResponse>> initiateRegistration(String email) async {
    try {
      _logger.d('Initiating Hanko registration for email: $email');

      final response = await _dio.post(
        '$_baseUrl/v1/projects/$_projectId/auth/register/init',
        data: {
          'email': email,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        final hankoResponse = HankoAuthResponse.fromJson(response.data);
        _logger.i('Hanko registration initiated successfully');
        return Right(hankoResponse);
      } else {
        _logger.e('Hanko registration initiation failed with status: ${response.statusCode}');
        return Left(AuthFailure.hankoError('Registration initiation failed'));
      }
    } on DioException catch (e) {
      _logger.e('Hanko registration initiation error: ${e.message}');
      return Left(_handleDioError(e));
    } catch (e) {
      _logger.e('Unexpected error during Hanko registration initiation: $e');
      return Left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthSessionEntity>> completeRegistration({
    required String sessionId,
    required String credential,
    required String firstName,
    required String lastName,
  }) async {
    try {
      _logger.d('Completing Hanko registration for session: $sessionId');

      final response = await _dio.post(
        '$_baseUrl/v1/projects/$_projectId/auth/register/complete',
        data: {
          'sessionId': sessionId,
          'credential': credential,
          'profile': {
            'firstName': firstName,
            'lastName': lastName,
          },
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 201) {
        final sessionData = response.data;

        // Create user entity from Hanko response
        final user = UserEntity(
          id: sessionData['user']['id'],
          email: sessionData['user']['email'],
          firstName: firstName,
          lastName: lastName,
          status: UserStatus.active,
          createdAt: DateTime.now(),
        );

        // Create auth session
        final session = AuthSessionEntity(
          accessToken: sessionData['accessToken'],
          refreshToken: sessionData['refreshToken'],
          expiresAt: DateTime.parse(sessionData['expiresAt']),
          user: user,
          hankoSessionId: sessionId,
        );

        _logger.i('Hanko registration completed successfully');
        return Right(session);
      } else {
        _logger.e('Hanko registration completion failed with status: ${response.statusCode}');
        return Left(AuthFailure.hankoError('Registration completion failed'));
      }
    } on DioException catch (e) {
      _logger.e('Hanko registration completion error: ${e.message}');
      return Left(_handleDioError(e));
    } catch (e) {
      _logger.e('Unexpected error during Hanko registration completion: $e');
      return Left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isEmailRegistered(String email) async {
    try {
      _logger.d('Checking if email is registered with Hanko: $email');

      final response = await _dio.get(
        '$_baseUrl/v1/projects/$_projectId/users/check',
        queryParameters: {
          'email': email,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        final isRegistered = response.data['exists'] as bool;
        _logger.d('Email registration check completed: $isRegistered');
        return Right(isRegistered);
      } else {
        _logger.e('Email registration check failed with status: ${response.statusCode}');
        return Left(AuthFailure.hankoError('Email check failed'));
      }
    } on DioException catch (e) {
      _logger.e('Email registration check error: ${e.message}');
      return Left(_handleDioError(e));
    } catch (e) {
      _logger.e('Unexpected error during email registration check: $e');
      return Left(AuthFailure.unexpected(e.toString()));
    }
  }

  /// Handle Dio errors and convert to appropriate failures
  Failure _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkFailure.timeout();
      case DioExceptionType.connectionError:
        return NetworkFailure.noConnection();
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode ?? 0;
        final message = error.response?.data?['message'] ?? 'Unknown error';

        if (statusCode == 401) {
          return AuthFailure.invalidCredentials();
        } else if (statusCode == 403) {
          return NetworkFailure.forbidden();
        } else if (statusCode == 404) {
          return NetworkFailure.notFound();
        } else if (statusCode == 429) {
          return NetworkFailure.rateLimited();
        } else {
          return NetworkFailure.serverError(statusCode, message);
        }
      case DioExceptionType.cancel:
        return AuthFailure.unexpected('Request was cancelled');
      case DioExceptionType.unknown:
      default:
        return AuthFailure.unexpected(error.message ?? 'Unknown error');
    }
  }
}