import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../generated/l10n/l10n.dart';

class ActivityFeedWidget extends ConsumerWidget {
  const ActivityFeedWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // For now, show a simple placeholder
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.timeline, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          Text(
            S.of(context).activityFeed,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            S.of(context).activityHistoryPlaceholder,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// Simple activity tile widget
class ActivityTile extends StatelessWidget {
  const ActivityTile({required this.activity, this.compact = false, super.key});

  final SimpleActivity activity;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        _getActivityIcon(activity.type),
        color: Theme.of(context).colorScheme.primary,
      ),
      title: Text(activity.title),
      subtitle: Text(activity.description),
      trailing: compact
          ? null
          : Text(
              _formatDate(activity.timestamp),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
    );
  }

  IconData _getActivityIcon(String type) {
    switch (type) {
      case 'visit':
        return Icons.location_on;
      case 'review':
        return Icons.rate_review;
      case 'favorite':
        return Icons.favorite;
      case 'checkin':
        return Icons.check_circle;
      default:
        return Icons.timeline;
    }
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}

// Simple activity data class
class SimpleActivity {
  const SimpleActivity({
    required this.id,
    required this.type,
    required this.title,
    required this.description,
    required this.timestamp,
  });

  final String id;
  final String type;
  final String title;
  final String description;
  final DateTime timestamp;
}
