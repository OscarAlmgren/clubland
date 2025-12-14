import '../../../../core/design_system/design_system.dart';

/// Capacity indicator widget showing event attendance progress
class CapacityIndicator extends StatelessWidget {
  /// Current number of attendees
  final int currentAttendees;

  /// Maximum capacity
  final int capacity;

  /// Whether to show label text
  final bool showLabel;

  /// Height of the progress bar
  final double? height;

  const CapacityIndicator({
    required this.currentAttendees,
    required this.capacity,
    this.showLabel = true,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final progress = capacity > 0 ? currentAttendees / capacity : 0.0;
    final availableSpots = capacity - currentAttendees;
    final isFull = availableSpots <= 0;
    final isNearlyFull = progress >= 0.8;

    // Determine color based on capacity - WCAG AAA compliant
    final color = isFull
        ? AppColors.error // 7.56:1 contrast
        : isNearlyFull
            ? AppColors.warning // 7.81:1 contrast
            : AppColors.success; // 7.23:1 contrast

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showLabel)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  isFull
                      ? 'Event Full'
                      : '$availableSpots spot${availableSpots == 1 ? '' : 's'} available',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '$currentAttendees / $capacity',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: theme.colorScheme.surfaceContainerHighest,
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: height ?? 8,
          ),
        ),
      ],
    );
  }
}

/// Compact capacity indicator for smaller spaces
class CompactCapacityIndicator extends StatelessWidget {
  /// Current number of attendees
  final int currentAttendees;

  /// Maximum capacity
  final int capacity;

  const CompactCapacityIndicator({
    required this.currentAttendees,
    required this.capacity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final availableSpots = capacity - currentAttendees;
    final isFull = availableSpots <= 0;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          isFull ? Icons.event_busy : Icons.people,
          size: 16,
          color: isFull ? AppColors.error : theme.colorScheme.primary,
        ),
        const SizedBox(width: 4),
        Text(
          '$currentAttendees/$capacity',
          style: theme.textTheme.bodySmall?.copyWith(
            color: isFull ? AppColors.error : theme.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
