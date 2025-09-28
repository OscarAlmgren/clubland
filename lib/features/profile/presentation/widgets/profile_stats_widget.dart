import 'package:flutter/material.dart';

import '../../../../generated/l10n/l10n.dart';

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
  ) => Column(
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

// Simple user data class for profile
/// A data model containing a summary of a user's key profile information and statistics.
class SimpleUser {
  /// Constructs a [SimpleUser] model.
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

  /// The unique identifier for the user.
  final String id;

  /// The user's first name.
  final String firstName;

  /// The user's last name.
  final String lastName;

  /// The user's email address.
  final String email;

  /// The URL of the user's avatar image.
  final String? avatar;

  /// A short biography or description of the user.
  final String? bio;

  /// The total number of club visits recorded for the user. Defaults to 0.
  final int visitCount;

  /// The total number of reviews written by the user. Defaults to 0.
  final int reviewCount;

  /// The total number of clubs the user is associated with. Defaults to 0.
  final int clubCount;

  /// The total loyalty or achievement points the user has earned. Defaults to 0.
  final int points;

  /// A computed property that returns the user's full name.
  String get fullName => '$firstName $lastName';
}
