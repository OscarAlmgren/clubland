import '../../../../core/design_system/design_system.dart';
import '../../../../core/graphql/graphql_api.dart';

/// RSVP status badge widget showing status with appropriate colors
class RSVPStatusBadge extends StatelessWidget {
  /// RSVP status (typed to generated enum — never a raw string)
  final Enum$RSVPStatus status;

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
  _StatusInfo _getStatusInfo(Enum$RSVPStatus status) {
    switch (status) {
      case Enum$RSVPStatus.CONFIRMED:
        return _StatusInfo(
          color: AppColors.success, // 7.23:1 contrast
          icon: Icons.check_circle,
          label: 'Confirmed',
        );
      case Enum$RSVPStatus.PENDING:
        return _StatusInfo(
          color: AppColors.warning, // 7.81:1 contrast
          icon: Icons.schedule,
          label: 'Pending',
        );
      case Enum$RSVPStatus.WAITLISTED:
        return _StatusInfo(
          color: AppColors.info, // 7.03:1 contrast
          icon: Icons.hourglass_empty,
          label: 'Waitlisted',
        );
      case Enum$RSVPStatus.ATTENDED:
        return _StatusInfo(
          color: AppColors.success, // 7.23:1 contrast
          icon: Icons.how_to_reg,
          label: 'Attended',
        );
      case Enum$RSVPStatus.NO_SHOW:
        return _StatusInfo(
          color: AppColors.neutral600, // 7.01:1 contrast
          icon: Icons.not_interested,
          label: 'No Show',
        );
      case Enum$RSVPStatus.CANCELLED:
        return _StatusInfo(
          color: AppColors.error, // 7.56:1 contrast
          icon: Icons.cancel,
          label: 'Cancelled',
        );
      case Enum$RSVPStatus.$unknown:
        return _StatusInfo(
          color: AppColors.neutral600, // 7.01:1 contrast
          icon: Icons.info,
          label: 'Unknown',
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
