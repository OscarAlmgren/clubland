import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

/// Login use case
class LoginUsecase {
  /// Constructs a [LoginUsecase]
  LoginUsecase(this._repository);
  final AuthRepository _repository;

  /// Execute login with email and password
  Future<Either<Failure, AuthSessionEntity>> call({
    required String email,
    required String password,
  }) async {
    // Validate input
    final emailValidation = _validateEmail(email);
    if (emailValidation != null) {
      return Left(ValidationFailure.invalidEmail());
    }

    final passwordValidation = _validatePassword(password);
    if (passwordValidation != null) {
      return Left(passwordValidation);
    }

    // Execute login
    return _repository.login(
      email: email.trim().toLowerCase(),
      password: password,
    );
  }

  /// Validate email format
  String? _validateEmail(String email) {
    if (email.isEmpty) return 'Email is required';

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(email)) {
      return 'Invalid email format';
    }

    return null;
  }

  /// Validate password
  ValidationFailure? _validatePassword(String password) {
    if (password.isEmpty) {
      return ValidationFailure.fieldRequired('Password');
    }

    if (password.length < 8) {
      return ValidationFailure.passwordTooWeak();
    }

    return null;
  }
}

/// Hanko login use case
class HankoLoginUsecase {
  /// Constructs a [HankoLoginUsecase]
  HankoLoginUsecase(this._repository);
  final AuthRepository _repository;

  /// Initiate Hanko login
  Future<Either<Failure, AuthSessionEntity>> call({
    required String email,
  }) async {
    // Validate email
    final emailValidation = _validateEmail(email);
    if (emailValidation != null) {
      return Left(ValidationFailure.invalidEmail());
    }

    // Execute Hanko login
    return _repository.loginWithHanko(email: email.trim().toLowerCase());
  }

  /// Complete Hanko authentication
  Future<Either<Failure, AuthSessionEntity>> completeAuth({
    required String sessionId,
    required String credential,
  }) async {
    if (sessionId.isEmpty) {
      return Left(ValidationFailure.fieldRequired('Session ID'));
    }

    if (credential.isEmpty) {
      return Left(ValidationFailure.fieldRequired('Credential'));
    }

    return _repository.completeHankoAuth(
      sessionId: sessionId,
      credential: credential,
    );
  }

  String? _validateEmail(String email) {
    if (email.isEmpty) return 'Email is required';

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(email)) {
      return 'Invalid email format';
    }

    return null;
  }
}

/// Register use case
class RegisterUsecase {
  /// Constructs a [RegisterUsecase]
  RegisterUsecase(this._repository);
  final AuthRepository _repository;

  /// Execute user registration
  Future<Either<Failure, AuthSessionEntity>> call({
    required String email,
    required String password,
    required String confirmPassword,
    required String firstName,
    required String lastName,
    String? clubId,
  }) async {
    // Validate input
    final validation = _validateInput(
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      firstName: firstName,
      lastName: lastName,
    );

    if (validation != null) {
      return Left(validation);
    }

    // Check email availability
    final emailCheck = await _repository.checkEmailAvailability(
      email: email.trim().toLowerCase(),
    );
    final isEmailAvailable = emailCheck.fold(
      (failure) => false,
      (available) => available,
    );

    if (!isEmailAvailable) {
      return Left(
        ValidationFailure.invalidInput('email', 'Email is already taken'),
      );
    }

    // Execute registration
    return _repository.register(
      email: email.trim().toLowerCase(),
      password: password,
      firstName: firstName.trim(),
      lastName: lastName.trim(),
      clubId: clubId,
    );
  }

