import 'package:equatable/equatable.dart';

/// Lunch menu item entity
class LunchMenuItem extends Equatable {
  const LunchMenuItem({
    required this.name,
    required this.description,
    required this.price,
  });

  final String name;
  final String description;
  final double price;

  @override
  List<Object?> get props => [name, description, price];
}

/// Lunch menu entity - represents weekly lunch menu from restaurant
class LunchMenuEntity extends Equatable {
  const LunchMenuEntity({
    required this.id,
    required this.clubId,
    required this.weekStartDate,
    required this.weekEndDate,
    required this.menuItems,
    this.specialNotes,
  });

  final String id;
  final String clubId;
  final DateTime weekStartDate;
  final DateTime weekEndDate;
  final List<LunchMenuItem> menuItems;
  final String? specialNotes;

  /// Get formatted week range (e.g., "Dec 9-15, 2024")
  String get weekRange {
    final startMonth = _monthName(weekStartDate.month);
    final endMonth = _monthName(weekEndDate.month);

    if (weekStartDate.month == weekEndDate.month) {
      return '$startMonth ${weekStartDate.day}-${weekEndDate.day}, ${weekEndDate.year}';
    } else {
      return '$startMonth ${weekStartDate.day} - $endMonth ${weekEndDate.day}, ${weekEndDate.year}';
    }
  }

  String _monthName(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }

  @override
  List<Object?> get props => [
        id,
        clubId,
        weekStartDate,
        weekEndDate,
        menuItems,
        specialNotes,
      ];
}
