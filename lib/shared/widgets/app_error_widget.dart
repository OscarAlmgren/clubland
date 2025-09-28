import 'package:flutter/material.dart';

/// A standard widget for displaying error messages to the user.
///
/// It shows an error icon, a fixed message, the specific error text,
/// and an optional 'Try Again' button if an [onRetry] callback is provided.
class AppErrorWidget extends StatelessWidget {
  /// Constructs an [AppErrorWidget].
  const AppErrorWidget({required this.error, this.onRetry, super.key});

  /// The specific error message string to display to the user.
  final String error;

  /// An optional callback function to be executed when the user taps the 'Try Again' button.
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(height: 16),
          Text(
            'Something went wrong',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            error,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          if (onRetry != null) ...[
            const SizedBox(height: 24),
            ElevatedButton(onPressed: onRetry, child: const Text('Try Again')),
          ],
        ],
      ),
    ),
  );
}
