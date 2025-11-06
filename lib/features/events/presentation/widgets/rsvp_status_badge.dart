import 'package:flutter/material.dart';

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
        color: statusInfo.color.withOpacity(0.1),
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

  _StatusInfo _getStatusInfo(String status) {
    final statusLower = status.toLowerCase();

    if (statusLower == 'confirmed') {
      return _StatusInfo(
        color: Colors.green,
        icon: Icons.check_circle,
        label: 'Confirmed',
      );
    } else if (statusLower == 'tentative') {
      return _StatusInfo(
        color: Colors.orange,
        icon: Icons.help_outline,
        label: 'Tentative',
      );
    } else if (statusLower == 'pending_approval' || statusLower == 'pending') {
      return _StatusInfo(
        color: Colors.amber,
        icon: Icons.schedule,
        label: 'Pending',
      );
    } else if (statusLower == 'waitlist') {
      return _StatusInfo(
        color: Colors.blue,
        icon: Icons.hourglass_empty,
        label: 'Waitlist',
      );
    } else if (statusLower == 'cancelled') {
      return _StatusInfo(
        color: Colors.red,
        icon: Icons.cancel,
        label: 'Cancelled',
      );
    } else if (statusLower == 'declined') {
      return _StatusInfo(
        color: Colors.grey,
        icon: Icons.not_interested,
        label: 'Declined',
      );
    } else {
      return _StatusInfo(color: Colors.grey, icon: Icons.info, label: status);
    }
  }
}

class _StatusInfo {
  final Color color;
  final IconData icon;
  final String label;

  _StatusInfo({required this.color, required this.icon, required this.label});
}
