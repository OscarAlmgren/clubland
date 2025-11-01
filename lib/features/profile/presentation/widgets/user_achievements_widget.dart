import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/simple_achievement.dart';

/// A widget that displays a user's list of achievements.
///
/// It uses a ListView.separated to render a list of [AchievementCard] widgets.
class UserAchievementsWidget extends ConsumerWidget {
  /// Constructs a [UserAchievementsWidget].
  const UserAchievementsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Mock achievements data
    final achievements = [
      SimpleAchievement(
        id: '1',
        title: 'First Visit',
        description: 'Made your first club visit',
        icon: Icons.location_on,
        earned: true,
        earnedDate: DateTime.now().subtract(const Duration(days: 30)),
      ),
      SimpleAchievement(
        id: '2',
        title: 'Social Butterfly',
        description: 'Connect with 10 members',
        icon: Icons.people,
        earned: true,
        earnedDate: DateTime.now().subtract(const Duration(days: 15)),
      ),
      const SimpleAchievement(
        id: '3',
        title: 'Explorer',
        description: 'Visit 5 different clubs',
        icon: Icons.explore,
        earned: false,
        progress: 3,
        maxProgress: 5,
      ),
      const SimpleAchievement(
        id: '4',
        title: 'Reviewer',
        description: 'Write 10 club reviews',
        icon: Icons.rate_review,
        earned: false,
        progress: 2,
        maxProgress: 10,
      ),
    ];

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemCount: achievements.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final achievement = achievements[index];
        return AchievementCard(achievement: achievement);
      },
    );
  }
}

/// A card widget used to display the details of a single [SimpleAchievement].
class AchievementCard extends StatelessWidget {
  /// Constructs an [AchievementCard].
  const AchievementCard({required this.achievement, super.key});

  /// The achievement data to be displayed in the card.
  final SimpleAchievement achievement;

  @override
  Widget build(BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: achievement.earned
                      ? Theme.of(context).colorScheme.primaryContainer
                      : Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(
                  achievement.icon,
                  size: 30,
                  color: achievement.earned
                      ? Theme.of(context).colorScheme.onPrimaryContainer
                      : Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      achievement.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      achievement.description,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                    if (!achievement.earned && achievement.progress != null) ...[
                      const SizedBox(height: 8),
                      LinearProgressIndicator(
                        value: achievement.progress! / achievement.maxProgress!,
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.surfaceContainerHighest,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${achievement.progress}/${achievement.maxProgress}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                      ),
                    ],
                    if (achievement.earned && achievement.earnedDate != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        'Earned ${_formatDate(achievement.earnedDate!)}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ],
                ),
              ),
              if (achievement.earned)
                Icon(
                  Icons.check_circle,
                  color: Theme.of(context).colorScheme.primary,
                  size: 24,
                ),
            ],
          ),
        ),
      );

  // Private method: documentation not required for private members
  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 30) {
      final months = (difference.inDays / 30).floor();
      return '$months month${months > 1 ? 's' : ''} ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else {
      return 'Today';
    }
  }
}
