import 'package:intl/intl.dart';

import '../../../../core/design_system/design_system.dart';
import '../../../../core/graphql/graphql_api.dart';
import '../../../events/domain/entities/event_entity.dart';

/// Enhanced event card for news feed with attendance markers
class NewsFeedEventCard extends StatelessWidget {
  /// Event to display
  final EventEntity event;

  /// User's RSVP response (null if not RSVP'd)
  final Enum$RSVPResponse? userRSVPResponse;

  /// Callback when card is tapped
  final VoidCallback? onTap;

  /// Callback when RSVP button is tapped
  final VoidCallback? onRSVPTap;

  const NewsFeedEventCard({
    required this.event,
    this.userRSVPResponse,
    this.onTap,
    this.onRSVPTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateFormat = DateFormat('MMM d, y');
    final timeFormat = DateFormat('h:mm a');

    final bool isAttending = userRSVPResponse == Enum$RSVPResponse.YES;
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

                  // Attending marker (green) - WCAG AAA compliant
                  if (isAttending)
                    _buildBadge(
                      label: 'ATTENDING',
                      icon: Icons.check_circle,
                      color: AppColors.success,
                      theme: theme,
                    ),

                  // Full booked marker (red) - WCAG AAA compliant
                  if (isFull)
                    _buildBadge(
                      label: 'FULLBOKAD',
                      icon: Icons.cancel,
                      color: AppColors.error,
                      theme: theme,
                    ),

                  // Full house exclusive marker - WCAG AAA compliant
                  if (event.fullHouseExclusive)
                    _buildBadge(
                      label: 'FULL HOUSE EXCLUSIVE',
                      icon: Icons.stars,
                      color: AppColors.getEventTypeColor('cultural'),
                      theme: theme,
                    ),

                  // Others welcome marker (opposite of members only) - WCAG AAA compliant
                  if (event.guestPolicy != Enum$GuestPolicy.NO_GUESTS &&
                      event.guestPolicy != Enum$GuestPolicy.MEMBERS_ONLY)
                    _buildBadge(
                      label: 'OTHERS WELCOME',
                      icon: Icons.people,
                      color: AppColors.info,
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
                      color: theme.colorScheme.onSurface,
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
                  if (event.location case final location?)
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
                            location,
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
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurface,
                      ),
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
    // All badge colors are WCAG AAA compliant with white text (7:1+ contrast)
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: theme.colorScheme.onPrimary),
          const SizedBox(width: 4),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onPrimary,
              fontWeight: FontWeight.w600,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  /// Returns WCAG AAA compliant color for event type badges.
  Color _getEventTypeColor(Enum$ClubEventType type) {
    switch (type) {
      case Enum$ClubEventType.SOCIAL:
        return AppColors.getEventTypeColor('social');
      case Enum$ClubEventType.NETWORKING:
        return AppColors.getEventTypeColor('networking');
      case Enum$ClubEventType.EDUCATIONAL:
        return AppColors.getEventTypeColor('educational');
      case Enum$ClubEventType.SPORTING:
        return AppColors.getEventTypeColor('sports');
      case Enum$ClubEventType.CULTURAL:
        return AppColors.getEventTypeColor('cultural');
      case Enum$ClubEventType.FUNDRAISING:
        return AppColors.getEventTypeColor('cultural');
      case Enum$ClubEventType.MEETING:
        return AppColors.getEventTypeColor('networking');
      case Enum$ClubEventType.OTHER:
      case Enum$ClubEventType.$unknown:
        return AppColors.getEventTypeColor('social');
    }
  }
}
