import 'package:flutter/material.dart';

import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';
import 'app_button.dart';

/// Full-screen widget for displaying major application errors.
///
/// This provides a consistent layout for presenting an error icon, title,
/// message, and optional action buttons (retry, go home).
class ErrorPage extends StatelessWidget {
  /// Creates a general [ErrorPage] instance.
  const ErrorPage({
    required this.error,
    super.key,
    this.stackTrace,
    this.onRetry,
    this.retryText,
    this.title,
    this.icon,
  });

  /// Creates an [ErrorPage] specifically for **Network Connection** issues.
  const ErrorPage.network({
    super.key,
    this.error =
        'No internet connection. Please check your network and try again.',
    this.stackTrace,
    this.onRetry,
    this.retryText = 'Retry',
    this.title = 'Connection Error',
    this.icon = Icons.wifi_off,
  });

  /// Creates an [ErrorPage] specifically for **Server** issues (e.g., 500 errors).
  const ErrorPage.server({
    super.key,
    this.error = 'Something went wrong on our end. Please try again later.',
    this.stackTrace,
    this.onRetry,
    this.retryText = 'Try Again',
    this.title = 'Server Error',
    this.icon = Icons.error_outline,
  });

  /// Creates an [ErrorPage] specifically for **Not Found** issues (e.g., 404 errors).
  const ErrorPage.notFound({
    super.key,
    this.error = 'The page you are looking for could not be found.',
    this.stackTrace,
    this.onRetry,
    this.retryText = 'Go Home',
    this.title = 'Page Not Found',
    this.icon = Icons.search_off,
  });

  /// Creates an [ErrorPage] specifically for **Permission Denied** issues (e.g., 403 errors).
  const ErrorPage.permissionDenied({
    super.key,
    this.error = 'You do not have permission to access this page.',
    this.stackTrace,
    this.onRetry,
    this.retryText = 'Go Back',
    this.title = 'Access Denied',
    this.icon = Icons.lock_outline,
  });

  /// The main error message displayed to the user.
  final String error;

  /// Optional stack trace for debugging purposes. This is typically hidden in production.
  final StackTrace? stackTrace;

  /// Optional callback for the primary action button (e.g., Retry, Go Back).
  final VoidCallback? onRetry;

  /// The text to display on the primary action button.
  final String? retryText;

  /// The headline title of the error page.
  final String? title;

