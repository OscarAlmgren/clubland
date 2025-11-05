import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/event_entity.dart';
import '../controllers/events_controller.dart';
import '../widgets/error_display.dart';
import '../widgets/event_card.dart';

/// Events list page with filtering and pagination
class EventsListPage extends ConsumerStatefulWidget {
  /// Club ID to fetch events for
  final String clubId;

  const EventsListPage({
    required this.clubId,
    super.key,
  });

  @override
  ConsumerState<EventsListPage> createState() => _EventsListPageState();
}

class _EventsListPageState extends ConsumerState<EventsListPage> {
  final _scrollController = ScrollController();
  String? _searchQuery;
  Map<String, dynamic>? _filters;

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
      eventsListControllerProvider(widget.clubId).notifier,
    );
    await controller.loadMore();
  }

  Future<void> _refresh() async {
    final controller = ref.read(
      eventsListControllerProvider(widget.clubId).notifier,
    );
    await controller.refresh();
  }

  Future<void> _search(String? query) async {
    setState(() {
      _searchQuery = query;
    });

    final controller = ref.read(
      eventsListControllerProvider(widget.clubId).notifier,
    );
    await controller.search(query ?? '');
  }

  Future<void> _applyFilters(Map<String, dynamic>? filters) async {
    setState(() {
      _filters = filters;
    });

    final controller = ref.read(
      eventsListControllerProvider(widget.clubId).notifier,
    );
    await controller.applyFilters(filters);
  }

  @override
  Widget build(BuildContext context) {
    final eventsListState = ref.watch(
      eventsListControllerProvider(widget.clubId),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
        actions: [
          // Filter button
          IconButton(
            icon: Icon(
              _filters != null && _filters!.isNotEmpty
                  ? Icons.filter_alt
                  : Icons.filter_alt_outlined,
            ),
            onPressed: () => _showFiltersDialog(),
            tooltip: 'Filter events',
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: SearchBar(
              hintText: 'Search events...',
              onChanged: _search,
              leading: const Icon(Icons.search),
              trailing: _searchQuery != null && _searchQuery!.isNotEmpty
                  ? [
                      IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => _search(null),
                      ),
                    ]
                  : null,
            ),
          ),
        ),
      ),
      body: eventsListState.when(
        data: (state) => _buildEventsList(state.events, state),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => _buildErrorState(error),
      ),
    );
  }

  Widget _buildEventsList(
    List<EventEntity> events,
    EventsListState state,
  ) {
    if (events.isEmpty) {
      return EmptyStateDisplay(
        title: 'No Events Found',
        description: _searchQuery != null || _filters != null
            ? 'Try adjusting your search or filters'
            : 'There are no upcoming events at this club',
        icon: Icons.event_busy,
        action: _searchQuery != null || _filters != null
            ? FilledButton.icon(
                onPressed: () {
                  _search(null);
                  _applyFilters(null);
                },
                icon: const Icon(Icons.clear),
                label: const Text('Clear Filters'),
              )
            : null,
      );
    }

    return RefreshIndicator(
      onRefresh: _refresh,
      child: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: events.length + (state.hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index >= events.length) {
            // Loading more indicator
            if (state.isLoadingMore) {
              return const Padding(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return const SizedBox.shrink();
          }

          final event = events[index];
          return EventCard(
            event: event,
            onTap: () => _navigateToEventDetails(event.id),
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
      return ErrorDisplay.network(
        onRetry: _refresh,
      );
    } else if (errorMessage.contains('UNAUTHENTICATED') ||
        errorMessage.contains('AuthenticationFailure')) {
      return ErrorDisplay.unauthorized();
    } else if (errorMessage.contains('TimeoutException')) {
      return ErrorDisplay(
        message: 'Request Timeout',
        details: 'The request took too long to complete. Please try again.',
        onRetry: _refresh,
        icon: Icons.access_time,
      );
    } else {
      return ErrorDisplay.server(
        onRetry: _refresh,
        details: errorMessage,
      );
    }
  }

  void _showFiltersDialog() {
    showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      isScrollControlled: true,
      builder: (context) => _EventFiltersSheet(
        currentFilters: _filters,
      ),
    ).then((filters) {
      if (filters != null) {
        _applyFilters(filters);
      }
    });
  }

  void _navigateToEventDetails(String eventId) {
    // TODO: Navigate to event details page
    // This will be implemented when routing is added
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Navigate to event details: $eventId'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

/// Event filters bottom sheet
class _EventFiltersSheet extends StatefulWidget {
  final Map<String, dynamic>? currentFilters;

  const _EventFiltersSheet({
    this.currentFilters,
  });

  @override
  State<_EventFiltersSheet> createState() => _EventFiltersSheetState();
}

class _EventFiltersSheetState extends State<_EventFiltersSheet> {
  Set<EventType> _selectedEventTypes = {};
  DateTimeRange? _dateRange;
  bool _requiresPayment = false;
  bool _requiresApproval = false;

  @override
  void initState() {
    super.initState();
    _loadCurrentFilters();
  }

  void _loadCurrentFilters() {
    if (widget.currentFilters != null) {
      final eventTypes = widget.currentFilters!['eventTypes'] as List<String>?;
      if (eventTypes != null) {
        _selectedEventTypes = eventTypes
            .map((type) => EventType.values.firstWhere(
                  (e) => e.toString() == type,
                  orElse: () => EventType.social,
                ))
            .toSet();
      }

      _requiresPayment = widget.currentFilters!['requiresPayment'] as bool? ?? false;
      _requiresApproval = widget.currentFilters!['requiresApproval'] as bool? ?? false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return Column(
          children: [
            // Handle bar
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: theme.colorScheme.onSurfaceVariant.withOpacity(0.4),
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Filter Events',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: _clearFilters,
                    child: const Text('Clear All'),
                  ),
                ],
              ),
            ),

            const Divider(),

            // Filters content
            Expanded(
              child: ListView(
                controller: scrollController,
                padding: const EdgeInsets.all(16),
                children: [
                  // Event types
                  Text(
                    'Event Types',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: EventType.values.map((type) {
                      final isSelected = _selectedEventTypes.contains(type);
                      return FilterChip(
                        label: Text(_getEventTypeLabel(type)),
                        selected: isSelected,
                        onSelected: (selected) {
                          setState(() {
                            if (selected) {
                              _selectedEventTypes.add(type);
                            } else {
                              _selectedEventTypes.remove(type);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 24),

                  // Date range
                  Text(
                    'Date Range',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                    onPressed: _selectDateRange,
                    icon: const Icon(Icons.date_range),
                    label: Text(
                      _dateRange != null
                          ? '${_dateRange!.start.toLocal().toString().split(' ')[0]} - ${_dateRange!.end.toLocal().toString().split(' ')[0]}'
                          : 'Select date range',
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Additional filters
                  Text(
                    'Additional Filters',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SwitchListTile(
                    title: const Text('Requires Payment'),
                    value: _requiresPayment,
                    onChanged: (value) {
                      setState(() {
                        _requiresPayment = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Requires Approval'),
                    value: _requiresApproval,
                    onChanged: (value) {
                      setState(() {
                        _requiresApproval = value;
                      });
                    },
                  ),
                ],
              ),
            ),

            // Apply button
            Padding(
              padding: const EdgeInsets.all(16),
              child: FilledButton(
                onPressed: _applyFilters,
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(48),
                ),
                child: const Text('Apply Filters'),
              ),
            ),
          ],
        );
      },
    );
  }

  void _clearFilters() {
    setState(() {
      _selectedEventTypes.clear();
      _dateRange = null;
      _requiresPayment = false;
      _requiresApproval = false;
    });
  }

  Future<void> _selectDateRange() async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      initialDateRange: _dateRange,
    );

    if (picked != null) {
      setState(() {
        _dateRange = picked;
      });
    }
  }

  void _applyFilters() {
    final filters = <String, dynamic>{};

    if (_selectedEventTypes.isNotEmpty) {
      filters['eventTypes'] = _selectedEventTypes
          .map((type) => type.toString())
          .toList();
    }

    if (_dateRange != null) {
      filters['startDate'] = _dateRange!.start.toIso8601String();
      filters['endDate'] = _dateRange!.end.toIso8601String();
    }

    if (_requiresPayment) {
      filters['requiresPayment'] = true;
    }

    if (_requiresApproval) {
      filters['requiresApproval'] = true;
    }

    Navigator.of(context).pop(filters.isEmpty ? null : filters);
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
