import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/presentation/controllers/auth_controller.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/bookings/presentation/pages/bookings_page.dart';
import '../../features/clubs/presentation/pages/clubs_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/profile/presentation/pages/profile_settings_page.dart';
import '../../shared/widgets/main_scaffold.dart';
import 'route_paths.dart';

part 'app_router.g.dart';

/// App router provider that handles navigation and auth guards
@riverpod
GoRouter appRouter(AppRouterRef ref) {
  ref.watch(authControllerProvider.notifier);

  return GoRouter(
    initialLocation: RoutePaths.login,
    redirect: (BuildContext context, GoRouterState state) {
      final authState = ref.read(authControllerProvider);
      final isAuthenticated = authState.value != null;
      final isLoginRoute =
          state.matchedLocation == RoutePaths.login ||
          state.matchedLocation == RoutePaths.register;

      // If user is not authenticated and trying to access protected routes
      if (!isAuthenticated && !isLoginRoute) {
        return RoutePaths.login;
      }

      // If user is authenticated and trying to access login/register
      if (isAuthenticated && isLoginRoute) {
        return RoutePaths.home;
      }

      // No redirect needed
      return null;
    },
    routes: [
      // Authentication routes
      GoRoute(
        path: RoutePaths.login,
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: RoutePaths.register,
        name: 'register',
        builder: (context, state) => const RegisterPage(),
      ),

      // Main app routes with bottom navigation
      ShellRoute(
        builder: (context, state, child) {
          return MainScaffold(child: child);
        },
        routes: [
          GoRoute(
            path: RoutePaths.home,
            name: 'home',
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: RoutePaths.clubs,
            name: 'clubs',
            builder: (context, state) => const ClubsPage(),
          ),
          GoRoute(
            path: RoutePaths.bookings,
            name: 'bookings',
            builder: (context, state) => const BookingsPage(),
          ),
          GoRoute(
            path: RoutePaths.profile,
            name: 'profile',
            builder: (context, state) => const ProfilePage(),
          ),
        ],
      ),

      // Settings route (outside main navigation)
      GoRoute(
        path: RoutePaths.settings,
        name: 'settings',
        builder: (context, state) => const ProfileSettingsPage(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Page not found: ${state.matchedLocation}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go(RoutePaths.home),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    ),
  );
}
