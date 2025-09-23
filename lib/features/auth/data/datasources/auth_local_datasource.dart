import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/storage/local_storage.dart';
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

  // TODO: Inject storage manager
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
          // TODO: Implement proper serialization/deserialization
          // For now, return mock data
          final user = UserEntity(
            id: userData['id'] ?? 'mock-id',
            email: userData['email'] ?? 'mock@example.com',
            firstName: userData['firstName'],
            lastName: userData['lastName'],
            clubId: userData['clubId'],
            status: UserStatus.active,
            createdAt: DateTime.now(),
          );
          return Right(user);
        }
      }

      return const Right(null);
    } catch (e) {
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
          // TODO: Implement proper serialization/deserialization
          // For now, return mock session
          final user = UserEntity(
            id: sessionData['userId'] ?? 'mock-id',
            email: sessionData['userEmail'] ?? 'mock@example.com',
            status: UserStatus.active,
            createdAt: DateTime.now(),
          );

          final session = AuthSessionEntity(
            accessToken: sessionData['accessToken'] ?? '',
            refreshToken: sessionData['refreshToken'] ?? '',
            expiresAt: DateTime.parse(
              sessionData['expiresAt'] ?? DateTime.now().toIso8601String(),
            ),
            user: user,
            hankoSessionId: sessionData['hankoSessionId'],
          );

          return Right(session);
        }
      }

      return const Right(null);
    } catch (e) {
      return Left(CacheFailure.retrievalFailed(e.toString()));
    }
  }

  @override
  Future<void> storeSession(AuthSessionEntity session) async {
    try {
      final storage = await _storage;
      final userStorage = storage.userStorage;

      final sessionData = {
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
    } catch (e) {
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
    } catch (e) {
      throw CacheFailure.storageFailed(e.toString());
    }
  }

  @override
  Future<void> clearSession() async {
    try {
      final storage = await _storage;
      final userStorage = storage.userStorage;
      await userStorage.delete(_sessionKey);
    } catch (e) {
      throw CacheFailure.deletionFailed(e.toString());
    }
  }

  @override
  Future<void> clearUser() async {
    try {
      final storage = await _storage;
      final userStorage = storage.userStorage;
      await userStorage.delete(_userKey);
    } catch (e) {
      throw CacheFailure.deletionFailed(e.toString());
    }
  }
}