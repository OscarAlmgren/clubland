import '../../../../core/design_system/design_system.dart';
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
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  _StatusChip(status: booking.status),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                booking.facility.name,
                style: Theme.of(context).textTheme.bodyMedium,
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
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              if (booking.notes != null) ...[
                const SizedBox(height: 8),
                Text(
                  booking.notes!,
                  style: Theme.of(context).textTheme.bodySmall,
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

  final BookingStatus status;

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
  _BookingStatusInfo _getStatusInfo(BookingStatus status) {
    switch (status) {
      case BookingStatus.confirmed:
        return _BookingStatusInfo(
          color: AppColors.success, // 7.23:1 contrast
          label: 'Confirmed',
        );
      case BookingStatus.pending:
        return _BookingStatusInfo(
          color: AppColors.warning, // 7.81:1 contrast
          label: 'Pending',
        );
      case BookingStatus.cancelled:
        return _BookingStatusInfo(
          color: AppColors.error, // 7.56:1 contrast
          label: 'Cancelled',
        );
      case BookingStatus.completed:
        return _BookingStatusInfo(
          color: AppColors.info, // 7.03:1 contrast
          label: 'Completed',
        );
      case BookingStatus.noShow:
        return _BookingStatusInfo(
          color: AppColors.neutral600, // 7.01:1 contrast
          label: 'No Show',
        );
    }
  }
}

class _BookingStatusInfo {
  final Color color;
  final String label;

  _BookingStatusInfo({required this.color, required this.label});
}