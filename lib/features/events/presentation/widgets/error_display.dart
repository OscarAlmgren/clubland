import 'package:flutter/material.dart';

/// Reusable error display widget with retry functionality
class ErrorDisplay extends StatelessWidget {
  /// Error message to display
  final String message;

  /// Optional detailed error description
  final String? details;

  /// Callback for retry action
  final VoidCallback? onRetry;

  /// Whether to show retry button
  final bool showRetry;

  /// Custom icon
  final IconData? icon;

  const ErrorDisplay({
    required this.message,
    this.details,
    this.onRetry,
    this.showRetry = true,
    this.icon,
    super.key,
  });

  /// Factory constructor for network errors
  factory ErrorDisplay.network({
    VoidCallback? onRetry,
    Key? key,
  }) {
    return ErrorDisplay(
      message: 'Connection Error',
      details: 'Unable to connect to the server. Please check your internet connection and try again.',
      onRetry: onRetry,
      icon: Icons.signal_wifi_off,
      key: key,
    );
  }

  /// Factory constructor for server errors
  factory ErrorDisplay.server({
    VoidCallback? onRetry,
    String? details,
    Key? key,
  }) {
    return ErrorDisplay(
      message: 'Server Error',
      details: details ?? 'The server encountered an error. Please try again later.',
      onRetry: onRetry,
      icon: Icons.cloud_off,
      key: key,
    );
  }

  /// Factory constructor for not found errors
  factory ErrorDisplay.notFound({
    String? message,
    VoidCallback? onRetry,
    Key? key,
  }) {
    return ErrorDisplay(
      message: message ?? 'Not Found',
      details: 'The requested resource could not be found.',
      onRetry: onRetry,
      showRetry: false,
      icon: Icons.search_off,
      key: key,
    );
  }

  /// Factory constructor for unauthorized errors
  factory ErrorDisplay.unauthorized({
    VoidCallback? onRetry,
    Key? key,
  }) {
    return ErrorDisplay(
      message: 'Authentication Required',
      details: 'Please log in to access this content.',
      onRetry: onRetry,
      showRetry: false,
      icon: Icons.lock_outline,
      key: key,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Error icon
            Icon(
              icon ?? Icons.error_outline,
              size: 64,
              color: theme.colorScheme.error,
            ),

            const SizedBox(height: 24),

            // Error message
            Text(
              message,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.error,
              ),
              textAlign: TextAlign.center,
            ),

            if (details != null) ...[
              const SizedBox(height: 12),
              Text(
                details!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ],

            // Retry button
            if (showRetry && onRetry != null) ...[
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Compact error display for inline errors
class CompactErrorDisplay extends StatelessWidget {
  /// Error message to display
  final String message;

  /// Callback for retry action
  final VoidCallback? onRetry;

  const CompactErrorDisplay({
    required this.message,
    this.onRetry,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: theme.colorScheme.error,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.error_outline,
            color: theme.colorScheme.error,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onErrorContainer,
              ),
            ),
          ),
          if (onRetry != null) ...[
            const SizedBox(width: 12),
            IconButton(
              onPressed: onRetry,
              icon: Icon(
                Icons.refresh,
                color: theme.colorScheme.error,
              ),
              tooltip: 'Retry',
            ),
          ],
        ],
      ),
    );
  }
}

/// Empty state display for when there's no data
class EmptyStateDisplay extends StatelessWidget {
  /// Title message
  final String title;

  /// Optional description
  final String? description;

  /// Optional action button
  final Widget? action;

  /// Custom icon
  final IconData? icon;

  const EmptyStateDisplay({
    required this.title,
    this.description,
    this.action,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon ?? Icons.inbox,
              size: 64,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            if (description != null) ...[
              const SizedBox(height: 12),
              Text(
                description!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            if (action != null) ...[
              const SizedBox(height: 24),
              action!,
            ],
          ],
        ),
      ),
    );
  }
}
