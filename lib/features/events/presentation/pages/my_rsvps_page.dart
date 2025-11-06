import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/event_rsvp_entity.dart';
import '../controllers/events_controller.dart';
import '../widgets/error_display.dart';
import '../widgets/rsvp_status_badge.dart';

/// My RSVPs page showing member's event RSVPs
class MyRSVPsPage extends ConsumerStatefulWidget {
  /// Club ID to fetch RSVPs for
  final String clubId;

  const MyRSVPsPage({required this.clubId, super.key});

  @override
  ConsumerState<MyRSVPsPage> createState() => _MyRSVPsPageState();
}

class _MyRSVPsPageState extends ConsumerState<MyRSVPsPage> {
  final _scrollController = ScrollController();
  List<String>? _statusFilter;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      _loadMore();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  Future<void> _loadMore() async {
    final controller = ref.read(
      myRSVPsControllerProvider(widget.clubId).notifier,
    );
    await controller.loadMore();
  }

  Future<void> _refresh() async {
    final controller = ref.read(
      myRSVPsControllerProvider(widget.clubId).notifier,
    );
    await controller.refresh();
  }

  Future<void> _applyFilter(List<String>? statusFilter) async {
    setState(() {
      _statusFilter = statusFilter;
    });

    final controller = ref.read(
      myRSVPsControllerProvider(widget.clubId).notifier,
    );
    await controller.applyFilter(statusFilter);
  }

  @override
  Widget build(BuildContext context) {
    final rsvpsState = ref.watch(myRSVPsControllerProvider(widget.clubId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('My RSVPs'),
        actions: [
          // Filter button
          IconButton(
            icon: Icon(
              _statusFilter != null && _statusFilter!.isNotEmpty
                  ? Icons.filter_alt
                  : Icons.filter_alt_outlined,
            ),
            onPressed: _showFilterDialog,
            tooltip: 'Filter RSVPs',
          ),
        ],
      ),
      body: rsvpsState.when(
        data: (state) => _buildRSVPsList(state.rsvps, state),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => _buildErrorState(error),
      ),
    );
  }

  Widget _buildRSVPsList(List<dynamic> rsvps, MyRSVPsState state) {
    if (rsvps.isEmpty) {
      return EmptyStateDisplay(
        title: 'No RSVPs Found',
        description: _statusFilter != null && _statusFilter!.isNotEmpty
            ? 'No RSVPs match your filter criteria'
            : "You haven't RSVP'd to any events yet",
        icon: Icons.event_note,
        action: _statusFilter != null && _statusFilter!.isNotEmpty
            ? FilledButton.icon(
                onPressed: () => _applyFilter(null),
                icon: const Icon(Icons.clear),
                label: const Text('Clear Filter'),
              )
            : null,
      );
    }

    return RefreshIndicator(
      onRefresh: _refresh,
      child: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: rsvps.length + (state.pageInfo.hasNextPage ? 1 : 0),
        itemBuilder: (context, index) {
          if (index >= rsvps.length) {
            // Loading more indicator
            if (state.isLoadingMore) {
              return const Padding(
                padding: EdgeInsets.all(16),
                child: Center(child: CircularProgressIndicator()),
              );
            }
            return const SizedBox.shrink();
          }

          final rsvp = rsvps[index];
          // RSVPs are returned as Map from the connection
          // In a real implementation, we'd parse these to EventRSVPEntity
          return _RSVPCard(
            rsvpData: rsvp as Map<String, dynamic>,
            onTap: () => _navigateToEventDetails(rsvp['eventId'] as String),
            onEdit: () => _navigateToUpdateRSVP(rsvp),
            onCancel: () => _showCancelDialog(rsvp['id'] as String),
          );
        },
      ),
    );
  }

  Widget _buildErrorState(Object error) {
    final errorMessage = error.toString();

    // Determine error type and show appropriate message
    if (errorMessage.contains('SocketException') ||
        errorMessage.contains('NetworkException') ||
        errorMessage.contains('Failed host lookup')) {
      return ErrorDisplay.network(onRetry: _refresh);
    } else if (errorMessage.contains('UNAUTHENTICATED') ||
        errorMessage.contains('AuthFailure')) {
      return ErrorDisplay.unauthorized();
    } else if (errorMessage.contains('TimeoutException')) {
      return ErrorDisplay(
        message: 'Request Timeout',
        details: 'The request took too long to complete. Please try again.',
        onRetry: _refresh,
        icon: Icons.access_time,
      );
    } else {
      return ErrorDisplay.server(onRetry: _refresh, details: errorMessage);
    }
  }

  void _showFilterDialog() {
    showModalBottomSheet<List<String>>(
      context: context,
      builder: (context) => _RSVPFilterSheet(currentFilter: _statusFilter),
    ).then((filter) {
      if (filter != null) {
        _applyFilter(filter.isEmpty ? null : filter);
      }
    });
  }

  void _navigateToEventDetails(String eventId) {
    // TODO: Navigate to event details page
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Navigate to event details: $eventId'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _navigateToUpdateRSVP(Map<String, dynamic> rsvpData) {
    // TODO: Once proper entity parsing is implemented, navigate to UpdateRSVPPage
    // For now, show placeholder message
    //
    // Expected usage when EventRSVPEntity and EventEntity are available:
    // final rsvpEntity = EventRSVPEntity.fromJson(rsvpData);
    // final eventEntity = await fetchEventDetails(rsvpEntity.eventId);
    //
    // Navigator.of(context).push<void>(
    //   MaterialPageRoute(
    //     builder: (context) => UpdateRSVPPage(
    //       event: eventEntity,
    //       rsvp: rsvpEntity,
    //     ),
    //   ),
    // );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Update RSVP feature will be available once API integration is complete',
        ),
        duration: Duration(seconds: 3),
      ),
    );
  }

  Future<void> _showCancelDialog(String rsvpId) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cancel RSVP'),
        content: const Text(
          'Are you sure you want to cancel your RSVP? '
          "Cancellation fees may apply based on the event's cancellation policy.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Keep RSVP'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('Cancel RSVP'),
          ),
        ],
      ),
    );

    if ((confirmed ?? false) && mounted) {
      _cancelRSVP(rsvpId);
    }
  }

  Future<void> _cancelRSVP(String rsvpId) async {
    try {
      final controller = ref.read(rSVPControllerProvider.notifier);
      final response = await controller.cancelRSVP(rsvpId);

      if (!mounted) return;

      if (response.success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.message ?? 'RSVP cancelled successfully'),
            backgroundColor: Colors.green,
          ),
        );

        // Refresh the list
        await _refresh();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.message ?? 'Failed to cancel RSVP'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error cancelling RSVP: ${e}'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }
}

