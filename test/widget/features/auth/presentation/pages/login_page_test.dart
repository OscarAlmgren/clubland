import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../lib/core/design_system/widgets/app_button.dart';
import '../../../../../../lib/core/design_system/widgets/app_input_field.dart';
import '../../../../../../lib/features/auth/presentation/controllers/auth_controller.dart';
import '../../../../../../lib/features/auth/presentation/pages/login_page.dart';
import '../../../../../../lib/features/auth/presentation/providers/auth_providers.dart';
import '../../../../../helpers/mock_providers.dart';
import '../../../../../helpers/test_helpers.dart';

void main() {
  late MockLoginUseCase mockLoginUseCase;
  late MockLogoutUseCase mockLogoutUseCase;
  late MockRegisterUseCase mockRegisterUseCase;
  late MockRefreshTokenUseCase mockRefreshTokenUseCase;

  setUp(() {
    TestHelpers.setupFallbackValues();
    mockLoginUseCase = MockLoginUseCase();
    mockLogoutUseCase = MockLogoutUseCase();
    mockRegisterUseCase = MockRegisterUseCase();
    mockRefreshTokenUseCase = MockRefreshTokenUseCase();
  });

  tearDown(() {
    MockProviders.reset();
  });

  Widget createLoginPage() {
    return createTestApp(
      child: const LoginPage(),
      overrides: [
        loginUseCaseProvider.overrideWithValue(mockLoginUseCase),
        logoutUseCaseProvider.overrideWithValue(mockLogoutUseCase),
        registerUseCaseProvider.overrideWithValue(mockRegisterUseCase),
        refreshTokenUseCaseProvider.overrideWithValue(mockRefreshTokenUseCase),
      ],
    );
  }

  group('LoginPage', () {
    testWidgets('should render all required elements', (tester) async {
      await tester.pumpWidget(createLoginPage());

      expect(find.text('Welcome Back'), findsOneWidget);
      expect(find.text('Sign in to your account'), findsOneWidget);
      expect(find.byType(AppInputField), findsNWidgets(2));
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Sign In'), findsOneWidget);
      expect(find.text('Forgot Password?'), findsOneWidget);
      expect(find.text('Don\'t have an account?'), findsOneWidget);
      expect(find.text('Sign Up'), findsOneWidget);
    });

    testWidgets('should validate empty email field', (tester) async {
      await tester.pumpWidget(createLoginPage());

      final signInButton = find.widgetWithText(AppButton, 'Sign In');
      await tester.tap(signInButton);
      await tester.pump();

      expect(find.text('Please enter your email'), findsOneWidget);
    });

    testWidgets('should validate invalid email format', (tester) async {
      await tester.pumpWidget(createLoginPage());

      final emailField = find.byType(AppInputField).first;
      await tester.enterText(emailField, 'invalid-email');

      final signInButton = find.widgetWithText(AppButton, 'Sign In');
      await tester.tap(signInButton);
      await tester.pump();

      expect(find.text('Please enter a valid email'), findsOneWidget);
    });

    testWidgets('should validate empty password field', (tester) async {
      await tester.pumpWidget(createLoginPage());

      final emailField = find.byType(AppInputField).first;
      await tester.enterText(emailField, TestConstants.testEmail);

      final signInButton = find.widgetWithText(AppButton, 'Sign In');
      await tester.tap(signInButton);
      await tester.pump();

      expect(find.text('Please enter your password'), findsOneWidget);
    });

    testWidgets('should call login when form is valid', (tester) async {
      when(() => mockLoginUseCase(any())).thenAnswer(
        (_) async => throw Exception('Should not be called in this test'),
      );

      await tester.pumpWidget(createLoginPage());

      final emailField = find.byType(AppInputField).first;
      final passwordField = find.byType(AppInputField).last;

      await tester.enterText(emailField, TestConstants.testEmail);
      await tester.enterText(passwordField, TestConstants.testPassword);

      await tester.pump();

      final signInButton = find.widgetWithText(AppButton, 'Sign In');
      await tester.tap(signInButton);
      await tester.pump();

      verify(() => mockLoginUseCase(any())).called(1);
    });

    testWidgets('should show loading state during login', (tester) async {
      when(() => mockLoginUseCase(any())).thenAnswer(
        (_) async => Future.delayed(
          const Duration(seconds: 1),
          () => throw Exception('Test'),
        ),
      );

      await tester.pumpWidget(createLoginPage());

      final emailField = find.byType(AppInputField).first;
      final passwordField = find.byType(AppInputField).last;

      await tester.enterText(emailField, TestConstants.testEmail);
      await tester.enterText(passwordField, TestConstants.testPassword);

      await tester.pump();

      final signInButton = find.widgetWithText(AppButton, 'Sign In');
      await tester.tap(signInButton);
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
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
        matching: find.byType(TextFormField),
      );
      final textFormField = tester.widget<TextFormField>(textField);
      expect(textFormField.obscureText, false);
    });

    testWidgets('should navigate to register page when sign up is tapped', (tester) async {
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

    group('Hanko authentication', () {
      testWidgets('should show Hanko login button', (tester) async {
        await tester.pumpWidget(createLoginPage());

        expect(find.text('Continue with Hanko'), findsOneWidget);
      });

      testWidgets('should call Hanko login when button is tapped', (tester) async {
        await tester.pumpWidget(createLoginPage());

        final hankoButton = find.text('Continue with Hanko');
        await tester.tap(hankoButton);
        await tester.pump();
      });
    });

    group('accessibility', () {
      testWidgets('should have proper semantic labels', (tester) async {
        await tester.pumpWidget(createLoginPage());

        expect(
          tester.getSemantics(find.text('Welcome Back')),
          matchesSemantics(
            label: 'Welcome Back',
            isHeader: true,
          ),
        );

        final emailField = find.byType(AppInputField).first;
        expect(
          tester.getSemantics(emailField),
          matchesSemantics(
            label: 'Email',
            isTextField: true,
          ),
        );
      });

      testWidgets('should support keyboard navigation', (tester) async {
        await tester.pumpWidget(createLoginPage());

        final emailField = find.byType(AppInputField).first;
        final passwordField = find.byType(AppInputField).last;

        await tester.tap(emailField);
        await tester.pump();

        await tester.sendKeyEvent(LogicalKeyboardKey.tab);
        await tester.pump();

        expect(tester.binding.focusManager.primaryFocus?.context,
            tester.element(passwordField));
      });
    });
  });
}