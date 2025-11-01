import 'package:flutter/material.dart';

import '../../../../generated/l10n/l10n.dart';
import '../../domain/entities/simple_user.dart';

/// A widget that displays a user's key profile statistics (visits, reviews, clubs, points)
/// in a horizontal row.
class ProfileStatsWidget extends StatelessWidget {
  /// Constructs a [ProfileStatsWidget].
  const ProfileStatsWidget({required this.user, super.key});

  /// The simple user data model containing the statistics to display.
  final SimpleUser user;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem(
            context,
            S.of(context).visits,
            user.visitCount.toString(),
            Icons.location_on,
          ),
          _buildStatItem(
            context,
            S.of(context).reviews,
            user.reviewCount.toString(),
            Icons.rate_review,
          ),
          _buildStatItem(
            context,
            S.of(context).clubs,
            user.clubCount.toString(),
            Icons.business,
          ),
          _buildStatItem(
            context,
            S.of(context).points,
            user.points.toString(),
            Icons.star,
          ),
        ],
      );

  // Private method: documentation is not required for private members
  Widget _buildStatItem(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) =>
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 24, color: Theme.of(context).colorScheme.primary),
          const SizedBox(height: 4),
          Text(
            value,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
        ],
      );
}
