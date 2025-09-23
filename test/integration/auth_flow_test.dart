import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../lib/core/design_system/widgets/app_button.dart';
import '../../lib/core/design_system/widgets/app_input_field.dart';
import '../../lib/features/auth/domain/entities/user.dart';
import '../../lib/features/auth/presentation/providers/auth_providers.dart';
import '../../lib/main.dart';
import '../helpers/mock_providers.dart';
import '../helpers/test_helpers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late MockLoginUseCase mockLoginUseCase;
  late MockLogoutUseCase mockLogoutUseCase;
  late MockRegisterUseCase mockRegisterUseCase;
  late MockRefreshTokenUseCase mockRefreshTokenUseCase;

  setUp(() async {
    TestHelpers.setupFallbackValues();
    mockLoginUseCase = MockLoginUseCase();
    mockLogoutUseCase = MockLogoutUseCase();
    mockRegisterUseCase = MockRegisterUseCase();
    mockRefreshTokenUseCase = MockRefreshTokenUseCase();
  });

  tearDown(() {
    MockProviders.reset();
  });

  group('Authentication Flow Integration Tests', () {
    const testUser = User(
      id: '123',
      email: TestConstants.testEmail,
      firstName: TestConstants.testFirstName,
      lastName: TestConstants.testLastName,
      isVerified: true,
    );

    testWidgets('Complete login flow', (tester) async {
      when(() => mockLoginUseCase(any())).thenAnswer(
        (_) async => const Right(testUser),
      );

      await tester.pumpWidget(
        createTestApp(
          child: const ClublandApp(),
          overrides: [
            loginUseCaseProvider.overrideWithValue(mockLoginUseCase),
            logoutUseCaseProvider.overrideWithValue(mockLogoutUseCase),
            registerUseCaseProvider.overrideWithValue(mockRegisterUseCase),
            refreshTokenUseCaseProvider.overrideWithValue(mockRefreshTokenUseCase),
          ],
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Welcome Back'), findsOneWidget);

      final emailField = find.byType(AppInputField).first;
      final passwordField = find.byType(AppInputField).last;

      await tester.enterText(emailField, TestConstants.testEmail);
      await tester.enterText(passwordField, TestConstants.testPassword);

      await tester.tap(find.widgetWithText(AppButton, 'Sign In'));
      await tester.pumpAndSettle();

      expect(find.text('Home'), findsOneWidget);
      verify(() => mockLoginUseCase(any())).called(1);
    });

    testWidgets('Complete registration flow', (tester) async {
      when(() => mockRegisterUseCase(any())).thenAnswer(
        (_) async => const Right(testUser),
      );

      await tester.pumpWidget(
        createTestApp(
          child: const ClublandApp(),
          overrides: [
            loginUseCaseProvider.overrideWithValue(mockLoginUseCase),
            logoutUseCaseProvider.overrideWithValue(mockLogoutUseCase),
            registerUseCaseProvider.overrideWithValue(mockRegisterUseCase),
            refreshTokenUseCaseProvider.overrideWithValue(mockRefreshTokenUseCase),
          ],
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.text('Sign Up'));
      await tester.pumpAndSettle();

      expect(find.text('Join Clubland'), findsOneWidget);

      final inputFields = find.byType(AppInputField);
      await tester.enterText(inputFields.at(0), TestConstants.testFirstName);
      await tester.enterText(inputFields.at(1), TestConstants.testLastName);
      await tester.enterText(inputFields.at(2), TestConstants.testEmail);
      await tester.enterText(inputFields.at(3), TestConstants.testPassword);
      await tester.enterText(inputFields.at(4), TestConstants.testPassword);

      await tester.tap(find.widgetWithText(AppButton, 'Create Account'));
      await tester.pumpAndSettle();

      expect(find.text('Home'), findsOneWidget);
      verify(() => mockRegisterUseCase(any())).called(1);
    });

    testWidgets('Logout flow', (tester) async {
      when(() => mockLoginUseCase(any())).thenAnswer(
        (_) async => const Right(testUser),
      );
      when(() => mockLogoutUseCase()).thenAnswer(
        (_) async => const Right(unit),
      );

      await tester.pumpWidget(
        createTestApp(
          child: const ClublandApp(),
          overrides: [
            loginUseCaseProvider.overrideWithValue(mockLoginUseCase),
            logoutUseCaseProvider.overrideWithValue(mockLogoutUseCase),
            registerUseCaseProvider.overrideWithValue(mockRegisterUseCase),
            refreshTokenUseCaseProvider.overrideWithValue(mockRefreshTokenUseCase),
          ],
        ),
      );

      await tester.pumpAndSettle();

      final emailField = find.byType(AppInputField).first;
      final passwordField = find.byType(AppInputField).last;

      await tester.enterText(emailField, TestConstants.testEmail);
      await tester.enterText(passwordField, TestConstants.testPassword);

      await tester.tap(find.widgetWithText(AppButton, 'Sign In'));
      await tester.pumpAndSettle();

      expect(find.text('Home'), findsOneWidget);

      await tester.tap(find.text('Profile'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Sign Out'));
      await tester.pumpAndSettle();

      expect(find.text('Welcome Back'), findsOneWidget);
      verify(() => mockLogoutUseCase()).called(1);
    });

    testWidgets('Navigation between main tabs', (tester) async {
      when(() => mockLoginUseCase(any())).thenAnswer(
        (_) async => const Right(testUser),
      );

      await tester.pumpWidget(
        createTestApp(
          child: const ClublandApp(),
          overrides: [
            loginUseCaseProvider.overrideWithValue(mockLoginUseCase),
            logoutUseCaseProvider.overrideWithValue(mockLogoutUseCase),
            registerUseCaseProvider.overrideWithValue(mockRegisterUseCase),
            refreshTokenUseCaseProvider.overrideWithValue(mockRefreshTokenUseCase),
          ],
        ),
      );

      await tester.pumpAndSettle();

      final emailField = find.byType(AppInputField).first;
      final passwordField = find.byType(AppInputField).last;

      await tester.enterText(emailField, TestConstants.testEmail);
      await tester.enterText(passwordField, TestConstants.testPassword);

      await tester.tap(find.widgetWithText(AppButton, 'Sign In'));
      await tester.pumpAndSettle();

      expect(find.text('Home'), findsOneWidget);

      await tester.tap(find.text('Clubs'));
      await tester.pumpAndSettle();
      expect(find.text('Clubs'), findsOneWidget);

      await tester.tap(find.text('Bookings'));
      await tester.pumpAndSettle();
      expect(find.text('My Bookings'), findsOneWidget);

      await tester.tap(find.text('Profile'));
      await tester.pumpAndSettle();
      expect(find.text('Profile'), findsOneWidget);

      await tester.tap(find.text('Home'));
      await tester.pumpAndSettle();
      expect(find.text('Home'), findsOneWidget);
    });
  });
}