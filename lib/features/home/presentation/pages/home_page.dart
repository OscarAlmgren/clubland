import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/design_system/design_system.dart';
import '../../domain/entities/news_feed_item_entity.dart';
import '../controllers/news_feed_controller.dart';
import '../widgets/lunch_menu_card.dart';
import '../widgets/news_feed_event_card.dart';
import '../widgets/news_post_card.dart';
import '../widgets/rsvp_modal.dart';

/// Home page - main dashboard for the app with news feed
class HomePage extends ConsumerWidget {
  /// Constructs a [HomePage].
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final newsFeedState = ref.watch(newsFeedControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // Handle notifications
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(newsFeedControllerProvider.notifier).refresh();
        },
        child: SingleChildScrollView(
          padding: AppSpacing.pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to Clubland',
                style: AppTextStyles.headlineMedium.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
              AppSpacing.verticalSpaceSM,
              Text(
                'Stay up to date with club news, events, and dining.',
                style: AppTextStyles.bodyLarge.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
              AppSpacing.verticalSpaceXXL,

              // News Feed Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'News Feed',
                    style: AppTextStyles.titleMedium.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                  if (newsFeedState.isLoading)
                    const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                ],
              ),
              AppSpacing.verticalSpaceMD,

              // News feed items
              newsFeedState.when(
                data: (items) => _buildNewsFeed(context, ref, items),
                loading: () => const Center(
                  child: Padding(
                    padding: EdgeInsets.all(32.0),
                    child: CircularProgressIndicator(),
                  ),
                ),
                error: (error, stack) => Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      children: [
                        Icon(Icons.error_outline, size: 48, color: AppColors.error),
                        AppSpacing.verticalSpaceMD,
                        Text(
                          'Failed to load news feed',
                          style: AppTextStyles.titleMedium,
                        ),
                        AppSpacing.verticalSpaceSM,
                        Text(
                          error.toString(),
                          style: AppTextStyles.bodySmall,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNewsFeed(
    BuildContext context,
    WidgetRef ref,
    List<NewsFeedItemEntity> items,
  ) {
    if (items.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            'No news feed items available',
            style: AppTextStyles.bodyMedium,
          ),
        ),
      );
    }

    return Column(
      children: items.map((item) {
        switch (item.type) {
          case NewsFeedItemType.newsPost:
            // Skip item if newsPost is null (data integrity issue)
            final newsPost = item.newsPost;
            if (newsPost == null) {
              return const SizedBox.shrink();
            }
            return NewsPostCard(
              newsPost: newsPost,
              onTap: () {
                // Could navigate to full news article
              },
            );

          case NewsFeedItemType.event:
            // Skip item if event is null (data integrity issue)
            final event = item.event;
            if (event == null) {
              return const SizedBox.shrink();
            }
            return NewsFeedEventCard(
              event: event,
              userRSVPStatus: item.userRSVPStatus,
              onTap: () {
                // Navigate to event details
                context.go('/events/${event.clubId}/event/${event.id}');
              },
              onRSVPTap: () async {
                final response = await RSVPModal.show(
                  context: context,
                  event: event,
                );

                if (response != null) {
                  // Map response to RSVP status
                  String status;
                  switch (response) {
                    case RSVPResponse.yes:
                      status = 'confirmed';
                    case RSVPResponse.maybe:
                      status = 'tentative';
                    case RSVPResponse.no:
                      status = 'declined';
                  }

                  // Update RSVP status
                  await ref
                      .read(newsFeedControllerProvider.notifier)
                      .updateRSVP(event.id, status);

                  // Show confirmation
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'RSVP updated to: ${status.toUpperCase()}',
                        ),
                      ),
                    );
                  }
                }
              },
            );

          case NewsFeedItemType.lunchMenu:
            // Skip item if lunchMenu is null (data integrity issue)
            final lunchMenu = item.lunchMenu;
            if (lunchMenu == null) {
              return const SizedBox.shrink();
            }
            return LunchMenuCard(
              lunchMenu: lunchMenu,
              onTap: () {
                // Could navigate to full menu or restaurant page
              },
            );
        }
      }).toList(),
    );
  }
}
