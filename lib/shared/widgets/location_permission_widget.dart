import 'package:flutter/material.dart';

/// A widget designed to prompt the user for location access permission.
///
/// It displays an icon, a custom title, a description, and a button to initiate
/// the permission request process.
class LocationPermissionWidget extends StatelessWidget {
  /// Constructs a [LocationPermissionWidget].
  const LocationPermissionWidget({
    required this.title,
    required this.description,
    this.onPermissionRequested,
    super.key,
  });

  /// The main heading or title for the permission request message.
  final String title;

  /// The detailed description explaining why the permission is needed.
  final String description;

  /// The callback function executed when the user presses the 'Grant Permission' button.
  final VoidCallback? onPermissionRequested;

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.location_off,
            size: 64,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: onPermissionRequested,
            child: const Text('Grant Permission'),
          ),
        ],
      ),
    ),
  );
}
