import 'package:flutter/material.dart';

import '../../core/errors/exceptions.dart' as app_exceptions;

/// A standard widget for displaying error messages to the user.
///
/// It intelligently parses the error and displays a user-friendly message.
/// It also provides an optional 'Try Again' button for retrying the failed action.
class AppErrorWidget extends StatelessWidget {
  /// Constructs an [AppErrorWidget].
  const AppErrorWidget({required this.error, this.onRetry, super.key});

  /// The error object to be displayed.
  final Object error;

  /// An optional callback to be executed when the 'Try Again' button is pressed.
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final errorMessage = _getFriendlyErrorMessage(error);

    return Center(
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
              errorMessage['title']!,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              errorMessage['subtitle']!,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Try Again'),
              ),
            ],
          ],
        ),
      ),
    );
  }

  /// Returns a user-friendly error message based on the error type.
  Map<String, String> _getFriendlyErrorMessage(Object err) {
    if (err is app_exceptions.NetworkException) {
      switch (err.code) {
        case 'NO_DATA':
          return {
            'title': 'No Data Found',
            'subtitle': 'The requested information could not be located. Please try again later.',
          };
        case 'NOT_FOUND':
          return {
            'title': 'Not Found',
            'subtitle': 'The item you are looking for does not exist.',
          };
        case 'UNAUTHORIZED':
          return {
            'title': 'Session Expired',
            'subtitle': 'Your session has expired. Please log in again to continue.',
          };
        default:
          return {
            'title': 'Network Error',
            'subtitle': 'Could not connect to our servers. Please check your internet connection and try again.',
          };
      }
    } else {
      return {
        'title': 'An Unexpected Error Occurred',
        'subtitle': 'We are sorry, but something went wrong. Please try again later.',
      };
    }
  }
}
