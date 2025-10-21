import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/errors/error_handler.dart';
import '../../../../core/performance/performance_monitor.dart';
import '../../../../core/providers/core_providers.dart';
import '../../domain/entities/auth_session_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../providers/auth_providers.dart';

part 'auth_controller.g.dart';

/// Authentication controller managing user auth state
@riverpod
class AuthController extends _$AuthController {
  @override
  Future<UserEntity?> build() async {
    // Initialize and check for existing session
    await _initializeAuth();
    return _loadStoredUser();
  }

  /// Initialize authentication system
  Future<void> _initializeAuth() async {
    try {
      final logger = ref.read(loggerProvider);
      logger.d('Initializing authentication...');

      // Try to initialize repository - may fail if GraphQL client not ready
      try {
        // 1. FIX: Removed variable assignment. We read the provider to FORCE its
        // creation and thus trigger the potential initialization error if dependencies
        // (like the GraphQL client) are missing.
        ref.read(authRepositoryProvider);

        // 2. Set up the listener regardless of whether the initial read failed or succeeded.
        // If the read failed, this ref.listen will run later when the provider rebuilds.
        ref.listen(authRepositoryProvider, (_, repository) {
          // NOTE: The 'repository' parameter here is the actual instance passed by the listener.
          repository.authStateChanges.listen((session) {
            // Check if the provider is still mounted before updating state
            if (!ref.mounted) return;

            if (session != null) {
              state = AsyncData(session.user);
            } else {
              state = const AsyncData(null);
            }
          });
        });

        logger.d('Authentication repository initialized');
      } on Object catch (e, stackTrace) {
        // 3. FIX: Changed catch signature to get stackTrace and logged it.
        // If the error is transient (e.g., dependency not ready), log it as a warning.
        final logger = ref.read(loggerProvider);
        logger.w(
          'Auth repository not ready yet. Continuing without, will retry on next rebuild.',
          error: e,
          stackTrace: stackTrace, // Added stackTrace for better debugging
        );
        // Continue without auth repository - it will be initialized later
      }

      logger.d('Authentication initialization completed');
    } on Exception catch (e, stackTrace) {
      final logger = ref.read(loggerProvider);
      logger.e(
        'Failed to initialize authentication',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  /// Load stored user from storage
  Future<UserEntity?> _loadStoredUser() async {
    try {
      final getCurrentUserUsecase = ref.read(getCurrentUserUsecaseProvider);
      final result = await getCurrentUserUsecase();

      return result.fold((failure) {
        ErrorHandler.logWarning(
          'Failed to load stored user: ${failure.message}',
        );
        return null;
      }, (user) => user);
    } on Exception catch (e) {
      ErrorHandler.logError('Error loading stored user', error: e);
      return null;
    }
  }

  /// Login with email and password
  Future<void> login({required String email, required String password}) async {
    state = const AsyncLoading();
    final monitor = PerformanceMonitor();

    try {
      final result = await monitor.timeOperation(
        'auth_login',
        () async {
          final loginUsecase = ref.read(loginUsecaseProvider);
          return await loginUsecase(email: email, password: password);
        },
      );

      result.fold(
        (failure) {
          state = AsyncError(failure, StackTrace.current);
          ErrorHandler.showErrorToUser(failure);
        },
        (session) {
          state = AsyncData(session.user);
          _onLoginSuccess(session);
        },
      );
    } on Exception catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
      final failure = ErrorHandler.handleException(e);
      ErrorHandler.showErrorToUser(failure);
    }
  }

  /// Login with Hanko (passwordless)
  Future<void> loginWithHanko({required String email}) async {
    state = const AsyncLoading();

    try {
      final hankoLoginUsecase = ref.read(hankoLoginUsecaseProvider);
      final result = await hankoLoginUsecase(email: email);

      result.fold(
        (failure) {
          state = AsyncError(failure, StackTrace.current);
          ErrorHandler.showErrorToUser(failure);
        },
        (session) {
          state = AsyncData(session.user);
          _onLoginSuccess(session);
        },
      );
    } on Object catch (error, stackTrace) {
      // FIX: Explicitly catch Object
      // Handle any unexpected errors (e.g., type errors, network issues)
      state = AsyncError(error, stackTrace);

      // Show user-friendly error message
      ErrorHandler.showMessage(
        'Hanko authentication is currently unavailable. Please try the standard login.',
        isError: true,
      );
    }
  }

  /// Complete Hanko authentication
  Future<void> completeHankoAuth({
    required String sessionId,
    required String credential,
  }) async {
    state = const AsyncLoading();

    try {
      final hankoLoginUsecase = ref.read(hankoLoginUsecaseProvider);
      final result = await hankoLoginUsecase.completeAuth(
        sessionId: sessionId,
        credential: credential,
      );

      result.fold(
        (failure) {
          state = AsyncError(failure, StackTrace.current);
          ErrorHandler.showErrorToUser(failure);
        },
        (session) {
          state = AsyncData(session.user);
          _onLoginSuccess(session);
        },
      );
    } on Exception catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
      final failure = ErrorHandler.handleException(e);
      ErrorHandler.showErrorToUser(failure);
    }
  }

  /// Register new user
  Future<void> register({
    required String email,
    required String password,
    required String confirmPassword,
    required String firstName,
    required String lastName,
    String? clubId,
  }) async {
    state = const AsyncLoading();

    try {
      final registerUsecase = ref.read(registerUsecaseProvider);
      final result = await registerUsecase(
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        firstName: firstName,
        lastName: lastName,
        clubId: clubId,
      );

      result.fold(
        (failure) {
          state = AsyncError(failure, StackTrace.current);
          ErrorHandler.showErrorToUser(failure);
        },
        (session) {
          state = AsyncData(session.user);
          _onLoginSuccess(session);
        },
      );
    } on Exception catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
      final failure = ErrorHandler.handleException(e);
      ErrorHandler.showErrorToUser(failure);
    }
  }

