import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/core_providers.dart';
import '../../features/auth/presentation/controllers/auth_controller.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/bookings/presentation/pages/bookings_page.dart';
import '../../features/clubs/presentation/pages/clubs_page.dart';
import '../../features/events/presentation/pages/event_details_page.dart';
import '../../features/events/presentation/pages/events_list_page.dart';
import '../../features/events/presentation/pages/my_rsvps_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/profile/presentation/pages/profile_settings_page.dart';
import '../../shared/widgets/main_scaffold.dart';
import 'route_paths.dart';

part 'app_router.g.dart';

/// Router refresh notifier for auth state changes
class _RouterRefreshNotifier extends ChangeNotifier {
  _RouterRefreshNotifier(this._ref) {
    // Listen to auth changes and notify router
    _ref.listen(authControllerProvider, (_, __) => notifyListeners());
  }

  final Ref _ref;
}

/// App router provider that handles navigation and auth guards
@riverpod
GoRouter appRouter(Ref ref) {
  final navigatorKey = ref.watch(navigatorKeyProvider);
  final refreshNotifier = _RouterRefreshNotifier(ref);

  return GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: RoutePaths.login,
    refreshListenable: refreshNotifier,
    redirect: (BuildContext context, GoRouterState state) {
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
        final isLoginRoute =
            state.matchedLocation == RoutePaths.login ||
            state.matchedLocation == RoutePaths.register;

        // If authenticated and on login/register, redirect to home
        if (isAuthenticated && isLoginRoute) {
          return RoutePaths.home;
        }

        // If not authenticated and trying to access protected routes
        if (!isAuthenticated && !isLoginRoute) {
          return RoutePaths.login;
        }

        // No redirect needed
        return null;
      } on StateError catch (_) {
        // If auth controller provider is not initialized, default to login
        return RoutePaths.login;
      } on Object catch (e) {
        // Catch any other errors and log them
        debugPrint('Router redirect error: $e');
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

      // Events routes (outside main navigation)
      GoRoute(
        path: '/events/:clubId',
        name: 'events',
        builder: (context, state) {
          final clubId = state.pathParameters['clubId']!;
          return EventsListPage(clubId: clubId);
        },
      ),
      GoRoute(
        path: '/events/:clubId/event/:eventId',
        name: 'eventDetail',
        builder: (context, state) {
          final eventId = state.pathParameters['eventId']!;
          // TODO: Get memberId from auth state
          const memberId = 'member123'; // Placeholder
          return EventDetailsPage(eventId: eventId, memberId: memberId);
        },
      ),
      GoRoute(
        path: '/events/:clubId/event/:eventId/rsvp',
        name: 'eventRSVP',
        builder: (context, state) {
          // Note: This route expects event and eligibility to be passed via extra
          // In a real app, you'd fetch these or pass them through state
          throw UnimplementedError(
            'RSVP form requires event and eligibility data. '
            'Use Navigator.push with MaterialPageRoute instead.',
          );
        },
      ),
      GoRoute(
        path: '/my-rsvps/:clubId',
        name: 'myRSVPs',
        builder: (context, state) {
          final clubId = state.pathParameters['clubId']!;
          return MyRSVPsPage(clubId: clubId);
        },
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
