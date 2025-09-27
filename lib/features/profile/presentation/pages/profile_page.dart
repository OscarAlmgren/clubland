import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
    final currentUser = SimpleUser(
      id: '1',
      firstName: 'John',
      lastName: 'Doe',
      email: 'john.doe@example.com',
      bio: 'Passionate about exploring exclusive clubs and connecting with fellow members.',
      visitCount: 24,
      reviewCount: 12,
      clubCount: 8,
      points: 4520,
    );

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

  Widget _buildOverviewTab(SimpleUser user) {
    return SingleChildScrollView(
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
                        backgroundColor: Theme.of(context).colorScheme.primary,
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
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              user.email,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
                            ),
                            if (user.bio != null) ...[
                              const SizedBox(height: 4),
                              Text(
                                user.bio!,
                                style: Theme.of(context).textTheme.bodySmall,
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
                    'Quick Actions',
                    style: Theme.of(context).textTheme.titleMedium,
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
                      Text(
                        'Recent Activity',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      TextButton(
                        onPressed: () => _tabController.animateTo(1),
                        child: const Text('View All'),
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
                        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
                      ),
                      compact: true,
                    ),
                    ActivityTile(
                      activity: SimpleActivity(
                        id: '2',
                        type: 'review',
                        title: 'Reviewed Metropolitan Club',
                        description: 'Great service and atmosphere',
                        timestamp: DateTime.now().subtract(const Duration(days: 1)),
                      ),
                      compact: true,
                    ),
                    ActivityTile(
                      activity: SimpleActivity(
                        id: '3',
                        type: 'favorite',
                        title: 'Added Yacht Club to favorites',
                        description: 'Planning a visit next weekend',
                        timestamp: DateTime.now().subtract(const Duration(days: 3)),
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
  }

  Widget _buildActivityTab() {
    return const ActivityFeedWidget();
  }

  Widget _buildAchievementsTab() {
    return const UserAchievementsWidget();
  }

  Widget _buildMoreTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
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

          const SizedBox(height: 32),

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

          const SizedBox(height: 32),

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
                  Text(title, style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
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
      // TODO(profile): Implement logout functionality
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Logout functionality coming soon!')),
        );
      }
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
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
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
