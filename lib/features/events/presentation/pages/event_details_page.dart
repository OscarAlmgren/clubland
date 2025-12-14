import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../app/router/route_paths.dart';
import '../../../../core/design_system/design_system.dart';
import '../../domain/entities/event_entity.dart';
import '../../domain/entities/rsvp_eligibility_entity.dart';
import '../controllers/events_controller.dart';
import '../widgets/capacity_indicator.dart';
import '../widgets/error_display.dart';
import 'rsvp_form_page.dart';

/// Event details page with RSVP functionality
class EventDetailsPage extends ConsumerWidget {
  /// Event ID to display
  final String eventId;

  /// Member ID for RSVP eligibility check
  final String memberId;

  const EventDetailsPage({
    required this.eventId,
    required this.memberId,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailsState = ref.watch(
      eventDetailsControllerProvider(eventId, memberId),
    );

    // Listen for errors and show dialog + navigate back
    ref.listen(eventDetailsControllerProvider(eventId, memberId), (
      previous,
      next,
    ) {
      next.whenOrNull(
        error: (error, stackTrace) {
          // Only show error dialog if this is a new error (not just rebuilding)
          if (previous?.hasError != true) {
            _showErrorAndNavigateBack(context, error);
          }
        },
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () => _shareEvent(context),
            tooltip: 'Share event',
          ),
        ],
      ),
      body: detailsState.when(
        data: (state) => _buildEventDetails(context, ref, state),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => _buildErrorState(context, ref, error),
      ),
    );
  }