/// RSVP card widget
class _RSVPCard extends StatelessWidget {
  final Map<String, dynamic> rsvpData;
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onCancel;

  const _RSVPCard({
    required this.rsvpData,
    this.onTap,
    this.onEdit,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final status = rsvpData['status'] as String? ?? 'pending';
    final response = rsvpData['response'] as String? ?? 'yes';
    final eventTitle = rsvpData['eventTitle'] as String? ?? 'Event';
    final eventDate = rsvpData['eventDate'] as String?;
    final attendanceCount = rsvpData['attendanceCount'] as int? ?? 1;
    final canCancel = _canCancelRSVP(status);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with status
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      eventTitle,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 12),
                  RSVPStatusBadge(status: status),
                ],
              ),

              const SizedBox(height: 12),

              // Event date
              if (eventDate != null)
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 16,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _formatDate(eventDate),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),

              const SizedBox(height: 8),

              // RSVP details
              Row(
                children: [
                  Icon(
                    _getResponseIcon(response),
                    size: 16,
                    color: _getResponseColor(response),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${_getResponseLabel(response)} • $attendanceCount ${attendanceCount == 1 ? 'person' : 'people'}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),

              // Action buttons
              if (canCancel || onEdit != null) ...[
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Edit button (only show if RSVP can be modified)
                    if (canCancel && onEdit != null) ...[
                      TextButton.icon(
                        onPressed: onEdit,
                        icon: const Icon(Icons.edit_outlined),
                        label: const Text('Edit'),
                        style: TextButton.styleFrom(
                          foregroundColor: theme.colorScheme.primary,
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                    // Cancel button
                    if (canCancel)
                      TextButton.icon(
                        onPressed: onCancel,
                        icon: const Icon(Icons.cancel_outlined),
                        label: const Text('Cancel RSVP'),
                        style: TextButton.styleFrom(
                          foregroundColor: theme.colorScheme.error,
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

  bool _canCancelRSVP(String status) {
    return status == 'confirmed' ||
        status == 'tentative' ||
        status == 'pending_approval';
  }

  IconData _getResponseIcon(String response) {
    switch (response.toLowerCase()) {
      case 'yes':
        return Icons.check_circle;
      case 'no':
        return Icons.cancel;
      case 'maybe':
        return Icons.help_outline;
      default:
        return Icons.info;
    }
  }

  Color _getResponseColor(String response) {
    switch (response.toLowerCase()) {
      case 'yes':
        return Colors.green;
      case 'no':
        return Colors.red;
      case 'maybe':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  String _getResponseLabel(String response) {
    switch (response.toLowerCase()) {
      case 'yes':
        return 'Going';
      case 'no':
        return 'Not Going';
      case 'maybe':
        return 'Maybe';
      default:
        return response;
    }
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return DateFormat('MMM d, y • h:mm a').format(date);
    } catch (e) {
      return dateString;
    }
  }
}

/// RSVP filter bottom sheet
class _RSVPFilterSheet extends StatefulWidget {
  final List<String>? currentFilter;

  const _RSVPFilterSheet({this.currentFilter});

  @override
  State<_RSVPFilterSheet> createState() => _RSVPFilterSheetState();
}

class _RSVPFilterSheetState extends State<_RSVPFilterSheet> {
  late Set<String> _selectedStatuses;

  final List<String> _availableStatuses = [
    'confirmed',
    'tentative',
    'pending_approval',
    'waitlist',
    'cancelled',
    'declined',
  ];

  @override
  void initState() {
    super.initState();
    _selectedStatuses = widget.currentFilter?.toSet() ?? {};
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filter by Status',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedStatuses.clear();
                  });
                },
                child: const Text('Clear'),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Status chips
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _availableStatuses.map((status) {
              final isSelected = _selectedStatuses.contains(status);
              return FilterChip(
                label: Text(_getStatusLabel(status)),
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      _selectedStatuses.add(status);
                    } else {
                      _selectedStatuses.remove(status);
                    }
                  });
                },
              );
            }).toList(),
          ),

          const SizedBox(height: 24),

          // Apply button
          FilledButton(
            onPressed: () {
              Navigator.of(context).pop(_selectedStatuses.toList());
            },
            style: FilledButton.styleFrom(
              minimumSize: const Size.fromHeight(48),
            ),
            child: const Text('Apply Filter'),
          ),
        ],
      ),
    );
  }

  String _getStatusLabel(String status) {
    switch (status) {
      case 'confirmed':
        return 'Confirmed';
      case 'tentative':
        return 'Tentative';
      case 'pending_approval':
        return 'Pending Approval';
      case 'waitlist':
        return 'Waitlist';
      case 'cancelled':
        return 'Cancelled';
      case 'declined':
        return 'Declined';
      default:
        return status;
    }
  }
}
