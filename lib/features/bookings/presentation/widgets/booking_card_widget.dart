import '../../../../core/design_system/design_system.dart';
import '../../../../core/graphql/graphql_api.dart';
import '../../domain/entities/booking_entity.dart';

class BookingCardWidget extends StatelessWidget {
  const BookingCardWidget({
    required this.booking,
    this.onTap,
    this.onCancel,
    this.onModify,
    super.key,
  });

  final BookingEntity booking;
  final VoidCallback? onTap;
  final VoidCallback? onCancel;
  final VoidCallback? onModify;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      booking.club.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                  _StatusChip(status: booking.status),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                booking.facility.name,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.schedule,
                    size: 16,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${_formatDateTime(booking.startTime)} - ${_formatTime(booking.endTime)}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              if (booking.notes != null) ...[
                const SizedBox(height: 8),
                Text(
                  booking.notes!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              if (onCancel != null || onModify != null) ...[
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (onModify != null)
                      TextButton.icon(
                        onPressed: onModify,
                        icon: const Icon(Icons.edit, size: 16),
                        label: const Text('Modify'),
                      ),
                    if (onCancel != null && onModify != null)
                      const SizedBox(width: 8),
                    if (onCancel != null)
                      TextButton.icon(
                        onPressed: onCancel,
                        icon: const Icon(Icons.cancel, size: 16),
                        label: const Text('Cancel'),
                        style: TextButton.styleFrom(
                          foregroundColor: Theme.of(context).colorScheme.error,
                        ),
                      ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month} ${_formatTime(dateTime)}';
  }

  String _formatTime(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}

/// Status chip widget with WCAG AAA compliant colors that adapt to theme.
class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.status});

  final Enum$BookingStatus status;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusInfo = _getStatusInfo(status);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: statusInfo.color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: statusInfo.color.withValues(alpha: 0.3),
        ),
      ),
      child: Text(
        statusInfo.label,
        style: theme.textTheme.bodySmall?.copyWith(
          color: statusInfo.color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// Returns WCAG AAA compliant status info for booking statuses.
  _BookingStatusInfo _getStatusInfo(Enum$BookingStatus status) {
    switch (status) {
      case Enum$BookingStatus.CONFIRMED:
        return _BookingStatusInfo(color: AppColors.success, label: 'Confirmed');
      case Enum$BookingStatus.PENDING:
        return _BookingStatusInfo(color: AppColors.warning, label: 'Pending');
      case Enum$BookingStatus.CANCELLED:
        return _BookingStatusInfo(color: AppColors.error, label: 'Cancelled');
      case Enum$BookingStatus.CHECKED_IN:
        return _BookingStatusInfo(color: AppColors.info, label: 'Checked In');
      case Enum$BookingStatus.CHECKED_OUT:
        return _BookingStatusInfo(color: AppColors.info, label: 'Completed');
      case Enum$BookingStatus.NO_SHOW:
        return _BookingStatusInfo(color: AppColors.neutral600, label: 'No Show');
      case Enum$BookingStatus.$unknown:
        return _BookingStatusInfo(color: AppColors.neutral600, label: 'Unknown');
    }
  }
}

class _BookingStatusInfo {
  final Color color;
  final String label;

  _BookingStatusInfo({required this.color, required this.label});
}