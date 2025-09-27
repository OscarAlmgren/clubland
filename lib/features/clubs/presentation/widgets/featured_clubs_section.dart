import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/widgets/app_error_widget.dart';
import '../../../../shared/widgets/app_loading_widget.dart';
import '../controllers/clubs_controller.dart';
import 'club_card_widget.dart';

class FeaturedClubsSection extends ConsumerWidget {
  const FeaturedClubsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final featuredClubsState = ref.watch(featuredClubsProvider);

    return featuredClubsState.when(
      data: (clubs) => RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(featuredClubsProvider);
        },
        child: clubs.isEmpty
            ? const _EmptyFeaturedView()
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
      loading: () => const AppLoadingWidget(message: 'Loading featured clubs...'),
      error: (error, stack) => AppErrorWidget(
        error: error.toString(),
        onRetry: () => ref.invalidate(featuredClubsProvider),
      ),
    );
  }
}

class _EmptyFeaturedView extends StatelessWidget {
  const _EmptyFeaturedView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.star_outline,
            size: 80,
            color: Theme.of(context).colorScheme.outline,
          ),
          const SizedBox(height: 16),
          Text(
            'No Featured Clubs',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            'Check back later for featured clubs.',
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