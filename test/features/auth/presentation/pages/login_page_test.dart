import 'package:clubland/core/errors/failures.dart';
import 'package:clubland/features/auth/domain/entities/auth_session_entity.dart';
import 'package:clubland/features/auth/domain/entities/user_entity.dart';
import 'package:clubland/features/auth/domain/usecases/login_usecase.dart';
import 'package:clubland/features/auth/presentation/pages/login_page.dart';
import 'package:clubland/features/auth/presentation/providers/auth_providers.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/test_helpers.dart';

class MockLoginUsecase extends Mock implements LoginUsecase {}

class MockHankoLoginUsecase extends Mock implements HankoLoginUsecase {}

class MockGetCurrentUserUsecase extends Mock implements GetCurrentUserUsecase {}

void main() {
  late MockLoginUsecase mockLoginUsecase;
  late MockHankoLoginUsecase mockHankoLoginUsecase;
  late MockGetCurrentUserUsecase mockGetCurrentUserUsecase;

  setUp(() {
    mockLoginUsecase = MockLoginUsecase();
    mockHankoLoginUsecase = MockHankoLoginUsecase();
    mockGetCurrentUserUsecase = MockGetCurrentUserUsecase();
  });

  final testUser = UserEntity(
    id: 'user123',
    email: TestConstants.testEmail,
    firstName: TestConstants.testFirstName,
    lastName: TestConstants.testLastName,
    status: UserStatus.active,
    createdAt: DateTime(2025, 1, 1),
  );

  final testSession = AuthSessionEntity(
    id: 'session123',
    user: testUser,
    accessToken: TestConstants.testToken,
    refreshToken: TestConstants.testRefreshToken,
    expiresAt: DateTime.now().add(const Duration(hours: 1)),
    createdAt: DateTime.now(),
  );

  group('LoginPage Widget Tests -', () {
    testWidgets('should display login form with all required fields',
        (tester) async {
      // arrange
      when(() => mockGetCurrentUserUsecase())
          .thenAnswer((_) async => const Right(null));

      // act
      await tester.pumpApp(
        const LoginPage(),
        overrides: [
          getCurrentUserUsecaseProvider
              .overrideWithValue(mockGetCurrentUserUsecase),
        ],
      );
      await tester.pumpAndSettle();

      // assert
      expect(find.text('Welcome to Clubland'), findsOneWidget);
      expect(find.text('Sign in to access premium clubs worldwide'),
          findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(2)); // Email & Password
      expect(find.text('Sign In'), findsOneWidget);
      expect(find.text('Forgot Password?'), findsOneWidget);
      expect(find.text('Continue with Hanko'), findsOneWidget);
      expect(find.text("Don't have an account? "), findsOneWidget);
      expect(find.text('Sign Up'), findsOneWidget);
    });

    testWidgets('should validate email field when empty', (tester) async {
      // arrange
      when(() => mockGetCurrentUserUsecase())
          .thenAnswer((_) async => const Right(null));

      // act
      await tester.pumpApp(
        const LoginPage(),
        overrides: [
          getCurrentUserUsecaseProvider
              .overrideWithValue(mockGetCurrentUserUsecase),
        ],
      );
      await tester.pumpAndSettle();

      // Tap sign in without entering email
      await tester.tap(find.text('Sign In'));
      await tester.pumpAndSettle();

      // assert
      expect(find.text('Please enter your email'), findsOneWidget);
    });

    testWidgets('should validate email format', (tester) async {
      // arrange
      when(() => mockGetCurrentUserUsecase())
          .thenAnswer((_) async => const Right(null));

      // act
      await tester.pumpApp(
        const LoginPage(),
        overrides: [
          getCurrentUserUsecaseProvider
              .overrideWithValue(mockGetCurrentUserUsecase),
        ],
      );
      await tester.pumpAndSettle();

      // Enter invalid email
      await tester.enterText(find.byType(TextFormField).first, 'invalid-email');
      await tester.tap(find.text('Sign In'));
      await tester.pumpAndSettle();

      // assert
      expect(find.text('Please enter a valid email'), findsOneWidget);
    });

    testWidgets('should validate password field when empty', (tester) async {
      // arrange
      when(() => mockGetCurrentUserUsecase())
          .thenAnswer((_) async => const Right(null));

      // act
      await tester.pumpApp(
        const LoginPage(),
        overrides: [
          getCurrentUserUsecaseProvider
              .overrideWithValue(mockGetCurrentUserUsecase),
        ],
      );
      await tester.pumpAndSettle();

      // Enter email but not password
      await tester.enterText(
          find.byType(TextFormField).first, TestConstants.testEmail);
      await tester.tap(find.text('Sign In'));
      await tester.pumpAndSettle();

      // assert
      expect(find.text('Please enter your password'), findsOneWidget);
    });

    testWidgets('should validate password minimum length', (tester) async {
      // arrange
      when(() => mockGetCurrentUserUsecase())
          .thenAnswer((_) async => const Right(null));

      // act
      await tester.pumpApp(
        const LoginPage(),
        overrides: [
          getCurrentUserUsecaseProvider
              .overrideWithValue(mockGetCurrentUserUsecase),
        ],
      );
      await tester.pumpAndSettle();

      // Enter email and short password
      await tester.enterText(
          find.byType(TextFormField).first, TestConstants.testEmail);
      await tester.enterText(find.byType(TextFormField).at(1), '12345');
      await tester.tap(find.text('Sign In'));
      await tester.pumpAndSettle();

      // assert
      expect(find.text('Password must be at least 6 characters'),
          findsOneWidget);
    });

    testWidgets('should call login usecase when form is valid', (tester) async {
      // arrange
      when(() => mockGetCurrentUserUsecase())
          .thenAnswer((_) async => const Right(null));
      when(() => mockLoginUsecase(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => Right(testSession));

      // act
      await tester.pumpApp(
        const LoginPage(),
        overrides: [
          loginUsecaseProvider.overrideWithValue(mockLoginUsecase),
          getCurrentUserUsecaseProvider
              .overrideWithValue(mockGetCurrentUserUsecase),
        ],
      );
      await tester.pumpAndSettle();

      // Enter valid credentials
      await tester.enterText(
          find.byType(TextFormField).first, TestConstants.testEmail);
      await tester.enterText(
          find.byType(TextFormField).at(1), TestConstants.testPassword);

      // Tap sign in
      await tester.tap(find.text('Sign In'));
      await tester.pumpAndSettle();

      // assert
      verify(() => mockLoginUsecase(
            email: TestConstants.testEmail,
            password: TestConstants.testPassword,
          )).called(1);
    });

    testWidgets('should show loading state during login', (tester) async {
      // arrange
      when(() => mockGetCurrentUserUsecase())
          .thenAnswer((_) async => const Right(null));
      when(() => mockLoginUsecase(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer(
        (_) => Future.delayed(
          const Duration(milliseconds: 100),
          () => Right(testSession),
        ),
      );

      // act
      await tester.pumpApp(
        const LoginPage(),
        overrides: [
          loginUsecaseProvider.overrideWithValue(mockLoginUsecase),
          getCurrentUserUsecaseProvider
              .overrideWithValue(mockGetCurrentUserUsecase),
        ],
      );
      await tester.pumpAndSettle();

      // Enter valid credentials and tap sign in
      await tester.enterText(
          find.byType(TextFormField).first, TestConstants.testEmail);
      await tester.enterText(
          find.byType(TextFormField).at(1), TestConstants.testPassword);
      await tester.tap(find.text('Sign In'));
      await tester.pump();

      // assert - should show loading indicator
      expect(find.byType(CircularProgressIndicator), findsWidgets);
    });

    testWidgets('should trim email before login', (tester) async {
      // arrange
      when(() => mockGetCurrentUserUsecase())
          .thenAnswer((_) async => const Right(null));
      when(() => mockLoginUsecase(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => Right(testSession));

      // act
      await tester.pumpApp(
        const LoginPage(),
        overrides: [
          loginUsecaseProvider.overrideWithValue(mockLoginUsecase),
          getCurrentUserUsecaseProvider
              .overrideWithValue(mockGetCurrentUserUsecase),
        ],
      );
      await tester.pumpAndSettle();

      // Enter email with spaces
      await tester.enterText(
          find.byType(TextFormField).first, '  ${TestConstants.testEmail}  ');
      await tester.enterText(
          find.byType(TextFormField).at(1), TestConstants.testPassword);
      await tester.tap(find.text('Sign In'));
      await tester.pumpAndSettle();

      // assert - should call with trimmed email
      verify(() => mockLoginUsecase(
            email: TestConstants.testEmail,
            password: TestConstants.testPassword,
          )).called(1);
    });

    testWidgets('should call Hanko login when email is provided',
        (tester) async {
      // arrange
      when(() => mockGetCurrentUserUsecase())
          .thenAnswer((_) async => const Right(null));
      when(() => mockHankoLoginUsecase(email: any(named: 'email')))
          .thenAnswer((_) async => Right(testSession));

      // act
      await tester.pumpApp(
        const LoginPage(),
        overrides: [
          hankoLoginUsecaseProvider.overrideWithValue(mockHankoLoginUsecase),
          getCurrentUserUsecaseProvider
              .overrideWithValue(mockGetCurrentUserUsecase),
        ],
      );
      await tester.pumpAndSettle();

      // Enter email
      await tester.enterText(
          find.byType(TextFormField).first, TestConstants.testEmail);

      // Tap Hanko login
      await tester.tap(find.text('Continue with Hanko'));
      await tester.pumpAndSettle();

      // assert
      verify(() => mockHankoLoginUsecase(email: TestConstants.testEmail))
          .called(1);
    });

    testWidgets('should show error when Hanko login without email',
        (tester) async {
      // arrange
      when(() => mockGetCurrentUserUsecase())
          .thenAnswer((_) async => const Right(null));

      // act
      await tester.pumpApp(
        const LoginPage(),
        overrides: [
          getCurrentUserUsecaseProvider
              .overrideWithValue(mockGetCurrentUserUsecase),
        ],
      );
      await tester.pumpAndSettle();

      // Tap Hanko login without entering email
      await tester.tap(find.text('Continue with Hanko'));
      await tester.pumpAndSettle();

      // assert - should show snackbar error
      expect(find.text('Please enter your email first'), findsOneWidget);
    });

    testWidgets('should disable sign in button when loading', (tester) async {
      // arrange
      when(() => mockGetCurrentUserUsecase())
          .thenAnswer((_) async => const Right(null));
      when(() => mockLoginUsecase(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer(
        (_) => Future.delayed(
          const Duration(seconds: 1),
          () => Right(testSession),
        ),
      );

      // act
      await tester.pumpApp(
        const LoginPage(),
        overrides: [
          loginUsecaseProvider.overrideWithValue(mockLoginUsecase),
          getCurrentUserUsecaseProvider
              .overrideWithValue(mockGetCurrentUserUsecase),
        ],
      );
      await tester.pumpAndSettle();

      // Enter credentials and start login
      await tester.enterText(
          find.byType(TextFormField).first, TestConstants.testEmail);
      await tester.enterText(
          find.byType(TextFormField).at(1), TestConstants.testPassword);
      await tester.tap(find.text('Sign In'));
      await tester.pump();

      // Try to tap again while loading
      final signInButton = find.ancestor(
        of: find.text('Sign In'),
        matching: find.byType(ElevatedButton),
      );

      final button = tester.widget<ElevatedButton>(signInButton);
      expect(button.onPressed, isNull); // Button should be disabled
    });

    testWidgets('should handle login failure gracefully', (tester) async {
      // arrange
      when(() => mockGetCurrentUserUsecase())
          .thenAnswer((_) async => const Right(null));
      when(() => mockLoginUsecase(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => Left(AuthFailure.invalidCredentials()));

      // act
      await tester.pumpApp(
        const LoginPage(),
        overrides: [
          loginUsecaseProvider.overrideWithValue(mockLoginUsecase),
          getCurrentUserUsecaseProvider
              .overrideWithValue(mockGetCurrentUserUsecase),
        ],
      );
      await tester.pumpAndSettle();

      // Enter credentials and login
      await tester.enterText(
          find.byType(TextFormField).first, TestConstants.testEmail);
      await tester.enterText(
          find.byType(TextFormField).at(1), 'wrongpassword');
      await tester.tap(find.text('Sign In'));
      await tester.pumpAndSettle();

      // assert - page should still be rendered without crash
      expect(find.text('Welcome to Clubland'), findsOneWidget);
    });
  });
}
