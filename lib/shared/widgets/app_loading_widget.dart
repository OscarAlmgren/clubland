import 'package:flutter/material.dart';

/// A standard widget for displaying a loading spinner and an optional message.
///
/// This is typically used to indicate that data is being fetched or an operation is in progress.
class AppLoadingWidget extends StatelessWidget {
  /// Constructs an [AppLoadingWidget].
  const AppLoadingWidget({this.message, super.key});

  /// An optional message string to display below the loading indicator.
  final String? message;

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(),
        if (message != null) ...[
          const SizedBox(height: 16),
          Text(
            message!,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ],
    ),
  );
}