  /// Logout user
  Future<void> logout() async {
    try {
      final logoutUsecase = ref.read(logoutUsecaseProvider);
      final result = await logoutUsecase();

      result.fold((failure) {
        ErrorHandler.showErrorToUser(failure);
        // Clear local state even if server logout fails
        _onLogoutSuccess();
      }, (_) => _onLogoutSuccess());
    } on Exception catch (e) {
      final failure = ErrorHandler.handleException(e);
      ErrorHandler.showErrorToUser(failure);
      // Clear local state even if logout throws exception
      _onLogoutSuccess();
    }
  }

  /// Refresh authentication token
  Future<void> refreshToken() async {
    try {
      final secureStorageService = ref.read(secureStorageServiceProvider);
      final refreshToken = await secureStorageService.getRefreshToken();

      if (refreshToken == null) {
        await logout();
        return;
      }

      final refreshTokenUsecase = ref.read(refreshTokenUsecaseProvider);
      final result = await refreshTokenUsecase(refreshToken: refreshToken);

      await result.fold(
        (failure) async {
          ErrorHandler.logWarning('Token refresh failed: ${failure.message}');
          await logout(); // Force logout on refresh failure
        },
        (session) async {
          state = AsyncData(session.user);
          _onTokenRefreshSuccess(session);
        },
      );
    } on Exception catch (e) {
      ErrorHandler.logError('Error refreshing token', error: e);
      await logout();
    }
  }

  /// Update user profile
  Future<void> updateProfile({required UserProfile profile}) async {
    final currentUser = state.value;
    if (currentUser == null) return;

    try {
      // TODO(oscaralmgren): Implement profile update usecase
      final updatedUser = currentUser.copyWith(profile: profile);
      state = AsyncData(updatedUser);
    } on Exception catch (e) {
      final failure = ErrorHandler.handleException(e);
      ErrorHandler.showErrorToUser(failure);
    }
  }

