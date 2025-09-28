import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/design_system/design_system.dart';
import '../../../../shared/widgets/app_error_widget.dart';
import '../../../../shared/widgets/app_loading_widget.dart';
import '../../../../shared/widgets/location_permission_widget.dart';
import '../controllers/clubs_controller.dart';
import '../widgets/club_card_widget.dart';
import '../widgets/club_filters_bottom_sheet.dart';
import '../widgets/club_search_delegate.dart';
import '../widgets/featured_clubs_section.dart';
import '../widgets/nearby_clubs_section.dart';

/// Clubs page - comprehensive club discovery and browsing
class ClubsPage extends ConsumerStatefulWidget {
  /// Constructs a [ClubsPage]
  const ClubsPage({super.key});

  @override
  ConsumerState<ClubsPage> createState() => _ClubsPageState();
}

class _ClubsPageState extends ConsumerState<ClubsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      // Load more clubs when near bottom
      ref.read(clubsControllerProvider.notifier).loadMoreClubs();
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasLocationPermission = ref.watch(locationPermissionProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover Clubs'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _showSearch(context),
            tooltip: 'Search clubs',
          ),
          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: () => _showFilters(context),
            tooltip: 'Filter clubs',
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () => context.push('/clubs/favorites'),
            tooltip: 'Favorite clubs',
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.explore), text: 'Explore'),
            Tab(icon: Icon(Icons.location_on), text: 'Nearby'),
            Tab(icon: Icon(Icons.star), text: 'Featured'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildExploreTab(),
          _buildNearbyTab(hasLocationPermission.value ?? false),
          _buildFeaturedTab(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _findNearbyClubs,
        icon: const Icon(Icons.my_location),
        label: const Text('Find Nearby'),
      ),
    );
  }

  Widget _buildExploreTab() {
    final clubsState = ref.watch(clubsControllerProvider);

    return clubsState.when(
      data: (clubs) => RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(clubsControllerProvider);
        },
        child: clubs.isEmpty
            ? const _EmptyClubsView()
            : ListView.separated(
                controller: _scrollController,
                padding: const EdgeInsets.all(16),
                itemCount: clubs.length + 1,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  if (index == clubs.length) {
                    return const _LoadMoreIndicator();
                  }

                  final club = clubs[index];
                  return ClubCardWidget(
                    club: club,
                    onTap: () => context.push('/clubs/${club.id}'),
                    onFavorite: () => _toggleFavorite(club.id),
                  );
                },
              ),
      ),
      loading: () => const AppLoadingWidget(message: 'Loading clubs...'),
      error: (error, stack) => AppErrorWidget(
        error: error.toString(),
        onRetry: () => ref.invalidate(clubsControllerProvider),
      ),
    );
  }

  Widget _buildNearbyTab(bool hasLocationPermission) {
    if (!hasLocationPermission) {
      return const LocationPermissionWidget(
        title: 'Find Nearby Clubs',
        description: 'Allow location access to discover clubs around you.',
      );
    }

    return const NearbyClubsSection();
  }

  Widget _buildFeaturedTab() => const FeaturedClubsSection();

  void _showSearch(BuildContext context) {
    showSearch(context: context, delegate: ClubSearchDelegate());
  }

  void _showFilters(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const ClubFiltersBottomSheet(),
    );
  }

  void _findNearbyClubs() {
    _tabController.animateTo(1);
    ref.read(clubsControllerProvider.notifier).findNearbyClubs();
  }

  void _toggleFavorite(String clubId) {
    ref.read(clubsControllerProvider.notifier).toggleFavoriteClub(clubId);
  }
}

class _EmptyClubsView extends StatelessWidget {
  const _EmptyClubsView();

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.location_city_outlined,
          size: 80,
          color: Theme.of(context).colorScheme.outline,
        ),
        AppSpacing.verticalSpaceLG,
        Text(
          'No Clubs Found',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        AppSpacing.verticalSpaceMD,
        Text(
          'Try adjusting your filters or search in a different area.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
        AppSpacing.verticalSpaceLG,
        FilledButton.icon(
          onPressed: () => context.go('/clubs'),
          icon: const Icon(Icons.refresh),
          label: const Text('Refresh'),
        ),
      ],
    ),
  );
}

class _LoadMoreIndicator extends ConsumerWidget {
  const _LoadMoreIndicator();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(clubsControllerProvider.notifier);
    final isLoadingMore = controller.isLoadingMore;

    if (isLoadingMore) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return const SizedBox.shrink();
  }
}
