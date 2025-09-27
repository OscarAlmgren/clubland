import 'package:flutter/material.dart';

class ProfileStatsWidget extends StatelessWidget {
  const ProfileStatsWidget({
    required this.user,
    super.key,
  });

  final SimpleUser user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildStatItem(
          context,
          'Visits',
          user.visitCount.toString(),
          Icons.location_on,
        ),
        _buildStatItem(
          context,
          'Reviews',
          user.reviewCount.toString(),
          Icons.rate_review,
        ),
        _buildStatItem(
          context,
          'Clubs',
          user.clubCount.toString(),
          Icons.business,
        ),
        _buildStatItem(
          context,
          'Points',
          user.points.toString(),
          Icons.star,
        ),
      ],
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 24,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
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
}

// Simple user data class for profile
class SimpleUser {
  const SimpleUser({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.avatar,
    this.bio,
    this.visitCount = 0,
    this.reviewCount = 0,
    this.clubCount = 0,
    this.points = 0,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String? avatar;
  final String? bio;
  final int visitCount;
  final int reviewCount;
  final int clubCount;
  final int points;

  String get fullName => '$firstName $lastName';
}