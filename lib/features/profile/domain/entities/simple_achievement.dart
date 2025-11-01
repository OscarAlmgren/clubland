import 'package:flutter/material.dart';

/// A simple data model representing a user achievement.
class SimpleAchievement {
  /// Constructs a [SimpleAchievement].
  const SimpleAchievement({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.earned,
    this.earnedDate,
    this.progress,
    this.maxProgress,
  });

  /// The unique identifier for the achievement.
  final String id;

  /// The public title of the achievement.
  final String title;

  /// A brief explanation of how the achievement was earned.
  final String description;

  /// The icon representing the achievement.
  final IconData icon;

  /// Flag indicating if the user has earned the achievement.
  final bool earned;

  /// The date and time the achievement was earned.
  final DateTime? earnedDate;

  /// The user's current progress toward the achievement (for unearned items).
  final int? progress;

  /// The total progress required to earn the achievement.
  final int? maxProgress;
}
