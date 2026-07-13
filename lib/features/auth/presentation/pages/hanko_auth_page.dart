import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/route_paths.dart';
import '../../../../core/errors/failures.dart';
import '../controllers/auth_controller.dart';

/// Executes the Hanko passkey login flow and navigates on success.
///
/// Accepts [email] and [clubSlug] as route extras. The WebAuthn platform
/// dialog is triggered automatically — this page shows progress and handles
/// errors.
class HankoAuthPage extends ConsumerStatefulWidget {
  const HankoAuthPage({required this.email, required this.clubSlug, super.key});

  final String email;
  final String clubSlug;

  @override
  ConsumerState<HankoAuthPage> createState() => _HankoAuthPageState();
}

class _HankoAuthPageState extends ConsumerState<HankoAuthPage> {
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    // Trigger the passkey flow as soon as the page is shown
    WidgetsBinding.instance.addPostFrameCallback((_) => _attemptLogin());
  }

  Future<void> _attemptLogin() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final result = await ref
        .read(authControllerProvider.notifier)
        .loginWithHanko(email: widget.email, clubSlug: widget.clubSlug);

    if (!mounted) return;

    result.fold(
      (Failure failure) {
        // Cancelled by user — go back to login instead of showing error
        if (failure.code == 'PASSKEY_CANCELLED') {
          context.pop();
          return;
        }
        setState(() {
          _isLoading = false;
          _errorMessage = failure.message;
        });
      },
      (_) {
        // Success — navigate to home
        context.go(RoutePaths.home);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: !_isLoading,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: _isLoading ? _buildLoading(theme) : _buildError(theme),
        ),
      ),
    );
  }

  Widget _buildLoading(ThemeData theme) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      const CircularProgressIndicator(),
      const SizedBox(height: 24),
      Text(
        'Waiting for your passkey…',
        style: theme.textTheme.titleMedium,
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 8),
      Text(
        'Use Face ID, Touch ID, or your security key when prompted.',
        style: theme.textTheme.bodySmall,
        textAlign: TextAlign.center,
      ),
    ],
  );

  Widget _buildError(ThemeData theme) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.error_outline, size: 56, color: theme.colorScheme.error),
      const SizedBox(height: 16),
      Text('Sign-in failed', style: theme.textTheme.titleLarge),
      const SizedBox(height: 8),
      Text(
        _errorMessage ?? 'An unexpected error occurred.',
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
        ),
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 32),
      ElevatedButton.icon(
        onPressed: _attemptLogin,
        icon: const Icon(Icons.refresh),
        label: const Text('Try Again'),
      ),
      const SizedBox(height: 12),
      TextButton(
        onPressed: () => context.pop(),
        child: const Text('Back to Login'),
      ),
    ],
  );
}
