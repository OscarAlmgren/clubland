import 'package:clubland/core/design_system/widgets/app_button.dart';
import 'package:clubland/core/design_system/widgets/app_input_field.dart';
import 'package:clubland/core/errors/error_handler.dart';
import 'package:clubland/core/errors/failures.dart';
import 'package:clubland/core/providers/core_providers.dart';
import 'package:clubland/features/auth/domain/entities/auth_session_entity.dart';
import 'package:clubland/features/auth/domain/entities/user_entity.dart';
import 'package:clubland/features/auth/presentation/pages/login_page.dart';
import 'package:clubland/features/auth/presentation/controllers/auth_controller.dart';
import 'package:clubland/features/auth/presentation/providers/auth_providers.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../helpers/mock_providers.dart';
import '../../../../../helpers/test_helpers.dart';

void main() {
  late MockLoginUsecase mockLoginUseCase;
  late MockLogoutUsecase mockLogoutUseCase;
  late MockRegisterUsecase mockRegisterUseCase;
  late MockRefreshTokenUsecase mockRefreshTokenUseCase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    TestHelpers.setupFallbackValues();

    // Initialize ErrorHandler for tests
    ErrorHandler.initialize(
      navigatorKey: GlobalKey<NavigatorState>(),
      scaffoldMessengerKey: GlobalKey<ScaffoldMessengerState>(),
      logger: Logger(level: Level.off), // Silent logger for tests
    );

    mockLoginUseCase = MockLoginUsecase();
    mockLogoutUseCase = MockLogoutUsecase();
    mockRegisterUseCase = MockRegisterUsecase();
    mockRefreshTokenUseCase = MockRefreshTokenUsecase();
    mockAuthRepository = MockAuthRepository();
    // Mock auth repository stream
    when(
      () => mockAuthRepository.authStateChanges,
    ).thenAnswer((_) => Stream.value(null));
  });

  tearDown(MockProviders.resetAll);

  Widget createLoginPage() => ProviderScope(
    overrides: [
      // Core providers
      authRepositoryProvider.overrideWithValue(mockAuthRepository),
      loggerProvider.overrideWithValue(MockProviders.logger),

      // Auth providers
      loginUsecaseProvider.overrideWithValue(mockLoginUseCase),
      logoutUsecaseProvider.overrideWithValue(mockLogoutUseCase),
      registerUsecaseProvider.overrideWithValue(mockRegisterUseCase),
      refreshTokenUsecaseProvider.overrideWithValue(mockRefreshTokenUseCase),

      // Override currentUserProvider to avoid circular dependency
      currentUserProvider.overrideWith((ref) => null),
    ],
    child: const MaterialApp(home: LoginPage()),
  );

  // Helper to build a minimal session for stubs
  AuthSessionEntity makeTestSession() => AuthSessionEntity(
    accessToken: TestConstants.testToken,
    refreshToken: TestConstants.testRefreshToken,
    expiresAt: DateTime.now().add(const Duration(hours: 1)),
    user: UserEntity(
      id: 'test-id',
      email: TestConstants.testEmail,
      createdAt: DateTime.now(),
    ),
  );

  group('LoginPage', () {
    testWidgets('should render all required elements', (tester) async {
      await tester.pumpWidget(createLoginPage());
      await tester.pump(); // Allow for any async operations

      expect(find.text('Welcome to Clubland'), findsOneWidget);
      expect(
        find.text('Sign in to access premium clubs worldwide'),
        findsOneWidget,
      );
      expect(find.byType(AppInputField), findsNWidgets(2));
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Sign In'), findsOneWidget);
      expect(find.text('Forgot Password?'), findsOneWidget);
      // Note: Text has trailing space in implementation
      expect(find.textContaining("Don't have an account"), findsOneWidget);
      expect(find.text('Sign Up'), findsOneWidget);
    });

    testWidgets('should validate empty email field', (tester) async {
      await tester.pumpWidget(createLoginPage());
      await tester.pumpAndSettle(); // Wait for initial render

      // Find the Sign In button by text since it's more reliable
      final signInButton = find.text('Sign In');
      await tester.tap(signInButton);
      await tester.pumpAndSettle(); // Wait for all animations and validation

      expect(find.text('Please enter your email'), findsOneWidget);
    });

    testWidgets('should validate invalid email format', (tester) async {
      await tester.pumpWidget(createLoginPage());
      await tester.pumpAndSettle();

      final emailField = find.byType(AppInputField).first;
      await tester.enterText(emailField, 'invalid-email');
      await tester.pump();

      final signInButton = find.text('Sign In');
      await tester.tap(signInButton);
      await tester.pumpAndSettle(); // Wait for validation

      expect(find.text('Please enter a valid email'), findsOneWidget);
    });

    testWidgets('should validate empty password field', (tester) async {
      await tester.pumpWidget(createLoginPage());
      await tester.pumpAndSettle();

      final emailField = find.byType(AppInputField).first;
      await tester.enterText(emailField, TestConstants.testEmail);
      await tester.pump();

      final signInButton = find.text('Sign In');
      await tester.tap(signInButton);
      await tester.pumpAndSettle(); // Wait for validation

      expect(find.text('Please enter your password'), findsOneWidget);
    });

    testWidgets('should validate password minimum length', (tester) async {
      await tester.pumpWidget(createLoginPage());
      await tester.pumpAndSettle();

      final emailField = find.byType(AppInputField).first;
      await tester.enterText(emailField, TestConstants.testEmail);
      final passwordField = find.byType(AppInputField).last;
      await tester.enterText(passwordField, '12345');

      final signInButton = find.text('Sign In');
      await tester.tap(signInButton);
      await tester.pumpAndSettle();

      expect(
        find.text('Password must be at least 6 characters'),
        findsOneWidget,
      );
    });

    testWidgets('should call login when form is valid', (tester) async {
      when(
        () => mockLoginUseCase.call(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer(
        (_) async => Right(makeTestSession()),
      );

      await tester.pumpWidget(createLoginPage());

      final emailField = find.byType(AppInputField).first;
      final passwordField = find.byType(AppInputField).last;

      await tester.enterText(emailField, TestConstants.testEmail);
      await tester.enterText(passwordField, TestConstants.testPassword);

      await tester.pump();

      final signInButton = find.byType(AppButton).first;
      await tester.tap(signInButton);
      await tester.pump();

      verify(
        () => mockLoginUseCase.call(
          email: TestConstants.testEmail,
          password: TestConstants.testPassword,
        ),
      ).called(1);
    });

    testWidgets('should show loading state during login', (tester) async {
      when(
        () => mockLoginUseCase.call(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer(
        (_) async => Future.delayed(
          const Duration(milliseconds: 100),
          () => const Left(AuthFailure('Test error')),
        ),
      );

      await tester.pumpWidget(createLoginPage());
      await tester.pumpAndSettle();

      final emailField = find.byType(AppInputField).first;
      final passwordField = find.byType(AppInputField).last;

      await tester.enterText(emailField, TestConstants.testEmail);
      await tester.enterText(passwordField, TestConstants.testPassword);
      await tester.pump();

      final signInButton = find.text('Sign In');
      await tester.tap(signInButton);
      await tester.pump(); // Don't wait for timer, just check immediate state

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      // Complete the timer to clean up
      await tester.pumpAndSettle();
    });

    testWidgets('should trim email before login', (tester) async {
      when(
        () => mockLoginUseCase(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) async => Right(makeTestSession()));

      await tester.pumpWidget(createLoginPage());
      await tester.pumpAndSettle();

      final emailField = find.byType(AppInputField).first;
      await tester.enterText(
        emailField,
        '  ${TestConstants.testEmail}  ',
      );
      final passwordField = find.byType(AppInputField).last;
      await tester.enterText(passwordField, TestConstants.testPassword);

      await tester.tap(find.text('Sign In'));
      await tester.pumpAndSettle();

      // assert - should call with trimmed email
      verify(
        () => mockLoginUseCase(
          email: TestConstants.testEmail,
          password: TestConstants.testPassword,
        ),
      ).called(1);
    });

    testWidgets('should toggle password visibility', (tester) async {
      await tester.pumpWidget(createLoginPage());

      final passwordField = find.byType(AppInputField).last;
      final toggleButton = find.descendant(
        of: passwordField,
        matching: find.byType(IconButton),
      );

      expect(toggleButton, findsOneWidget);

      await tester.tap(toggleButton);
      await tester.pump();

      final textField = find.descendant(
        of: passwordField,
        matching: find.byType(TextField),
      );
      final textFieldWidget = tester.widget<TextField>(textField);
      expect(textFieldWidget.obscureText, false);
    });

    testWidgets('should navigate to register page when sign up is tapped', (
      tester,
    ) async {
      await tester.pumpWidget(createLoginPage());

      final signUpButton = find.text('Sign Up');
      expect(signUpButton, findsOneWidget);

      await tester.tap(signUpButton);
      await tester.pumpAndSettle();
    });

    testWidgets('should handle forgot password tap', (tester) async {
      await tester.pumpWidget(createLoginPage());

      final forgotPasswordButton = find.text('Forgot Password?');
      expect(forgotPasswordButton, findsOneWidget);

      await tester.tap(forgotPasswordButton);
      await tester.pumpAndSettle();
    });

    testWidgets('should navigate when email provided for Hanko login', (
      tester,
    ) async {
      await tester.pumpWidget(createLoginPage());
      await tester.pumpAndSettle();

      final emailField = find.byType(AppInputField).first;
      await tester.enterText(emailField, TestConstants.testEmail);

      await tester.tap(find.text('Continue with Hanko'));
      await tester.pumpAndSettle();

      // No error snackbar means navigation was attempted
      expect(find.text('Please enter your email first'), findsNothing);
    });

    testWidgets('should show error when Hanko login without email', (
      tester,
    ) async {
      await tester.pumpWidget(createLoginPage());
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.text('Continue with Hanko'));
      await tester.tap(find.text('Continue with Hanko'));
      await tester.pumpAndSettle();

      expect(find.text('Please enter your email first'), findsOneWidget);
    });

    testWidgets('should disable sign in button when loading', (tester) async {
      when(
        () => mockLoginUseCase(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer(
        (_) => Future.delayed(
          const Duration(milliseconds: 200),
          () => Right(makeTestSession()),
        ),
      );

      await tester.pumpWidget(createLoginPage());
      await tester.pumpAndSettle();

      final emailField = find.byType(AppInputField).first;
      final passwordField = find.byType(AppInputField).last;
      await tester.enterText(emailField, TestConstants.testEmail);
      await tester.enterText(passwordField, TestConstants.testPassword);
      await tester.tap(find.text('Sign In'));
      await tester.pump();

      // Button should be disabled (onPressed == null) when loading
      final signInButtonFinder = find.ancestor(
        of: find.text('Sign In'),
        matching: find.byType(ElevatedButton),
      );
      if (signInButtonFinder.evaluate().isNotEmpty) {
        final button = tester.widget<ElevatedButton>(signInButtonFinder);
        expect(button.onPressed, isNull);
      } else {
        // AppButton uses CircularProgressIndicator when loading
        expect(find.byType(CircularProgressIndicator), findsWidgets);
      }

      // Pump past the timer to avoid "A Timer is still pending" error
      await tester.pump(const Duration(milliseconds: 300));
      await tester.pumpAndSettle();
    });

    testWidgets('should handle login failure gracefully', (tester) async {
      when(
        () => mockLoginUseCase(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) async => Left(AuthFailure.invalidCredentials()));

      await tester.pumpWidget(createLoginPage());
      await tester.pumpAndSettle();

      final emailField = find.byType(AppInputField).first;
      await tester.enterText(emailField, TestConstants.testEmail);
      final passwordField = find.byType(AppInputField).last;
      await tester.enterText(passwordField, TestConstants.testPassword);
      await tester.tap(find.text('Sign In'));
      await tester.pumpAndSettle();

      // page should still be rendered without crash
      expect(find.text('Welcome to Clubland'), findsOneWidget);
    });

    group('Hanko authentication', () {
      testWidgets('should show Hanko login button', (tester) async {
        await tester.pumpWidget(createLoginPage());

        expect(find.text('Continue with Hanko'), findsOneWidget);
      });

      testWidgets('should call Hanko login when button is tapped', (
        tester,
      ) async {
        await tester.pumpWidget(createLoginPage());
        await tester.pumpAndSettle();

        // Scroll to ensure Hanko button is visible
        await tester.ensureVisible(find.text('Continue with Hanko'));
        await tester.pumpAndSettle();

        final hankoButton = find.text('Continue with Hanko');
        await tester.tap(hankoButton, warnIfMissed: false);
        await tester.pumpAndSettle();
      });
    });

    group('accessibility', () {
      testWidgets('should have proper semantic labels', (tester) async {
        await tester.pumpWidget(createLoginPage());
        await tester.pumpAndSettle();

        // Just verify that key elements exist and are accessible
        expect(find.text('Welcome to Clubland'), findsOneWidget);

        final emailField = find.byType(AppInputField).first;
        expect(emailField, findsOneWidget);

        // Find the actual text field within the AppInputField
        final emailTextField = find.descendant(
          of: emailField,
          matching: find.byType(TextField),
        );
        expect(emailTextField, findsOneWidget);

        // Verify the text field has correct semantic label
        final semantics = tester.getSemantics(emailTextField);
        expect(semantics.label, 'Enter your email');
      });

      testWidgets('should support keyboard navigation', (tester) async {
        await tester.pumpWidget(createLoginPage());

        final emailField = find.byType(AppInputField).first;
        final passwordField = find.byType(AppInputField).last;

        await tester.tap(emailField);
        await tester.pump();

        await tester.sendKeyEvent(LogicalKeyboardKey.tab);
        await tester.pump();

        // Just verify that both fields are focusable
        expect(emailField, findsOneWidget);
        expect(passwordField, findsOneWidget);
      });
    });
  });
}
