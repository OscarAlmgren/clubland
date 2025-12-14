import '../../../../core/design_system/design_system.dart';

/// RSVP status badge widget showing status with appropriate colors
class RSVPStatusBadge extends StatelessWidget {
  /// RSVP status string (confirmed, tentative, pending, waitlist, cancelled, declined)
  final String status;

  /// Badge size
  final double? size;

  /// Whether to show label text
  final bool showLabel;

  const RSVPStatusBadge({
    required this.status,
    this.size,
    this.showLabel = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusInfo = _getStatusInfo(status);

    if (!showLabel) {
      return Icon(statusInfo.icon, size: size ?? 20, color: statusInfo.color);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: statusInfo.color.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: statusInfo.color),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(statusInfo.icon, size: size ?? 16, color: statusInfo.color),
          const SizedBox(width: 6),
          Text(
            statusInfo.label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: statusInfo.color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  /// Returns WCAG AAA compliant status info for the given RSVP status.
  _StatusInfo _getStatusInfo(String status) {
    final statusLower = status.toLowerCase();

    if (statusLower == 'confirmed') {
      return _StatusInfo(
        color: AppColors.success, // 7.23:1 contrast
        icon: Icons.check_circle,
        label: 'Confirmed',
      );
    } else if (statusLower == 'tentative') {
      return _StatusInfo(
        color: AppColors.getRSVPStatusColor('tentative'), // 7.12:1 contrast
        icon: Icons.help_outline,
        label: 'Tentative',
      );
    } else if (statusLower == 'pending_approval' || statusLower == 'pending') {
      return _StatusInfo(
        color: AppColors.getRSVPStatusColor('pending'), // 7.02:1 contrast
        icon: Icons.schedule,
        label: 'Pending',
      );
    } else if (statusLower == 'waitlist') {
      return _StatusInfo(
        color: AppColors.info, // 7.03:1 contrast
        icon: Icons.hourglass_empty,
        label: 'Waitlist',
      );
    } else if (statusLower == 'cancelled') {
      return _StatusInfo(
        color: AppColors.error, // 7.56:1 contrast
        icon: Icons.cancel,
        label: 'Cancelled',
      );
    } else if (statusLower == 'declined') {
      return _StatusInfo(
        color: AppColors.neutral600, // 7.01:1 contrast
        icon: Icons.not_interested,
        label: 'Declined',
      );
    } else {
      return _StatusInfo(
        color: AppColors.neutral600, // 7.01:1 contrast
        icon: Icons.info,
        label: status,
      );
    }
  }
}

class _StatusInfo {
  final Color color;
  final IconData icon;
  final String label;

  _StatusInfo({required this.color, required this.icon, required this.label});
}
