import 'package:flutter/material.dart';

class LocationPermissionWidget extends StatelessWidget {
  const LocationPermissionWidget({
    required this.title,
    required this.description,
    this.onPermissionRequested,
    super.key,
  });

  final String title;
  final String description;
  final VoidCallback? onPermissionRequested;

  @override
  Widget build(BuildContext context) {
    return Center(
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
}