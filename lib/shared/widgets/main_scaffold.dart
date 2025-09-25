import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router/route_paths.dart';
import '../../core/design_system/design_system.dart';

/// Main scaffold with bottom navigation for authenticated users
class MainScaffold extends StatelessWidget {
  /// The child widget to display
  final Widget child;

  /// Constructs a [MainScaffold]
  const MainScaffold({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final currentLocation = GoRouterState.of(context).matchedLocation;

    return NavigationBar(
      selectedIndex: _getSelectedIndex(currentLocation),
      onDestinationSelected: (index) => _onDestinationSelected(context, index),
      backgroundColor: colorScheme.surface,
      indicatorColor: colorScheme.primary.withOpacity(0.1),
      destinations: [
        NavigationDestination(
          icon: Icon(
            Icons.home_outlined,
            color: _getIconColor(context, currentLocation == RoutePaths.home),
          ),
          selectedIcon: Icon(
            Icons.home,
            color: colorScheme.primary,
          ),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(
            Icons.location_city_outlined,
            color: _getIconColor(context, currentLocation == RoutePaths.clubs),
          ),
          selectedIcon: Icon(
            Icons.location_city,
            color: colorScheme.primary,
          ),
          label: 'Clubs',
        ),
        NavigationDestination(
          icon: Icon(
            Icons.calendar_month_outlined,
            color: _getIconColor(context, currentLocation == RoutePaths.bookings),
          ),
          selectedIcon: Icon(
            Icons.calendar_month,
            color: colorScheme.primary,
          ),
          label: 'Bookings',
        ),
        NavigationDestination(
          icon: Icon(
            Icons.person_outlined,
            color: _getIconColor(context, currentLocation == RoutePaths.profile),
          ),
          selectedIcon: Icon(
            Icons.person,
            color: colorScheme.primary,
          ),
          label: 'Profile',
        ),
      ],
    );
  }

  int _getSelectedIndex(String location) {
    switch (location) {
      case RoutePaths.home:
        return 0;
      case RoutePaths.clubs:
        return 1;
      case RoutePaths.bookings:
        return 2;
      case RoutePaths.profile:
        return 3;
      default:
        return 0;
    }
  }

  void _onDestinationSelected(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go(RoutePaths.home);
        break;
      case 1:
        context.go(RoutePaths.clubs);
        break;
      case 2:
        context.go(RoutePaths.bookings);
        break;
      case 3:
        context.go(RoutePaths.profile);
        break;
    }
  }

  Color _getIconColor(BuildContext context, bool isSelected) {
    final colorScheme = Theme.of(context).colorScheme;
    return isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant;
  }
}