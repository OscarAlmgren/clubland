import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/event_entity.dart';
import 'capacity_indicator.dart';
import 'rsvp_status_badge.dart';

/// Event summary card widget for list views
class EventCard extends StatelessWidget {
  /// Event entity to display
  final EventEntity event;

  /// Optional RSVP status for the current user
  final String? userRSVPStatus;

  /// Callback when card is tapped
  final VoidCallback? onTap;

  /// Whether to show capacity indicator
  final bool showCapacity;

  /// Whether to show RSVP status badge
  final bool showRSVPStatus;

  const EventCard({
    required this.event,
    this.userRSVPStatus,
    this.onTap,
    this.showCapacity = true,
    this.showRSVPStatus = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateFormat = DateFormat('MMM d, y');
    final timeFormat = DateFormat('h:mm a');

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event type and RSVP status header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: _getEventTypeColor(event.eventType).withOpacity(0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Event type badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: _getEventTypeColor(event.eventType),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      _getEventTypeLabel(event.eventType),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  // User's RSVP status badge
                  if (showRSVPStatus && userRSVPStatus != null)
                    RSVPStatusBadge(status: userRSVPStatus!),
                ],
              ),
            ),

            // Event details
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Event title
                  Text(
                    event.title,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 8),

                  // Date and time
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 16,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        dateFormat.format(event.startTime),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Icon(
                        Icons.access_time,
                        size: 16,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        timeFormat.format(event.startTime),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Location
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 16,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          event.location,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  // Description (if available)
                  if (event.description.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    Text(
                      event.description,
                      style: theme.textTheme.bodyMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],

                  // Capacity indicator
                  if (showCapacity && event.capacity != null) ...[
                    const SizedBox(height: 16),
                    CapacityIndicator(
                      currentAttendees: event.currentAttendees,
                      capacity: event.capacity!,
                      showLabel: true,
                    ),
                  ],

                  // Payment indicator
                  if (event.requiresPayment) ...[
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(
                          Icons.payment,
                          size: 16,
                          color: theme.colorScheme.primary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Payment required: \$${event.paymentAmount?.toStringAsFixed(2) ?? '0.00'}',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],

                  // Requires approval indicator
                  if (event.requiresApproval) ...[
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.verified_user,
                          size: 16,
                          color: theme.colorScheme.secondary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Approval required',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.secondary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getEventTypeColor(EventType type) {
    switch (type) {
      case EventType.social:
        return Colors.blue;
      case EventType.dining:
        return Colors.orange;
      case EventType.sports:
        return Colors.green;
      case EventType.cultural:
        return Colors.purple;
      case EventType.educational:
        return Colors.teal;
      case EventType.networking:
        return Colors.indigo;
      case EventType.family:
        return Colors.pink;
      case EventType.special:
        return Colors.red;
      case EventType.findingFriends:
        return Colors.amber;
    }
  }

  String _getEventTypeLabel(EventType type) {
    switch (type) {
      case EventType.social:
        return 'Social';
      case EventType.dining:
        return 'Dining';
      case EventType.sports:
        return 'Sports';
      case EventType.cultural:
        return 'Cultural';
      case EventType.educational:
        return 'Educational';
      case EventType.networking:
        return 'Networking';
      case EventType.family:
        return 'Family';
      case EventType.special:
        return 'Special';
      case EventType.findingFriends:
        return 'Finding Friends';
    }
  }
}
