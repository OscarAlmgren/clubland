import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

/// Login use case
class LoginUsecase {
  final AuthRepository _repository;

  LoginUsecase(this._repository);

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
    return await _repository.login(
      email: email.trim().toLowerCase(),
      password: password,
    );
  }

  /// Validate email format
  String? _validateEmail(String email) {
    if (email.isEmpty) return 'Email is required';

    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
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
  final AuthRepository _repository;

  HankoLoginUsecase(this._repository);

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
    return await _repository.loginWithHanko(
      email: email.trim().toLowerCase(),
    );
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

    return await _repository.completeHankoAuth(
      sessionId: sessionId,
      credential: credential,
    );
  }

  String? _validateEmail(String email) {
    if (email.isEmpty) return 'Email is required';

    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(email)) {
      return 'Invalid email format';
    }

    return null;
  }
}

/// Register use case
class RegisterUsecase {
  final AuthRepository _repository;

  RegisterUsecase(this._repository);

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
    final emailCheck = await _repository.checkEmailAvailability(email: email.trim().toLowerCase());
    final isEmailAvailable = emailCheck.fold(
      (failure) => false,
      (available) => available,
    );

    if (!isEmailAvailable) {
      return Left(ValidationFailure.invalidInput('email', 'Email is already taken'));
    }

    // Execute registration
    return await _repository.register(
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

    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
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

    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return ValidationFailure.passwordTooWeak();
    }

    if (!RegExp(r'[a-z]').hasMatch(password)) {
      return ValidationFailure.passwordTooWeak();
    }

    if (!RegExp(r'[0-9]').hasMatch(password)) {
      return ValidationFailure.passwordTooWeak();
    }

    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
      return ValidationFailure.passwordTooWeak();
    }

    // Confirm password validation
    if (confirmPassword != password) {
      return ValidationFailure.invalidInput('confirmPassword', 'Passwords do not match');
    }

    // Name validation
    if (firstName.trim().isEmpty) {
      return ValidationFailure.fieldRequired('First name');
    }

    if (lastName.trim().isEmpty) {
      return ValidationFailure.fieldRequired('Last name');
    }

    if (firstName.trim().length < 2) {
      return ValidationFailure.invalidInput('firstName', 'First name must be at least 2 characters');
    }

    if (lastName.trim().length < 2) {
      return ValidationFailure.invalidInput('lastName', 'Last name must be at least 2 characters');
    }

    return null;
  }
}

/// Logout use case
class LogoutUsecase {
  final AuthRepository _repository;

  LogoutUsecase(this._repository);

  /// Execute logout
  Future<Either<Failure, bool>> call() async {
    return await _repository.logout();
  }
}

/// Refresh token use case
class RefreshTokenUsecase {
  final AuthRepository _repository;

  RefreshTokenUsecase(this._repository);

  /// Execute token refresh
  Future<Either<Failure, AuthSessionEntity>> call({
    required String refreshToken,
  }) async {
    if (refreshToken.isEmpty) {
      return Left(ValidationFailure.fieldRequired('Refresh token'));
    }

    return await _repository.refreshToken(refreshToken: refreshToken);
  }
}

/// Get current user use case
class GetCurrentUserUsecase {
  final AuthRepository _repository;

  GetCurrentUserUsecase(this._repository);

  /// Get current authenticated user
  Future<Either<Failure, UserEntity?>> call() async {
    return await _repository.getCurrentUser();
  }
}

/// Check authentication status use case
class CheckAuthStatusUsecase {
  final AuthRepository _repository;

  CheckAuthStatusUsecase(this._repository);

  /// Check if user is authenticated
  Future<bool> call() async {
    return await _repository.isAuthenticated();
  }
}

/// Biometric authentication use case
class BiometricAuthUsecase {
  final AuthRepository _repository;

  BiometricAuthUsecase(this._repository);

  /// Check if biometric authentication is available
  Future<bool> isAvailable() async {
    return await _repository.isBiometricAvailable();
  }

  /// Authenticate with biometrics
  Future<Either<Failure, bool>> authenticate() async {
    final isAvailable = await _repository.isBiometricAvailable();
    if (!isAvailable) {
      return Left(AuthFailure.biometricNotAvailable());
    }

    return await _repository.authenticateWithBiometrics();
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

    return await _repository.setBiometricAuth(enabled: enabled);
  }
}