  Widget _buildEventDetails(
    BuildContext context,
    WidgetRef ref,
    EventDetailsState state,
  ) {
    final event = state.event;
    final eligibility = state.eligibility;
    final theme = Theme.of(context);
    final dateFormat = DateFormat('EEEE, MMMM d, y');
    final timeFormat = DateFormat('h:mm a');

    return RefreshIndicator(
      onRefresh: () async {
        await ref
            .read(eventDetailsControllerProvider(eventId, memberId).notifier)
            .reload();
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event header
            _EventHeader(event: event),

            const SizedBox(height: 24),

            // Date and time card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _InfoRow(
                      icon: Icons.calendar_today,
                      label: 'Date',
                      value: dateFormat.format(event.startTime),
                    ),
                    const Divider(height: 24),
                    _InfoRow(
                      icon: Icons.access_time,
                      label: 'Time',
                      value:
                          '${timeFormat.format(event.startTime)} - ${timeFormat.format(event.endTime)}',
                    ),
                    if (event.location != null) ...[
                      const Divider(height: 24),
                      _InfoRow(
                        icon: Icons.location_on,
                        label: 'Location',
                        value: event.location!,
                      ),
                    ],
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Description
            if (event.description.isNotEmpty) ...[
              Text(
                'About this event',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(event.description, style: theme.textTheme.bodyLarge),
              const SizedBox(height: 24),
            ],

            // Capacity
            if (event.capacity != null && event.currentAttendees != null) ...[
              Text(
                'Capacity',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              CapacityIndicator(
                currentAttendees: event.currentAttendees!,
                capacity: event.capacity!,
                height: 12,
              ),
              const SizedBox(height: 24),
            ],

            // RSVP Information
            if (eligibility != null) ...[
              _buildRSVPInfo(context, event, eligibility),
              const SizedBox(height: 24),
            ],

            // Event details
            _buildEventInfo(context, event),

            const SizedBox(height: 24),

            // Tags
            if (event.tags.isNotEmpty) ...[
              Text(
                'Tags',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: event.tags.map((tag) {
                  return Chip(
                    label: Text(tag),
                    backgroundColor: theme.colorScheme.secondaryContainer,
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
            ],

            // RSVP Button
            if (eligibility != null)
              _buildRSVPButton(context, ref, event, eligibility),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildRSVPInfo(
    BuildContext context,
    EventEntity event,
    RSVPEligibilityEntity eligibility,
  ) {
    final theme = Theme.of(context);

    return Card(
      color: eligibility.canRSVP
          ? theme.colorScheme.primaryContainer
          : theme.colorScheme.errorContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  eligibility.canRSVP ? Icons.check_circle : Icons.info,
                  color: eligibility.canRSVP
                      ? theme.colorScheme.primary
                      : theme.colorScheme.error,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    eligibility.canRSVP ? 'You can RSVP' : 'RSVP Unavailable',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: eligibility.canRSVP
                          ? theme.colorScheme.onPrimaryContainer
                          : theme.colorScheme.onErrorContainer,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              eligibility.reason ?? 'No information available',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: eligibility.canRSVP
                    ? theme.colorScheme.onPrimaryContainer
                    : theme.colorScheme.onErrorContainer,
              ),
            ),
            if (eligibility.requiresApproval) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.verified_user,
                    size: 16,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Requires approval from event organizer',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ],
            if (eligibility.requiresPayment &&
                eligibility.paymentAmount != null) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.payment,
                    size: 16,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Payment required: \$${eligibility.paymentAmount!.toStringAsFixed(2)}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildEventInfo(BuildContext context, EventEntity event) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Event Information',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _InfoRow(
                  icon: Icons.category,
                  label: 'Event Type',
                  value: _getEventTypeLabel(event.eventType),
                ),
                if (event.organizerName != null) ...[
                  const Divider(height: 24),
                  _InfoRow(
                    icon: Icons.person,
                    label: 'Organizer',
                    value: event.organizerName!,
                  ),
                ],
                const Divider(height: 24),
                _InfoRow(
                  icon: Icons.people,
                  label: 'Guest Policy',
                  value: _getGuestPolicyLabel(event.guestPolicy),
                ),
                if (event.maxGuestsPerMember != null) ...[
                  const Divider(height: 24),
                  _InfoRow(
                    icon: Icons.person_add,
                    label: 'Max Guests',
                    value: event.maxGuestsPerMember.toString(),
                  ),
                ],
                if ((event.requiresPayment ?? false) &&
                    event.price != null) ...[
                  const Divider(height: 24),
                  _InfoRow(
                    icon: Icons.payment,
                    label: 'Price',
                    value: '\$${event.price!.toStringAsFixed(2)}',
                  ),
                ],
                if (event.rsvpDeadline != null) ...[
                  const Divider(height: 24),
                  _InfoRow(
                    icon: Icons.event_available,
                    label: 'RSVP Deadline',
                    value: DateFormat(
                      'MMM d, y h:mm a',
                    ).format(event.rsvpDeadline!),
                  ),
                ],
                if (event.cancellationDeadline != null) ...[
                  const Divider(height: 24),
                  _InfoRow(
                    icon: Icons.event_busy,
                    label: 'Cancellation Deadline',
                    value: DateFormat(
                      'MMM d, y h:mm a',
                    ).format(event.cancellationDeadline!),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRSVPButton(
    BuildContext context,
    WidgetRef ref,
    EventEntity event,
    RSVPEligibilityEntity eligibility,
  ) {
    if (eligibility.hasExistingRSVP) {
      return FilledButton.tonal(
        onPressed: () => _navigateToMyRSVPs(context),
        style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(48)),
        child: const Text('View My RSVP'),
      );
    }

    if (!eligibility.canRSVP) {
      return FilledButton(
        onPressed: null,
        style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(48)),
        child: const Text('RSVP Not Available'),
      );
    }

    return FilledButton.icon(
      onPressed: () => _navigateToRSVPForm(context, event, eligibility),
      icon: const Icon(Icons.event_available),
      label: const Text('RSVP to Event'),
      style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(48)),
    );
  }

  Widget _buildErrorState(BuildContext context, WidgetRef ref, Object error) {
    final errorMessage = error.toString();

    // Determine error type and show appropriate message
    if (errorMessage.contains('SocketException') ||
        errorMessage.contains('NetworkException') ||
        errorMessage.contains('Failed host lookup')) {
      return ErrorDisplay.network(
        onRetry: () async {
          await ref
              .read(eventDetailsControllerProvider(eventId, memberId).notifier)
              .reload();
        },
      );
    } else if (errorMessage.contains('NOT_FOUND')) {
      return ErrorDisplay.notFound(message: 'Event Not Found');
    } else if (errorMessage.contains('UNAUTHENTICATED') ||
        errorMessage.contains('AuthFailure')) {
      return ErrorDisplay.unauthorized();
    } else if (errorMessage.contains('TimeoutException')) {
      return ErrorDisplay(
        message: 'Request Timeout',
        details: 'The request took too long to complete. Please try again.',
        onRetry: () async {
          await ref
              .read(eventDetailsControllerProvider(eventId, memberId).notifier)
              .reload();
        },
        icon: Icons.access_time,
      );
    } else {
      return ErrorDisplay.server(
        onRetry: () async {
          await ref
              .read(eventDetailsControllerProvider(eventId, memberId).notifier)
              .reload();
        },
        details: errorMessage,
      );
    }
  }

  void _showErrorAndNavigateBack(BuildContext context, Object error) {
    final errorMessage = error.toString();

    // Determine user-friendly error message
    String title = 'Error Loading Event';
    String message;

    if (errorMessage.contains('API_UNAVAILABLE') ||
        errorMessage.contains('Cannot query field') ||
        errorMessage.contains('GRAPHQL_VALIDATION_FAILED')) {
      title = 'Feature Unavailable';
      message =
          'Event details are not available at this time. This feature is still being developed. Please check back later.';
    } else if (errorMessage.contains('SocketException') ||
        errorMessage.contains('NetworkException') ||
        errorMessage.contains('Failed host lookup')) {
      title = 'Network Error';
      message =
          'Unable to connect to the server. Please check your internet connection and try again.';
    } else if (errorMessage.contains('TimeoutException') ||
        errorMessage.contains('TIMEOUT')) {
      title = 'Request Timeout';
      message =
          'The request took too long to complete. Please try again later.';
    } else if (errorMessage.contains('NOT_FOUND')) {
      title = 'Event Not Found';
      message = 'The requested event could not be found.';
    } else if (errorMessage.contains('UNAUTHENTICATED') ||
        errorMessage.contains('AuthFailure')) {
      title = 'Authentication Required';
      message = 'Please sign in again to view event details.';
    } else {
      message =
          'An unexpected error occurred while loading event details. Please try again later.';
    }

    // Show error dialog and navigate to home when dismissed
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!context.mounted) return;

      showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (dialogContext) => AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Close dialog
                // Use go_router to navigate to home instead of popping
                // This prevents the "popped last page" error
                context.go(RoutePaths.home);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    });
  }

  void _shareEvent(BuildContext context) {
    // TODO: Implement event sharing
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Event sharing coming soon'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _navigateToMyRSVPs(BuildContext context) {
    // TODO: Navigate to my RSVPs page
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Navigate to My RSVPs'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _navigateToRSVPForm(
    BuildContext context,
    EventEntity event,
    RSVPEligibilityEntity eligibility,
  ) {
    Navigator.of(context).push<void>(
      MaterialPageRoute(
        builder: (context) => RSVPFormPage(
          event: event,
          memberId: memberId,
          clubId: event.clubId,
          eligibility: eligibility,
        ),
      ),
    );
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

  String _getGuestPolicyLabel(GuestPolicy policy) {
    switch (policy) {
      case GuestPolicy.noGuests:
        return 'No Guests Allowed';
      case GuestPolicy.membersOnly:
        return 'Members Only';
      case GuestPolicy.maleGuestsOnly:
        return 'Male Guests Only';
      case GuestPolicy.femaleGuestsOnly:
        return 'Female Guests Only';
      case GuestPolicy.friendsAndFamily:
        return 'Friends & Family Welcome';
    }
  }
}

/// Event header widget
class _EventHeader extends StatelessWidget {
  final EventEntity event;

  const _EventHeader({required this.event});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Event image (if available)
        if (event.imageUrl != null) ...[
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                event.imageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return ColoredBox(
                    color: theme.colorScheme.surfaceContainerHighest,
                    child: Icon(
                      Icons.image_not_supported,
                      size: 64,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return ColoredBox(
                    color: theme.colorScheme.surfaceContainerHighest,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],

        // Event type badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: _getEventTypeColor(event.eventType),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            _getEventTypeLabel(event.eventType),
            style: theme.textTheme.labelLarge?.copyWith(
              color: theme.colorScheme.onPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Event title
        Text(
          event.title,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  /// Returns WCAG AAA compliant color for event type badges.
  Color _getEventTypeColor(EventType type) {
    switch (type) {
      case EventType.social:
        return AppColors.getEventTypeColor('social');
      case EventType.dining:
        return AppColors.getEventTypeColor('dining');
      case EventType.sports:
        return AppColors.getEventTypeColor('sports');
      case EventType.cultural:
        return AppColors.getEventTypeColor('cultural');
      case EventType.educational:
        return AppColors.getEventTypeColor('educational');
      case EventType.networking:
        return AppColors.getEventTypeColor('networking');
      case EventType.family:
        return AppColors.getEventTypeColor('family');
      case EventType.special:
        return AppColors.getEventTypeColor('special');
      case EventType.findingFriends:
        return AppColors.getEventTypeColor('finding_friends');
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

/// Info row widget for displaying key-value pairs
class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: theme.colorScheme.primary),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
