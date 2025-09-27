import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/widgets/app_error_widget.dart';
import '../../../../shared/widgets/app_loading_widget.dart';
import '../controllers/clubs_controller.dart';
import 'club_card_widget.dart';

class NearbyClubsSection extends ConsumerWidget {
  const NearbyClubsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nearbyClubsState = ref.watch(nearbyClubsProvider);

    return nearbyClubsState.when(
      data: (clubs) => RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(nearbyClubsProvider);
        },
        child: clubs.isEmpty
            ? const _EmptyNearbyView()
            : ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: clubs.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final club = clubs[index];
                  return ClubCardWidget(
                    club: club,
                    onTap: () => context.push('/clubs/${club.id}'),
                    onFavorite: () => ref
                        .read(clubsControllerProvider.notifier)
                        .toggleFavoriteClub(club.id),
                  );
                },
              ),
      ),
      loading: () => const AppLoadingWidget(message: 'Finding nearby clubs...'),
      error: (error, stack) => AppErrorWidget(
        error: error.toString(),
        onRetry: () => ref.invalidate(nearbyClubsProvider),
      ),
    );
  }
}

class _EmptyNearbyView extends StatelessWidget {
  const _EmptyNearbyView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.location_searching,
            size: 80,
            color: Theme.of(context).colorScheme.outline,
          ),
          const SizedBox(height: 16),
          Text(
            'No Nearby Clubs Found',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            'Try expanding your search radius or check back later.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}