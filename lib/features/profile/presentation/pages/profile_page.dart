import '../../../../core/design_system/design_system.dart';

/// Profile page - user profile and settings
class ProfilePage extends StatelessWidget {
  /// Constructs a [ProfilePage]
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to settings
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: AppSpacing.pagePadding,
        child: Column(
          children: [
            // Profile Header
            AppCard(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: colorScheme.primary,
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: colorScheme.onPrimary,
                    ),
                  ),
                  AppSpacing.verticalSpaceMD,
                  Text('John Doe', style: AppTextStyles.titleLarge),
                  AppSpacing.verticalSpaceXS,
                  Text(
                    'john.doe@example.com',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  AppSpacing.verticalSpaceMD,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            '12',
                            style: AppTextStyles.titleMedium.copyWith(
                              color: colorScheme.primary,
                            ),
                          ),
                          Text('Visits', style: AppTextStyles.bodySmall),
                        ],
                      ),
                      Container(
                        width: 1,
                        height: 40,
                        color: colorScheme.outline.withValues(alpha: 0.3),
                      ),
                      Column(
                        children: [
                          Text(
                            'Gold',
                            style: AppTextStyles.titleMedium.copyWith(
                              color: AppColors.membershipTierColors['gold'],
                            ),
                          ),
                          Text('Membership', style: AppTextStyles.bodySmall),
                        ],
                      ),
                      Container(
                        width: 1,
                        height: 40,
                        color: colorScheme.outline.withValues(alpha: 0.3),
                      ),
                      Column(
                        children: [
                          Text(
                            '8',
                            style: AppTextStyles.titleMedium.copyWith(
                              color: colorScheme.primary,
                            ),
                          ),
                          Text('Clubs', style: AppTextStyles.bodySmall),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            AppSpacing.verticalSpaceXXL,

            // Menu Items
            _buildMenuSection(context, 'Account', [
              _MenuItem(
                icon: Icons.person_outline,
                title: 'Edit Profile',
                onTap: () {},
              ),
              _MenuItem(
                icon: Icons.card_membership,
                title: 'Membership',
                subtitle: 'Gold Member',
                onTap: () {},
              ),
              _MenuItem(
                icon: Icons.payment,
                title: 'Payment Methods',
                onTap: () {},
              ),
            ]),

            AppSpacing.verticalSpaceXL,

            _buildMenuSection(context, 'Preferences', [
              _MenuItem(
                icon: Icons.notifications_outlined,
                title: 'Notifications',
                onTap: () {},
              ),
              _MenuItem(
                icon: Icons.security,
                title: 'Privacy & Security',
                onTap: () {},
              ),
              _MenuItem(
                icon: Icons.language,
                title: 'Language',
                subtitle: 'English',
                onTap: () {},
              ),
            ]),

            AppSpacing.verticalSpaceXL,

            _buildMenuSection(context, 'Support', [
              _MenuItem(
                icon: Icons.help_outline,
                title: 'Help & Support',
                onTap: () {},
              ),
              _MenuItem(icon: Icons.info_outline, title: 'About', onTap: () {}),
              _MenuItem(
                icon: Icons.logout,
                title: 'Sign Out',
                onTap: () {},
                isDestructive: true,
              ),
            ]),
          ],
        ),
      ),
    );
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
