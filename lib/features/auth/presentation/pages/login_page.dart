import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/design_system/design_system.dart';
import '../controllers/auth_controller.dart';

/// Login page for user authentication
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    final authController = ref.read(authControllerProvider.notifier);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.pagePadding,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AppSpacing.verticalSpaceXXXL,

                        // Logo and Title
                        Column(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: colorScheme.primary,
                                borderRadius: BorderRadius.circular(AppSizing.radiusLG),
                              ),
                              child: Icon(
                                Icons.location_city,
                                size: 40,
                                color: colorScheme.onPrimary,
                              ),
                            ),
                            AppSpacing.verticalSpaceLG,
                            Text(
                              'Welcome to Clubland',
                              style: AppTextStyles.headlineMedium.copyWith(
                                color: colorScheme.onBackground,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            AppSpacing.verticalSpaceSM,
                            Text(
                              'Sign in to access premium clubs worldwide',
                              style: AppTextStyles.bodyLarge.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),

                        AppSpacing.verticalSpaceXXXL,

                        // Email Field
                        AppInputField.email(
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!value.contains('@')) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),

                        AppSpacing.verticalSpaceLG,

                        // Password Field
                        AppInputField.password(
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),

                        AppSpacing.verticalSpaceMD,

                        // Forgot Password
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // Navigate to forgot password
                            },
                            child: Text(
                              'Forgot Password?',
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: colorScheme.primary,
                              ),
                            ),
                          ),
                        ),

                        AppSpacing.verticalSpaceXXL,

                        // Login Button
                        AppButton.primary(
                          text: 'Sign In',
                          isLoading: authState.isLoading,
                          onPressed: authState.isLoading ? null : _handleLogin,
                        ),

                        AppSpacing.verticalSpaceLG,

                        // Divider
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: colorScheme.outline.withOpacity(0.3),
                              ),
                            ),
                            Padding(
                              padding: AppSpacing.horizontalSpaceMD,
                              child: Text(
                                'or',
                                style: AppTextStyles.bodySmall.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: colorScheme.outline.withOpacity(0.3),
                              ),
                            ),
                          ],
                        ),

                        AppSpacing.verticalSpaceLG,

                        // Hanko Auth Button
                        AppButton.outline(
                          text: 'Continue with Hanko',
                          leading: Icon(
                            Icons.fingerprint,
                            size: AppSizing.iconMD,
                          ),
                          onPressed: _handleHankoLogin,
                        ),
                      ],
                    ),
                  ),
                ),

                // Sign Up Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account? ',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to register
                      },
                      child: Text(
                        'Sign Up',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      await ref.read(authControllerProvider.notifier).login(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
    }
  }

  void _handleHankoLogin() async {
    if (_emailController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your email first'),
        ),
      );
      return;
    }

    await ref.read(authControllerProvider.notifier).loginWithHanko(
      email: _emailController.text.trim(),
    );
  }
}