import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/design_system/design_system.dart';
import '../../../../shared/widgets/app_error_widget.dart';
import '../../../../shared/widgets/app_loading_widget.dart';
import '../../../auth/presentation/controllers/auth_controller.dart';
import '../../../social/presentation/controllers/activity_controller.dart';
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
    final currentUser = ref.watch(currentUserProvider);
    final userActivity = ref.watch(userActivityProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () => context.push('/profile/edit'),
            tooltip: 'Edit profile',
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => context.push('/settings'),
            tooltip: 'Settings',
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(icon: Icon(Icons.person_outline), text: 'Overview'),
            Tab(icon: Icon(Icons.timeline), text: 'Activity'),
            Tab(icon: Icon(Icons.emoji_events), text: 'Achievements'),
            Tab(icon: Icon(Icons.menu), text: 'More'),
          ],
        ),
      ),
      body: currentUser == null
          ? const AppLoadingWidget(message: 'Loading profile...')
          : TabBarView(
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

  Widget _buildOverviewTab(UserEntity user) {
    return SingleChildScrollView(
      padding: AppSpacing.pagePadding,
      child: Column(
        children: [
          // Profile Header Card
          AppCard(
            child: Padding(
              padding: AppSpacing.allMD,
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
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        child: user.avatar == null
                            ? Icon(
                                Icons.person,
                                size: 40,
                                color: Theme.of(context).colorScheme.onPrimary,
                              )
                            : null,
                      ),
                      AppSpacing.horizontalSpaceMD,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${user.firstName} ${user.lastName}',
                              style: AppTextStyles.titleLarge,
                            ),
                            AppSpacing.verticalSpaceXS,
                            Text(
                              user.email,
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
                            ),
                            if (user.profile?.bio != null) ...[
                              AppSpacing.verticalSpaceXS,
                              Text(
                                user.profile!.bio!,
                                style: AppTextStyles.bodySmall,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),

                  AppSpacing.verticalSpaceLG,

                  // Profile Stats
                  ProfileStatsWidget(user: user),
                ],
              ),
            ),
          ),

          AppSpacing.verticalSpaceLG,

          // Quick Actions
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: AppSpacing.allMD,
                  child: Text(
                    'Quick Actions',
                    style: AppTextStyles.titleMedium,
                  ),
                ),
                _buildQuickAction(
                  icon: Icons.favorite_outline,
                  title: 'Favorite Clubs',
                  subtitle: 'View your saved clubs',
                  onTap: () => context.push('/clubs/favorites'),
                ),
                _buildQuickAction(
                  icon: Icons.history,
                  title: 'Visit History',
                  subtitle: 'See where you\'ve been',
                  onTap: () => context.push('/profile/visits'),
                ),
                _buildQuickAction(
                  icon: Icons.reviews_outlined,
                  title: 'My Reviews',
                  subtitle: 'Manage your club reviews',
                  onTap: () => context.push('/profile/reviews'),
                ),
                _buildQuickAction(
                  icon: Icons.share,
                  title: 'Share Profile',
                  subtitle: 'Share with other members',
                  onTap: () => _shareProfile(),
                ),
              ],
            ),
          ),

          AppSpacing.verticalSpaceLG,

          // Recent Activity Preview
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: AppSpacing.allMD,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recent Activity',
                        style: AppTextStyles.titleMedium,
                      ),
                      TextButton(
                        onPressed: () => _tabController.animateTo(1),
                        child: const Text('View All'),
                      ),
                    ],
                  ),
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final recentActivity = ref.watch(
                      userActivityProvider.select((state) =>
                        state.when(
                          data: (activities) => activities.take(3).toList(),
                          loading: () => <ActivityEntity>[],
                          error: (_, __) => <ActivityEntity>[],
                        ),
                      ),
                    );

                    if (recentActivity.isEmpty) {
                      return Padding(
                        padding: AppSpacing.allMD,
                        child: Text(
                          'No recent activity',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      );
                    }

                    return Column(
                      children: recentActivity.map((activity) {
                        return ActivityTile(
                          activity: activity,
                          compact: true,
                        );
                      }).toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityTab() {
    return const ActivityFeedWidget();
  }

  Widget _buildAchievementsTab() {
    return const UserAchievementsWidget();
  }

  Widget _buildMoreTab() {
    return SingleChildScrollView(
      padding: AppSpacing.pagePadding,
      child: Column(
        children: [
          _buildMenuSection(context, 'Account', [
            _MenuItem(
              icon: Icons.person_outline,
              title: 'Edit Profile',
              onTap: () => context.push('/profile/edit'),
            ),
            _MenuItem(
              icon: Icons.card_membership,
              title: 'Membership',
              subtitle: 'Manage your memberships',
              onTap: () => context.push('/profile/memberships'),
            ),
            _MenuItem(
              icon: Icons.payment,
              title: 'Payment Methods',
              onTap: () => context.push('/profile/payments'),
            ),
            _MenuItem(
              icon: Icons.security,
              title: 'Privacy & Security',
              onTap: () => context.push('/settings/privacy'),
            ),
          ]),

          AppSpacing.verticalSpaceXL,

          _buildMenuSection(context, 'Social', [
            _MenuItem(
              icon: Icons.people_outline,
              title: 'Friends',
              subtitle: 'Connect with other members',
              onTap: () => context.push('/social/friends'),
            ),
            _MenuItem(
              icon: Icons.group_outlined,
              title: 'Groups',
              subtitle: 'Join interest groups',
              onTap: () => context.push('/social/groups'),
            ),
            _MenuItem(
              icon: Icons.notifications_outlined,
              title: 'Notifications',
              onTap: () => context.push('/settings/notifications'),
            ),
          ]),

          AppSpacing.verticalSpaceXL,

          _buildMenuSection(context, 'Support', [
            _MenuItem(
              icon: Icons.help_outline,
              title: 'Help & Support',
              onTap: () => context.push('/support'),
            ),
            _MenuItem(
              icon: Icons.feedback_outlined,
              title: 'Send Feedback',
              onTap: () => context.push('/feedback'),
            ),
            _MenuItem(
              icon: Icons.info_outline,
              title: 'About',
              onTap: () => context.push('/about'),
            ),
            _MenuItem(
              icon: Icons.logout,
              title: 'Sign Out',
              onTap: () => _signOut(),
              isDestructive: true,
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildQuickAction({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: AppSpacing.symmetricHorizontalMD + AppSpacing.symmetricVerticalSM,
        child: Row(
          children: [
            Container(
              padding: AppSpacing.allSM,
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
            AppSpacing.horizontalSpaceMD,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.bodyMedium),
                  AppSpacing.verticalSpaceXS,
                  Text(
                    subtitle,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
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
  }

  void _shareProfile() {
    // Implement profile sharing functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile sharing coming soon!')),
    );
  }

  Future<void> _signOut() async {
    final shouldSignOut = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );

    if (shouldSignOut == true) {
      await ref.read(authControllerProvider.notifier).logout();
    }
  }

  Widget _buildMenuSection(
    BuildContext context,
    String title,
    List<_MenuItem> items,
  ) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          title,
          style: AppTextStyles.titleSmall.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ),
      AppSpacing.verticalSpaceSM,
      AppCard(
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
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: item.isDestructive
                          ? Theme.of(context).colorScheme.error
                          : Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  subtitle: item.subtitle != null
                      ? Text(
                          item.subtitle!,
                          style: AppTextStyles.bodySmall.copyWith(
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
