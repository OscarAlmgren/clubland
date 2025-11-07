import 'package:flutter/material.dart';

import '../../../../core/design_system/design_system.dart';
import '../../../events/domain/entities/event_entity.dart';

/// RSVP response type
enum RSVPResponse {
  yes,
  no,
  maybe,
}

/// RSVP modal dialog for event responses
class RSVPModal extends StatelessWidget {
  /// Event to RSVP for
  final EventEntity event;

  /// Callback when RSVP is selected
  final void Function(RSVPResponse response) onRSVP;

  const RSVPModal({
    required this.event,
    required this.onRSVP,
    super.key,
  });

  /// Show the RSVP modal
  static Future<RSVPResponse?> show({
    required BuildContext context,
    required EventEntity event,
  }) {
    return showDialog<RSVPResponse>(
      context: context,
      builder: (context) => RSVPModal(
        event: event,
        onRSVP: (response) => Navigator.of(context).pop(response),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Icon(
                  Icons.how_to_reg,
                  color: theme.colorScheme.primary,
                  size: 28,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'RSVP to Event',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),

            AppSpacing.verticalSpaceMD,

            // Event title
            Text(
              event.title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),

            AppSpacing.verticalSpaceSM,

            // Event details summary
            Text(
              'Will you be attending this event?',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),

            AppSpacing.verticalSpaceXL,

            // RSVP options
            _buildRSVPOption(
              context: context,
              theme: theme,
              response: RSVPResponse.yes,
              icon: Icons.check_circle,
              label: 'Yes, I\'ll attend',
              description: 'Confirm your attendance',
              color: Colors.green,
            ),

            AppSpacing.verticalSpaceMD,

            _buildRSVPOption(
              context: context,
              theme: theme,
              response: RSVPResponse.maybe,
              icon: Icons.help_outline,
              label: 'Maybe',
              description: 'You\'re not sure yet',
              color: Colors.orange,
            ),

            AppSpacing.verticalSpaceMD,

            _buildRSVPOption(
              context: context,
              theme: theme,
              response: RSVPResponse.no,
              icon: Icons.cancel,
              label: 'No, I can\'t attend',
              description: 'Decline the invitation',
              color: Colors.red,
            ),

            AppSpacing.verticalSpaceMD,

            // Info note
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 16,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'You can change your RSVP later',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRSVPOption({
    required BuildContext context,
    required ThemeData theme,
    required RSVPResponse response,
    required IconData icon,
    required String label,
    required String description,
    required Color color,
  }) {
    return InkWell(
      onTap: () => onRSVP(response),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: theme.colorScheme.outline.withOpacity(0.3),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: color,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    description,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }
}
