import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/design_system/design_system.dart';
import '../../../events/domain/entities/event_entity.dart';

/// Enhanced event card for news feed with attendance markers
class NewsFeedEventCard extends StatelessWidget {
  /// Event to display
  final EventEntity event;

  /// User's RSVP status (null if not attending)
  final String? userRSVPStatus;

  /// Callback when card is tapped
  final VoidCallback? onTap;

  /// Callback when RSVP button is tapped
  final VoidCallback? onRSVPTap;

  const NewsFeedEventCard({
    required this.event,
    this.userRSVPStatus,
    this.onTap,
    this.onRSVPTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateFormat = DateFormat('MMM d, y');
    final timeFormat = DateFormat('h:mm a');

    final bool isAttending = userRSVPStatus?.toLowerCase() == 'confirmed';
    final bool isFull = event.isFull;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with event type and status markers
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: _getEventTypeColor(event.eventType).withValues(alpha: .1),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  // Event type badge
                  _buildBadge(
                    label: 'EVENT',
                    icon: Icons.event,
                    color: _getEventTypeColor(event.eventType),
                    theme: theme,
                  ),

                  // Attending marker (green)
                  if (isAttending)
                    _buildBadge(
                      label: 'ATTENDING',
                      icon: Icons.check_circle,
                      color: Colors.green,
                      theme: theme,
                    ),

                  // Full booked marker (red)
                  if (isFull)
                    _buildBadge(
                      label: 'FULLBOKAD',
                      icon: Icons.cancel,
                      color: Colors.red,
                      theme: theme,
                    ),

                  // Full house exclusive marker
                  if (event.fullHouseExclusive)
                    _buildBadge(
                      label: 'FULL HOUSE EXCLUSIVE',
                      icon: Icons.stars,
                      color: Colors.purple,
                      theme: theme,
                    ),

                  // Others welcome marker (opposite of members only)
                  if (event.guestPolicy != GuestPolicy.noGuests &&
                      event.guestPolicy != GuestPolicy.membersOnly)
                    _buildBadge(
                      label: 'OTHERS WELCOME',
                      icon: Icons.people,
                      color: Colors.blue,
                      theme: theme,
                    ),
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

                  AppSpacing.verticalSpaceSM,

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
                        '${timeFormat.format(event.startTime)} - ${timeFormat.format(event.endTime)}',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),

                  AppSpacing.verticalSpaceSM,

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

                  // Description
                  if (event.description.isNotEmpty) ...[
                    AppSpacing.verticalSpaceSM,
                    Text(
                      event.description,
                      style: theme.textTheme.bodyMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],

                  // Capacity info
                  if (event.capacity != null) ...[
                    AppSpacing.verticalSpaceSM,
                    Row(
                      children: [
                        Icon(
                          Icons.people,
                          size: 16,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${event.currentAttendees}/${event.capacity} attending',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        if (event.availableSpots > 0) ...[
                          const SizedBox(width: 8),
                          Text(
                            '• ${event.availableSpots} spots left',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],

                  // RSVP button if not attending
                  if (!isAttending && !isFull) ...[
                    AppSpacing.verticalSpaceMD,
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: onRSVPTap,
                        icon: const Icon(Icons.how_to_reg, size: 18),
                        label: const Text('RSVP'),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
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

  Widget _buildBadge({
    required String label,
    required IconData icon,
    required Color color,
    required ThemeData theme,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: Colors.white),
          const SizedBox(width: 4),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 11,
            ),
          ),
        ],
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
}