  /// Authenticate with biometrics
  Future<void> authenticateWithBiometrics() async {
    try {
      final biometricAuthUsecase = ref.read(biometricAuthUsecaseProvider);
      final result = await biometricAuthUsecase.authenticate();

      result.fold(ErrorHandler.showErrorToUser, (success) {
        if (success) {
          // Biometric auth successful, user is already logged in
          ErrorHandler.logInfo('Biometric authentication successful');
        }
      });
    } on Exception catch (e) {
      final failure = ErrorHandler.handleException(e);
      ErrorHandler.showErrorToUser(failure);
    }
  }

  /// Enable/disable biometric authentication
  Future<void> setBiometricAuth({required bool enabled}) async {
    try {
      final biometricAuthUsecase = ref.read(biometricAuthUsecaseProvider);
      final result = await biometricAuthUsecase.setBiometricAuth(
        enabled: enabled,
      );

      result.fold(ErrorHandler.showErrorToUser, (success) {
        if (success) {
          ErrorHandler.logInfo(
            'Biometric authentication ${enabled ? 'enabled' : 'disabled'}',
          );
        }
      });
    } on Exception catch (e) {
      final failure = ErrorHandler.handleException(e);
      ErrorHandler.showErrorToUser(failure);
    }
  }

  /// Handle successful login
  void _onLoginSuccess(AuthSessionEntity session) {
    ErrorHandler.logInfo('Login successful for user: ${session.user.email}');

    // Invalidate other providers that depend on auth state
    ref.invalidate(currentUserProvider);

    // Navigation is handled automatically by GoRouter auth guards
  }

  /// Handle successful logout
  void _onLogoutSuccess() {
    state = const AsyncData(null);
    ErrorHandler.logInfo('Logout successful');

    // Invalidate auth-dependent providers
    ref.invalidate(currentUserProvider);
    ref.invalidate(authSessionProvider);

    // Navigation is handled automatically by GoRouter auth guards
  }

  /// Handle successful token refresh
  void _onTokenRefreshSuccess(AuthSessionEntity session) {
    ErrorHandler.logInfo('Token refresh successful');
    // State is already updated above
  }

  /// Check if user is authenticated
  bool get isAuthenticated => state.value != null;

  /// Check if user has specific role
  bool hasRole(String role) {
    final user = state.value;
    return user?.hasRole(role) ?? false;
  }

  /// Check if user has specific permission
  bool hasPermission(String permission) {
    final user = state.value;
    return user?.hasPermission(permission) ?? false;
  }

  /// Get current user safely
  UserEntity? get currentUser => state.value;

  /// Check if current state is loading
  bool get isLoading => state.isLoading;

  /// Check if current state has error
  bool get hasError => state.hasError;

  /// Get current error
  Object? get error => state.error;
}

/// Current user provider (derived from auth controller)
@riverpod
UserEntity? currentUser(Ref ref) {
  final authState = ref.watch(authControllerProvider);
  return authState.value;
}

/// Authentication status provider
@riverpod
bool isAuthenticated(Ref ref) {
  final user = ref.watch(currentUserProvider);
  return user != null;
}

/// Current auth session provider
@riverpod
Future<AuthSessionEntity?> authSession(Ref ref) async {
  final authRepository = ref.read(authRepositoryProvider);
  final result = await authRepository.getCurrentSession();

  return result.fold((failure) => null, (session) => session);
}

/// User permissions provider
@riverpod
Future<List<String>> userPermissions(Ref ref) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) return [];

  final authRepository = ref.read(authRepositoryProvider);
  final result = await authRepository.getUserPermissions();

  return result.fold(
    (failure) => <String>[],
    (List<String> permissions) => permissions,
  );
}

/// Biometric availability provider
@riverpod
Future<bool> biometricAvailable(Ref ref) async {
  final authRepository = ref.read(authRepositoryProvider);
  return authRepository.isBiometricAvailable();
}
