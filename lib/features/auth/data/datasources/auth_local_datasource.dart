import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/storage/local_storage.dart';
import '../../domain/entities/auth_session_entity.dart';
import '../../domain/entities/user_entity.dart';

/// Local data source for authentication
abstract class AuthLocalDataSource {
  Future<Either<Failure, UserEntity?>> getCurrentUser();
  Future<Either<Failure, AuthSessionEntity?>> getCurrentSession();
  Future<void> storeSession(AuthSessionEntity session);
  Future<void> storeUser(UserEntity user);
  Future<void> clearSession();
  Future<void> clearUser();
}

/// Implementation of AuthLocalDataSource
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  static const String _userKey = 'current_user';
  static const String _sessionKey = 'current_session';

  // TODO(oscaralmgren): Inject storage manager
  StorageManager? _storageManager;

  Future<StorageManager> get _storage async {
    if (_storageManager == null) {
      _storageManager = StorageManager();
      await _storageManager!.init();
    }
    return _storageManager!;
  }

  @override
  Future<Either<Failure, UserEntity?>> getCurrentUser() async {
    try {
      final storage = await _storage;
      final userStorage = storage.userStorage;

      if (await userStorage.containsKey(_userKey)) {
        final userData = await userStorage.readJson(_userKey);
        if (userData != null) {
          // TODO(oscaralmgren): Implement proper serialization/deserialization
          // For now, return mock data
          final user = UserEntity(
            id: userData['id'] as String? ?? 'mock-id',
            email: userData['email'] as String? ?? 'mock@example.com',
            firstName: userData['firstName'] as String?,
            lastName: userData['lastName'] as String?,
            clubId: userData['clubId'] as String?,
            createdAt: DateTime.now(),
          );
          return Right(user);
        }
      }

      return const Right(null);
    } on Exception catch (e) {
      return Left(CacheFailure.retrievalFailed(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthSessionEntity?>> getCurrentSession() async {
    try {
      final storage = await _storage;
      final userStorage = storage.userStorage;

      if (await userStorage.containsKey(_sessionKey)) {
        final sessionData = await userStorage.readJson(_sessionKey);
        if (sessionData != null) {
          // TODO(oscaralmgren): Implement proper serialization/deserialization
          // For now, return mock session
          final user = UserEntity(
            id: sessionData['userId'] as String? ?? 'mock-id',
            email: sessionData['userEmail'] as String? ?? 'mock@example.com',
            createdAt: DateTime.now(),
          );

          final session = AuthSessionEntity(
            user: user,
            accessToken: sessionData['accessToken'] as String? ?? '',
            refreshToken: sessionData['refreshToken'] as String? ?? '',
            expiresAt: DateTime.parse(
              sessionData['expiresAt'] as String? ??
                  DateTime.now().toIso8601String(),
            ),
            id: sessionData['id'] as String?,
            hankoSessionId: sessionData['hankoSessionId'] as String?,
          );

          return Right(session);
        }
      }

      return const Right(null);
    } on Exception catch (e) {
      return Left(CacheFailure.retrievalFailed(e.toString()));
    }
  }

  @override
  Future<void> storeSession(AuthSessionEntity session) async {
    try {
      final storage = await _storage;
      final userStorage = storage.userStorage;

      final sessionData = {
        'id': session.id,
        'accessToken': session.accessToken,
        'refreshToken': session.refreshToken,
        'expiresAt': session.expiresAt.toIso8601String(),
        'userId': session.user.id,
        'userEmail': session.user.email,
        'hankoSessionId': session.hankoSessionId,
      };

      await userStorage.writeJson(_sessionKey, sessionData);

      // Also store user separately
      await storeUser(session.user);
    } on Exception catch (e) {
      throw CacheFailure.storageFailed(e.toString());
    }
  }

  @override
  Future<void> storeUser(UserEntity user) async {
    try {
      final storage = await _storage;
      final userStorage = storage.userStorage;

      final userData = {
        'id': user.id,
        'email': user.email,
        'username': user.username,
        'firstName': user.firstName,
        'lastName': user.lastName,
        'clubId': user.clubId,
        'status': user.status.name,
        'roles': user.roles,
        'permissions': user.permissions,
        'createdAt': user.createdAt.toIso8601String(),
        'updatedAt': user.updatedAt?.toIso8601String(),
      };

      await userStorage.writeJson(_userKey, userData);
    } on Exception catch (e) {
      throw CacheFailure.storageFailed(e.toString());
    }
  }

  @override
  Future<void> clearSession() async {
    try {
      final storage = await _storage;
      final userStorage = storage.userStorage;
      await userStorage.delete(_sessionKey);
    } on Exception catch (e) {
      throw CacheFailure.deletionFailed(e.toString());
    }
  }

  @override
  Future<void> clearUser() async {
    try {
      final storage = await _storage;
      final userStorage = storage.userStorage;
      await userStorage.delete(_userKey);
    } on Exception catch (e) {
      throw CacheFailure.deletionFailed(e.toString());
    }
  }
}
