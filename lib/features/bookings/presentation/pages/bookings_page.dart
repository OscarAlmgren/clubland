import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/design_system/design_system.dart';
import '../../../../shared/widgets/app_error_widget.dart';
import '../../../../shared/widgets/app_loading_widget.dart';
import '../../data/models/booking_model.dart';
import '../controllers/bookings_controller.dart';
import '../widgets/booking_card_widget.dart';
import '../widgets/booking_filters_widget.dart';
import '../widgets/past_bookings_section.dart';
import '../widgets/upcoming_bookings_section.dart';

/// Bookings page - comprehensive booking management and history
class BookingsPage extends ConsumerStatefulWidget {
  /// Constructs a [BookingsPage]
  const BookingsPage({super.key});

  @override
  ConsumerState<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends ConsumerState<BookingsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  BookingStatus? _currentFilter;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('My Bookings'),
      centerTitle: true,
      elevation: 0,
      actions: [
        IconButton(
          icon: const Icon(Icons.filter_list),
          onPressed: () => _showFilters(context),
          tooltip: 'Filter bookings',
        ),
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          onPressed: () => context.push('/notifications'),
          tooltip: 'Notifications',
        ),
      ],
      bottom: TabBar(
        controller: _tabController,
        tabs: const [
          Tab(icon: Icon(Icons.schedule), text: 'Upcoming'),
          Tab(icon: Icon(Icons.history), text: 'Past'),
          Tab(icon: Icon(Icons.all_inbox), text: 'All'),
        ],
      ),
    ),
    body: TabBarView(
      controller: _tabController,
      children: [_buildUpcomingTab(), _buildPastTab(), _buildAllBookingsTab()],
    ),
    floatingActionButton: FloatingActionButton.extended(
      onPressed: () => context.push('/clubs'),
      icon: const Icon(Icons.add),
      label: const Text('New Booking'),
      tooltip: 'Create new booking',
    ),
  );

  Widget _buildUpcomingTab() => RefreshIndicator(
    onRefresh: () async {
      ref.invalidate(upcomingBookingsProvider);
    },
    child: const UpcomingBookingsSection(),
  );

  Widget _buildPastTab() => RefreshIndicator(
    onRefresh: () async {
      ref.invalidate(pastBookingsProvider);
    },
    child: const PastBookingsSection(),
  );

  Widget _buildAllBookingsTab() {
    final bookingsState = ref.watch(allBookingsProvider);

    return bookingsState.when(
      data: (List<BookingModel> bookings) => RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(allBookingsProvider);
        },
        child: bookings.isEmpty
            ? const _EmptyBookingsView()
            : ListView.separated(
                padding: AppSpacing.pagePadding,
                itemCount: bookings.length,
                separatorBuilder: (context, index) =>
                    AppSpacing.verticalSpaceMD,
                itemBuilder: (context, index) {
                  final booking = bookings[index];
                  return BookingCardWidget(
                    booking: booking,
                    onTap: () => context.push('/bookings/${booking.id}'),
                    onCancel: booking.canBeCancelled
                        ? () => _cancelBooking(booking.id)
                        : null,
                    onModify: booking.canBeModified
                        ? () => context.push('/bookings/${booking.id}/edit')
                        : null,
                  );
                },
              ),
      ),
      loading: () => const AppLoadingWidget(message: 'Loading bookings...'),
      error: (Object error, StackTrace stack) => AppErrorWidget(
        error: error.toString(),
        onRetry: () => ref.invalidate(allBookingsProvider),
      ),
    );
  }

  void _showFilters(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => BookingFiltersWidget(
        currentFilter: _currentFilter,
        onFilterChanged: (BookingStatus? filter) {
          setState(() => _currentFilter = filter);
          ref.read(bookingsControllerProvider.notifier).applyFilter(filter);
        },
      ),
    );
  }

  Future<void> _cancelBooking(String bookingId) async {
    // Show confirmation dialog
    final shouldCancel = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cancel Booking'),
        content: const Text(
          'Are you sure you want to cancel this booking? '
          'This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Keep Booking'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Cancel Booking'),
          ),
        ],
      ),
    );

    if (shouldCancel ?? false) {
      // Show reason dialog
      String? reason;
      if (mounted) {
        await showDialog<void>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Cancellation Reason'),
            content: TextField(
              decoration: const InputDecoration(
                hintText: "Optional: Tell us why you're cancelling",
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              onChanged: (value) => reason = value,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Skip'),
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  ref
                      .read(bookingsControllerProvider.notifier)
                      .cancelBooking(bookingId, reason: reason);
                },
                child: const Text('Cancel Booking'),
              ),
            ],
          ),
        );
      }
    }
  }
}

class _EmptyBookingsView extends StatelessWidget {
  const _EmptyBookingsView();

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.event_busy_outlined,
          size: 80,
          color: Theme.of(context).colorScheme.outline,
        ),
        AppSpacing.verticalSpaceLG,
        Text(
          'No Bookings Yet',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        AppSpacing.verticalSpaceMD,
        Text(
          'Discover amazing clubs and make your first booking!',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
        AppSpacing.verticalSpaceLG,
        FilledButton.icon(
          onPressed: () => context.push('/clubs'),
          icon: const Icon(Icons.explore),
          label: const Text('Explore Clubs'),
        ),
      ],
    ),
  );
}
