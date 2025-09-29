import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/core_providers.dart';
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
GoRouter appRouter(Ref ref) {
  final navigatorKey = ref.watch(navigatorKeyProvider);

  return GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: RoutePaths.login,
    redirect: (BuildContext context, GoRouterState state) {
      // Always allow access to login and register pages
      final isLoginRoute =
          state.matchedLocation == RoutePaths.login ||
          state.matchedLocation == RoutePaths.register;

      if (isLoginRoute) {
        return null;
      }

      try {
        final authState = ref.read(authControllerProvider);

        // Handle loading state - stay on current route
        if (authState.isLoading) {
          return null;
        }

        // Handle error state - redirect to login
        if (authState.hasError) {
          return RoutePaths.login;
        }

        final isAuthenticated = authState.value != null;

        // If user is not authenticated and trying to access protected routes
        if (!isAuthenticated) {
          return RoutePaths.login;
        }

        // No redirect needed
        return null;
      } on StateError catch (_) {
        // If auth controller provider is not initialized, default to login
        return RoutePaths.login;
      } on Object catch (e) {
        // Catch any other errors and log them
        ErrorHandler.logError('Router redirect error', error: e);
        return RoutePaths.login;
      }
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
        builder: (context, state, child) => MainScaffold(child: child),
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