  ValidationFailure? _validateInput({
    required String email,
    required String password,
    required String confirmPassword,
    required String firstName,
    required String lastName,
  }) {
    // Email validation
    if (email.isEmpty) {
      return ValidationFailure.fieldRequired('Email');
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(email)) {
      return ValidationFailure.invalidEmail();
    }

    // Password validation
    if (password.isEmpty) {
      return ValidationFailure.fieldRequired('Password');
    }

    if (password.length < 8) {
      return ValidationFailure.passwordTooWeak();
    }

    if (!RegExp('[A-Z]').hasMatch(password)) {
      return ValidationFailure.passwordTooWeak();
    }

    if (!RegExp('[a-z]').hasMatch(password)) {
      return ValidationFailure.passwordTooWeak();
    }

    if (!RegExp('[0-9]').hasMatch(password)) {
      return ValidationFailure.passwordTooWeak();
    }

    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
      return ValidationFailure.passwordTooWeak();
    }

    // Confirm password validation
    if (confirmPassword != password) {
      return ValidationFailure.invalidInput(
        'confirmPassword',
        'Passwords do not match',
      );
    }

    // Name validation
    if (firstName.trim().isEmpty) {
      return ValidationFailure.fieldRequired('First name');
    }

    if (lastName.trim().isEmpty) {
      return ValidationFailure.fieldRequired('Last name');
    }

    if (firstName.trim().length < 2) {
      return ValidationFailure.invalidInput(
        'firstName',
        'First name must be at least 2 characters',
      );
    }

    if (lastName.trim().length < 2) {
      return ValidationFailure.invalidInput(
        'lastName',
        'Last name must be at least 2 characters',
      );
    }

    return null;
  }
}

/// Logout use case
class LogoutUsecase {
  /// Constructs a [LogoutUsecase]
  LogoutUsecase(this._repository);
  final AuthRepository _repository;

  /// Execute logout
  Future<Either<Failure, bool>> call() async => _repository.logout();
}

/// Refresh token use case
class RefreshTokenUsecase {
  /// Constructs a [RefreshTokenUsecase]
  RefreshTokenUsecase(this._repository);
  final AuthRepository _repository;

  /// Execute token refresh
  Future<Either<Failure, AuthSessionEntity>> call({
    required String refreshToken,
  }) async {
    if (refreshToken.isEmpty) {
      return Left(ValidationFailure.fieldRequired('Refresh token'));
    }

    return _repository.refreshToken(refreshToken: refreshToken);
  }
}

/// Get current user use case
class GetCurrentUserUsecase {
  /// Constructs a [GetCurrentUserUsecase]
  GetCurrentUserUsecase(this._repository);
  final AuthRepository _repository;

  /// Get current authenticated user
  Future<Either<Failure, UserEntity?>> call() async =>
      _repository.getCurrentUser();
}

/// Check authentication status use case
class CheckAuthStatusUsecase {
  /// Constructs a [CheckAuthStatusUsecase]
  CheckAuthStatusUsecase(this._repository);
  final AuthRepository _repository;

  /// Check if user is authenticated
  Future<bool> call() async => _repository.isAuthenticated();
}

/// Biometric authentication use case
class BiometricAuthUsecase {
  /// Constructs a [BiometricAuthUsecase]
  BiometricAuthUsecase(this._repository);
  final AuthRepository _repository;

  /// Check if biometric authentication is available
  Future<bool> isAvailable() async => _repository.isBiometricAvailable();

  /// Authenticate with biometrics
  Future<Either<Failure, bool>> authenticate() async {
    final isAvailable = await _repository.isBiometricAvailable();
    if (!isAvailable) {
      return Left(AuthFailure.biometricNotAvailable());
    }

    return _repository.authenticateWithBiometrics();
  }

  /// Enable/disable biometric authentication
  Future<Either<Failure, bool>> setBiometricAuth({
    required bool enabled,
  }) async {
    if (enabled) {
      final isAvailable = await _repository.isBiometricAvailable();
      if (!isAvailable) {
        return Left(AuthFailure.biometricNotAvailable());
      }
    }

    return _repository.setBiometricAuth(enabled: enabled);
  }
}