  /// The icon displayed prominently on the page.
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.pagePadding,
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: size.width * 0.8,
                maxHeight: size.height * 0.8,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Error Icon
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: colorScheme.errorContainer.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      icon ?? Icons.error_outline,
                      size: 60,
                      color: colorScheme.error,
                    ),
                  ),

                  AppSpacing.verticalSpaceXXL,

                  // Error Title
                  Text(
                    title ?? 'Oops! Something went wrong',
                    style: AppTextStyles.headlineMedium.copyWith(
                      color: colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  AppSpacing.verticalSpaceLG,

                  // Error Message
                  Text(
                    error,
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  AppSpacing.verticalSpaceXXL,

                  // Action Buttons
                  Column(
                    children: [
                      if (onRetry != null) ...[
                        SizedBox(
                          width: double.infinity,
                          child: AppButton.primary(
                            text: retryText ?? 'Try Again',
                            onPressed: onRetry,
                          ),
                        ),
                        AppSpacing.verticalSpaceLG,
                      ],
                      SizedBox(
                        width: double.infinity,
                        child: AppButton.outline(
                          text: 'Go Home',
                          onPressed: () => _goHome(context),
                        ),
                      ),
                    ],
                  ),

                  // Debug Information (only in debug mode)
                  if (stackTrace != null) ...[
                    AppSpacing.verticalSpaceXXL,
                    _buildDebugInfo(context),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the collapsible section containing the error stack trace and debug details.
  Widget _buildDebugInfo(BuildContext context) => Theme(
    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
    child: ExpansionTile(
      title: Text(
        'Debug Information',
        style: AppTextStyles.labelMedium.copyWith(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
      children: [
        Container(
          width: double.infinity,
          padding: AppSpacing.paddingLG,
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Error Details:',
                style: AppTextStyles.labelMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              AppSpacing.verticalSpaceXS,
              Text(
                error,
                style: AppTextStyles.bodySmall.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontFamily: 'monospace',
                ),
              ),
              if (stackTrace != null) ...[
                AppSpacing.verticalSpaceSM,
                Text(
                  'Stack Trace:',
                  style: AppTextStyles.labelMedium.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                AppSpacing.verticalSpaceXS,
                Container(
                  constraints: const BoxConstraints(maxHeight: 200),
                  child: SingleChildScrollView(
                    child: Text(
                      stackTrace.toString(),
                      style: AppTextStyles.bodySmall.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    ),
  );

  /// Navigates the user to the root path and removes all previous routes.
  void _goHome(BuildContext context) {
    // This would use the router to navigate home
    Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
  }
}

/// A smaller, focused widget for displaying network error status in lists or sections.
class NetworkErrorWidget extends StatelessWidget {
  /// Constructs a [NetworkErrorWidget].
  const NetworkErrorWidget({super.key, this.onRetry});

  /// Optional callback to execute when the user taps the retry button.
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.wifi_off,
          size: 64,
          color: Theme.of(context).colorScheme.error,
        ),
        AppSpacing.verticalSpaceLG,
        Text(
          'No Internet Connection',
          style: AppTextStyles.titleMedium,
          textAlign: TextAlign.center,
        ),
        AppSpacing.verticalSpaceSM,
        Text(
          'Please check your internet connection and try again.',
          style: AppTextStyles.bodyMedium.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
        if (onRetry != null) ...[
          AppSpacing.verticalSpaceLG,
          AppButton.primary(
            text: 'Retry',
            onPressed: onRetry,
            isFullWidth: false,
          ),
        ],
      ],
    ),
  );
}

/// A generic widget for displaying empty states (e.g., no items in a list).
class EmptyStateWidget extends StatelessWidget {
  /// Constructs an [EmptyStateWidget].
  const EmptyStateWidget({
    required this.title,
    required this.message,
    super.key,
    this.icon = Icons.inbox_outlined,
    this.actionText,
    this.onAction,
  });

  /// The main title of the empty state (e.g., "No Bookings Yet").
  final String title;

  /// A detailed message explaining the state and what the user can do next.
  final String message;

  /// The icon representing the empty state. Defaults to [Icons.inbox_outlined].
  final IconData icon;

  /// Optional text for the primary action button (e.g., "Start Booking").
  final String? actionText;

  /// The callback function executed when the action button is pressed.
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: AppSpacing.pagePadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 80,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          AppSpacing.verticalSpaceLG,
          Text(
            title,
            style: AppTextStyles.titleMedium,
            textAlign: TextAlign.center,
          ),
          AppSpacing.verticalSpaceSM,
          Text(
            message,
            style: AppTextStyles.bodyMedium.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          if (actionText != null && onAction != null) ...[
            AppSpacing.verticalSpaceLG,
            AppButton.primary(
              text: actionText!,
              onPressed: onAction,
              isFullWidth: false,
            ),
          ],
        ],
      ),
    ),
  );
}

/// A compact widget for displaying errors that occur during loading specific data sections.
class LoadingErrorWidget extends StatelessWidget {
  /// Constructs a [LoadingErrorWidget].
  const LoadingErrorWidget({required this.error, super.key, this.onRetry});

  /// The error message detailing what went wrong during the data load.
  final String error;

  /// Optional callback to execute when the user taps the retry button.
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) => Padding(
    padding: AppSpacing.paddingLG,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error_outline,
          size: 48,
          color: Theme.of(context).colorScheme.error,
        ),
        AppSpacing.verticalSpaceMD,
        Text(
          'Something went wrong',
          style: AppTextStyles.titleSmall,
          textAlign: TextAlign.center,
        ),
        AppSpacing.verticalSpaceXS,
        Text(
          error,
          style: AppTextStyles.bodySmall.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        if (onRetry != null) ...[
          AppSpacing.verticalSpaceMD,
          AppButton.outline(
            text: 'Retry',
            onPressed: onRetry,
            size: AppButtonSize.small,
            isFullWidth: false,
          ),
        ],
      ],
    ),
  );
}
