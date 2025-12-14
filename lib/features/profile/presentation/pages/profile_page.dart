import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/route_paths.dart';
import '../../../../generated/l10n/l10n.dart';
import '../../../auth/presentation/controllers/auth_controller.dart';
import '../../domain/entities/simple_activity.dart';
import '../../domain/entities/simple_user.dart';
import '../widgets/activity_feed_widget.dart';
import '../widgets/profile_stats_widget.dart';
import '../widgets/user_achievements_widget.dart';

/// Profile page - comprehensive user profile with social features
class ProfilePage extends ConsumerStatefulWidget {
  /// Constructs a [ProfilePage]
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // For now, use mock user data
    const currentUser = SimpleUser(
      id: '1',
      firstName: 'John',
      lastName: 'Doe',
      email: 'john.doe@example.com',
      bio:
          'Passionate about exploring exclusive clubs and connecting with fellow members.',
      visitCount: 24,
      reviewCount: 12,
      clubCount: 8,
      points: 4520,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).profile),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () => context.push('/profile/edit'),
            tooltip: S.of(context).editProfile,
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => context.push('/settings'),
            tooltip: S.of(context).settings,
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: [
            Tab(
              icon: const Icon(Icons.person_outline),
              text: S.of(context).overview,
            ),
            Tab(icon: const Icon(Icons.timeline), text: S.of(context).activity),
            Tab(
              icon: const Icon(Icons.emoji_events),
              text: S.of(context).achievements,
            ),
            Tab(icon: const Icon(Icons.menu), text: S.of(context).more),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOverviewTab(currentUser),
          _buildActivityTab(),
          _buildAchievementsTab(),
          _buildMoreTab(),
        ],
      ),
    );
  }

  Widget _buildOverviewTab(SimpleUser user) => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Header Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Avatar and Basic Info
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: user.avatar != null
                              ? NetworkImage(user.avatar!)
                              : null,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          child: user.avatar == null
                              ? Icon(
                                  Icons.person,
                                  size: 40,
                                  color: Theme.of(context).colorScheme.onPrimary,
                                )
                              : null,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user.fullName,
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      color: Theme.of(context).colorScheme.onSurface,
                                    ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                user.email,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurfaceVariant,
                                    ),
                              ),
                              if (user.bio case final bio?) ...[
                                const SizedBox(height: 4),
                                Text(
                                  bio,
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                                      ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Profile Stats
                    ProfileStatsWidget(user: user),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Quick Actions
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      S.of(context).quickActions,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                  ),
                  _buildQuickAction(
                    icon: Icons.favorite_outline,
                    title: S.of(context).favoriteClubs,
                    subtitle: S.of(context).favoriteClubsSubtitle,
                    onTap: () => context.push('/clubs/favorites'),
                  ),
                  _buildQuickAction(
                    icon: Icons.history,
                    title: S.of(context).visitHistory,
                    subtitle: S.of(context).visitHistorySubtitle,
                    onTap: () => context.push('/profile/visits'),
                  ),
                  _buildQuickAction(
                    icon: Icons.reviews_outlined,
                    title: S.of(context).myReviews,
                    subtitle: S.of(context).myReviewsSubtitle,
                    onTap: () => context.push('/profile/reviews'),
                  ),
                  _buildQuickAction(
                    icon: Icons.share,
                    title: S.of(context).shareProfile,
                    subtitle: S.of(context).shareProfileSubtitle,
                    onTap: _shareProfile,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Recent Activity Preview
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            S.of(context).recentActivity,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Theme.of(context).colorScheme.onSurface,
                                ),
                          ),
                        ),
                        TextButton(
                          onPressed: () => _tabController.animateTo(1),
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                          ),
                          child: Text(S.of(context).viewAll),
                        ),
                      ],
                    ),
                  ),
                  // Mock recent activities
                  Column(
                    children: [
                      ActivityTile(
                        activity: SimpleActivity(
                          id: '1',
                          type: 'visit',
                          title: 'Visited Elite Country Club',
                          description: 'Enjoyed an excellent dinner',
                          timestamp: DateTime.now().subtract(
                            const Duration(hours: 2),
                          ),
                        ),
                        compact: true,
                      ),
                      ActivityTile(
                        activity: SimpleActivity(
                          id: '2',
                          type: 'review',
                          title: 'Reviewed Metropolitan Club',
                          description: 'Great service and atmosphere',
                          timestamp: DateTime.now().subtract(
                            const Duration(days: 1),
                          ),
                        ),
                        compact: true,
                      ),
                      ActivityTile(
                        activity: SimpleActivity(
                          id: '3',
                          type: 'favorite',
                          title: 'Added Yacht Club to favorites',
                          description: 'Planning a visit next weekend',
                          timestamp: DateTime.now().subtract(
                            const Duration(days: 3),
                          ),
                        ),
                        compact: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildActivityTab() => const ActivityFeedWidget();

  Widget _buildAchievementsTab() =>
      SingleChildScrollView(child: const UserAchievementsWidget());

  Widget _buildMoreTab() => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildMenuSection(context, S.of(context).account, [
              _MenuItem(
                icon: Icons.person_outline,
                title: S.of(context).editProfile,
                onTap: () => context.push('/profile/edit'),
              ),
              _MenuItem(
                icon: Icons.card_membership,
                title: S.of(context).membership,
                subtitle: S.of(context).membershipSubtitle,
                onTap: () => context.push('/profile/memberships'),
              ),
              _MenuItem(
                icon: Icons.payment,
                title: S.of(context).paymentMethods,
                onTap: () => context.push('/profile/payments'),
              ),
              _MenuItem(
                icon: Icons.security,
                title: S.of(context).privacySecurity,
                onTap: () => context.push('/settings/privacy'),
              ),
            ]),

            const SizedBox(height: 32),

            _buildMenuSection(context, S.of(context).social, [
              _MenuItem(
                icon: Icons.people_outline,
                title: S.of(context).friends,
                subtitle: S.of(context).friendsSubtitle,
                onTap: () => context.push('/social/friends'),
              ),
              _MenuItem(
                icon: Icons.group_outlined,
                title: S.of(context).groups,
                subtitle: S.of(context).groupsSubtitle,
                onTap: () => context.push('/social/groups'),
              ),
              _MenuItem(
                icon: Icons.notifications_outlined,
                title: S.of(context).notifications,
                onTap: () => context.push('/settings/notifications'),
              ),
            ]),

            const SizedBox(height: 32),

            _buildMenuSection(context, S.of(context).support, [
              _MenuItem(
                icon: Icons.help_outline,
                title: S.of(context).helpSupport,
                onTap: () => context.push('/support'),
              ),
              _MenuItem(
                icon: Icons.feedback_outlined,
                title: S.of(context).sendFeedback,
                onTap: () => context.push('/feedback'),
              ),
              _MenuItem(
                icon: Icons.info_outline,
                title: S.of(context).about,
                onTap: () => context.push('/about'),
              ),
              _MenuItem(
                icon: Icons.logout,
                title: S.of(context).signOut,
                onTap: _signOut,
                isDestructive: true,
              ),
            ]),
          ],
        ),
      );

  Widget _buildQuickAction({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) =>
      InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      );

  void _shareProfile() {
    // Implement profile sharing functionality
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(S.of(context).profileSharingComingSoon)),
    );
  }

  Future<void> _signOut() async {
    final shouldSignOut = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(S.of(context).signOutConfirmTitle),
        content: Text(S.of(context).signOutConfirmMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(S.of(context).cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(S.of(context).signOut),
          ),
        ],
      ),
    );

    // 💡 Check the State's mounted property immediately and exit if false.
    if (!mounted) return;

    if (shouldSignOut ?? false) {
      // Perform logout
      await ref.read(authControllerProvider.notifier).logout();

      // Navigate to login page after successful logout
      if (mounted) {
        context.go(RoutePaths.login);
      }
    }
  }

  Widget _buildMenuSection(
    BuildContext context,
    String title,
    List<_MenuItem> items,
  ) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: Column(
              children: items.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;
                final isLast = index == items.length - 1;

                return Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        item.icon,
                        color: item.isDestructive
                            ? Theme.of(context).colorScheme.error
                            : Theme.of(context).colorScheme.onSurface,
                      ),
                      title: Text(
                        item.title,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: item.isDestructive
                                  ? Theme.of(context).colorScheme.error
                                  : Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                      subtitle: item.subtitle != null
                          ? Text(
                              item.subtitle!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurfaceVariant,
                                  ),
                            )
                          : null,
                      trailing: const Icon(Icons.chevron_right),
                      onTap: item.onTap,
                    ),
                    if (!isLast)
                      Divider(
                        height: 1,
                        indent: 56,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      );
}

class _MenuItem {
  const _MenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.subtitle,
    this.isDestructive = false,
  });
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;
  final bool isDestructive;
}
