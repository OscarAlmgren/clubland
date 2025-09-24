import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/presentation/controllers/auth_controller.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/auth/presentation/pages/splash_page.dart';
import '../../features/bookings/presentation/pages/bookings_page.dart';
import '../../features/clubs/presentation/pages/clubs_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../design_system/widgets/error_page.dart';
import 'app_routes.dart';
import 'route_guards.dart';

part 'app_router.g.dart';

/// Global navigator key for the app
final navigatorKey = GlobalKey<NavigatorState>();

/// App router configuration using GoRouter
@riverpod
GoRouter appRouter(AppRouterRef ref) {
  ref.watch(authControllerProvider.notifier);
  final authState = ref.watch(authControllerProvider);

  return GoRouter(
    navigatorKey: navigatorKey,
    debugLogDiagnostics: true,
    initialLocation: AppRoutes.splash,
    redirect: (context, state) => RouteGuards.redirect(
      context: context,
      state: state,
      authState: authState,
    ),
    errorBuilder: (context, state) => ErrorPage(
      error: state.error?.toString() ?? 'Unknown error',
      stackTrace: state.error is Exception ? StackTrace.current : null,
    ),
    routes: [
      // Splash Route
      GoRoute(
        path: AppRoutes.splash,
        name: 'splash',
        builder: (context, state) => const SplashPage(),
      ),

      // Authentication Routes
      GoRoute(
        path: AppRoutes.login,
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.register,
        name: 'register',
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: AppRoutes.forgotPassword,
        name: 'forgotPassword',
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        path: AppRoutes.resetPassword,
        name: 'resetPassword',
        builder: (context, state) =>
            ResetPasswordPage(token: state.uri.queryParameters['token']),
      ),
      GoRoute(
        path: AppRoutes.hankoAuth,
        name: 'hankoAuth',
        builder: (context, state) => HankoAuthPage(
          email: state.uri.queryParameters['email'],
          sessionId: state.uri.queryParameters['sessionId'],
        ),
      ),

      // Main App Routes with Shell Navigation
      ShellRoute(
        builder: (context, state, child) => MainShell(child: child),
        routes: [
          // Home
          GoRoute(
            path: AppRoutes.home,
            name: 'home',
            builder: (context, state) => const HomePage(),
          ),

          // Clubs
          GoRoute(
            path: AppRoutes.clubs,
            name: 'clubs',
            builder: (context, state) => const ClubsPage(),
            routes: [
              GoRoute(
                path: ':${AppRoutes.clubIdParam}',
                name: 'clubDetails',
                builder: (context, state) => ClubDetailsPage(
                  clubId: state.pathParameters[AppRoutes.clubIdParam]!,
                ),
                routes: [
                  GoRoute(
                    path: 'book',
                    name: 'createBooking',
                    builder: (context, state) => CreateBookingPage(
                      clubId: state.pathParameters[AppRoutes.clubIdParam]!,
                    ),
                  ),
                ],
              ),
              GoRoute(
                path: 'search',
                name: 'clubSearch',
                builder: (context, state) =>
                    ClubSearchPage(query: state.uri.queryParameters['q']),
              ),
              GoRoute(
                path: 'nearby',
                name: 'nearbyClubs',
                builder: (context, state) => const NearbyClubsPage(),
              ),
              GoRoute(
                path: 'favorites',
                name: 'favoriteClubs',
                builder: (context, state) => const FavoriteClubsPage(),
              ),
            ],
          ),

          // Bookings
          GoRoute(
            path: AppRoutes.bookings,
            name: 'bookings',
            builder: (context, state) => const BookingsPage(),
            routes: [
              GoRoute(
                path: ':${AppRoutes.bookingIdParam}',
                name: 'bookingDetails',
                builder: (context, state) => BookingDetailsPage(
                  bookingId: state.pathParameters[AppRoutes.bookingIdParam]!,
                ),
                routes: [
                  GoRoute(
                    path: 'edit',
                    name: 'editBooking',
                    builder: (context, state) => EditBookingPage(
                      bookingId:
                          state.pathParameters[AppRoutes.bookingIdParam]!,
                    ),
                  ),
                ],
              ),
              GoRoute(
                path: 'history',
                name: 'bookingHistory',
                builder: (context, state) => const BookingHistoryPage(),
              ),
            ],
          ),

          // Profile
          GoRoute(
            path: AppRoutes.profile,
            name: 'profile',
            builder: (context, state) => const ProfilePage(),
            routes: [
              GoRoute(
                path: 'edit',
                name: 'editProfile',
                builder: (context, state) => const EditProfilePage(),
              ),
            ],
          ),
        ],
      ),

      // Settings Routes (Full Screen)
      GoRoute(
        path: AppRoutes.settings,
        name: 'settings',
        builder: (context, state) => const SettingsPage(),
        routes: [
          GoRoute(
            path: 'notifications',
            name: 'notifications',
            builder: (context, state) => const NotificationSettingsPage(),
          ),
          GoRoute(
            path: 'privacy',
            name: 'privacy',
            builder: (context, state) => const PrivacySettingsPage(),
          ),
          GoRoute(
            path: 'security',
            name: 'security',
            builder: (context, state) => const SecuritySettingsPage(),
          ),
          GoRoute(
            path: 'support',
            name: 'support',
            builder: (context, state) => const SupportPage(),
          ),
          GoRoute(
            path: 'about',
            name: 'about',
            builder: (context, state) => const AboutPage(),
          ),
        ],
      ),

      // Membership Routes
      GoRoute(
        path: AppRoutes.membership,
        name: 'membership',
        builder: (context, state) => const MembershipPage(),
        routes: [
          GoRoute(
            path: 'tiers',
            name: 'membershipTiers',
            builder: (context, state) => const MembershipTiersPage(),
          ),
          GoRoute(
            path: 'upgrade',
            name: 'membershipUpgrade',
            builder: (context, state) => const MembershipUpgradePage(),
          ),
          GoRoute(
            path: 'benefits',
            name: 'membershipBenefits',
            builder: (context, state) => const MembershipBenefitsPage(),
          ),
        ],
      ),

      // Payment Routes
      GoRoute(
        path: AppRoutes.payments,
        name: 'payments',
        builder: (context, state) => const PaymentsPage(),
        routes: [
          GoRoute(
            path: 'methods',
            name: 'paymentMethods',
            builder: (context, state) => const PaymentMethodsPage(),
            routes: [
              GoRoute(
                path: 'add',
                name: 'addPaymentMethod',
                builder: (context, state) => const AddPaymentMethodPage(),
              ),
            ],
          ),
          GoRoute(
            path: 'history',
            name: 'paymentHistory',
            builder: (context, state) => const PaymentHistoryPage(),
          ),
          GoRoute(
            path: 'invoices',
            name: 'invoices',
            builder: (context, state) => const InvoicesPage(),
          ),
        ],
      ),

      // Utility Routes
      GoRoute(
        path: AppRoutes.qrScanner,
        name: 'qrScanner',
        builder: (context, state) => const QRScannerPage(),
      ),
      GoRoute(
        path: AppRoutes.map,
        name: 'map',
        builder: (context, state) => const MapPage(),
      ),
      GoRoute(
        path: AppRoutes.camera,
        name: 'camera',
        builder: (context, state) => const CameraPage(),
      ),
      GoRoute(
        path: AppRoutes.imageViewer,
        name: 'imageViewer',
        builder: (context, state) => ImageViewerPage(
          imageUrl: state.uri.queryParameters['url'] ?? '',
          heroTag: state.uri.queryParameters['hero'],
        ),
      ),
      GoRoute(
        path: AppRoutes.webView,
        name: 'webView',
        builder: (context, state) => WebViewPage(
          url: state.uri.queryParameters['url'] ?? '',
          title: state.uri.queryParameters['title'],
        ),
      ),

      // Deep Link Routes
      GoRoute(
        path: AppRoutes.clubInvite,
        name: 'clubInvite',
        builder: (context, state) => ClubInvitePage(
          inviteCode: state.pathParameters[AppRoutes.inviteCodeParam]!,
        ),
      ),
      GoRoute(
        path: AppRoutes.eventInvite,
        name: 'eventInvite',
        builder: (context, state) => EventInvitePage(
          eventId: state.pathParameters[AppRoutes.eventIdParam]!,
        ),
      ),
      GoRoute(
        path: AppRoutes.shareClub,
        name: 'shareClub',
        builder: (context, state) =>
            ShareClubPage(clubId: state.pathParameters[AppRoutes.clubIdParam]!),
      ),
      GoRoute(
        path: AppRoutes.shareBooking,
        name: 'shareBooking',
        builder: (context, state) => ShareBookingPage(
          bookingId: state.pathParameters[AppRoutes.bookingIdParam]!,
        ),
      ),

      // Error Routes
      GoRoute(
        path: AppRoutes.notFound,
        name: 'notFound',
        builder: (context, state) => const NotFoundPage(),
      ),
      GoRoute(
        path: AppRoutes.error,
        name: 'error',
        builder: (context, state) => ErrorPage(
          error:
              state.uri.queryParameters[AppRoutes.errorParam] ??
              'Unknown error',
        ),
      ),
      GoRoute(
        path: AppRoutes.maintenance,
        name: 'maintenance',
        builder: (context, state) => MaintenancePage(
          message: state.uri.queryParameters[AppRoutes.messageParam],
        ),
      ),
    ],
  );
}

/// Extension methods for GoRouter
extension AppRouterExtension on GoRouter {
  /// Navigate to a route and clear the stack
  void goAndClearStack(String path) {
    while (canPop()) {
      pop();
    }
    go(path);
  }

  /// Navigate to home and clear the stack
  void goHome() {
    goAndClearStack(AppRoutes.home);
  }

  /// Navigate to login and clear the stack
  void goToLogin() {
    goAndClearStack(AppRoutes.login);
  }

  /// Navigate back or to a fallback route
  void goBackOrTo(String fallbackPath) {
    if (canPop()) {
      pop();
    } else {
      go(fallbackPath);
    }
  }
}

// Placeholder pages - these would be implemented in their respective feature modules
class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Forgot Password')));
}

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key, this.token});
  final String? token;
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Reset Password')));
}

class HankoAuthPage extends StatelessWidget {
  const HankoAuthPage({super.key, this.email, this.sessionId});
  final String? email;
  final String? sessionId;
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Hanko Auth')));
}

class MainShell extends StatelessWidget {
  const MainShell({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) => Scaffold(body: child);
}

class ClubDetailsPage extends StatelessWidget {
  const ClubDetailsPage({super.key, required this.clubId});
  final String clubId;
  @override
  Widget build(BuildContext context) =>
      Scaffold(body: Center(child: Text('Club Details: $clubId')));
}

class CreateBookingPage extends StatelessWidget {
  const CreateBookingPage({super.key, required this.clubId});
  final String clubId;
  @override
  Widget build(BuildContext context) =>
      Scaffold(body: Center(child: Text('Create Booking for: $clubId')));
}

class ClubSearchPage extends StatelessWidget {
  const ClubSearchPage({super.key, this.query});
  final String? query;
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Club Search')));
}

class NearbyClubsPage extends StatelessWidget {
  const NearbyClubsPage({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Nearby Clubs')));
}

class FavoriteClubsPage extends StatelessWidget {
  const FavoriteClubsPage({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Favorite Clubs')));
}

class BookingDetailsPage extends StatelessWidget {
  const BookingDetailsPage({super.key, required this.bookingId});
  final String bookingId;
  @override
  Widget build(BuildContext context) =>
      Scaffold(body: Center(child: Text('Booking Details: $bookingId')));
}

class EditBookingPage extends StatelessWidget {
  const EditBookingPage({super.key, required this.bookingId});
  final String bookingId;
  @override
  Widget build(BuildContext context) =>
      Scaffold(body: Center(child: Text('Edit Booking: $bookingId')));
}

class BookingHistoryPage extends StatelessWidget {
  const BookingHistoryPage({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Booking History')));
}

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Edit Profile')));
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Settings')));
}

class NotificationSettingsPage extends StatelessWidget {
  const NotificationSettingsPage({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Notification Settings')));
}

class PrivacySettingsPage extends StatelessWidget {
  const PrivacySettingsPage({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Privacy Settings')));
}

class SecuritySettingsPage extends StatelessWidget {
  const SecuritySettingsPage({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Security Settings')));
}

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Support')));
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('About')));
}

class MembershipPage extends StatelessWidget {
  const MembershipPage({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Membership')));
}

class MembershipTiersPage extends StatelessWidget {
  const MembershipTiersPage({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Membership Tiers')));
}

class MembershipUpgradePage extends StatelessWidget {
  const MembershipUpgradePage({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Membership Upgrade')));
}

class MembershipBenefitsPage extends StatelessWidget {
  const MembershipBenefitsPage({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Membership Benefits')));
}

class PaymentsPage extends StatelessWidget {
  const PaymentsPage({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Payments')));
}

class PaymentMethodsPage extends StatelessWidget {
  const PaymentMethodsPage({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Payment Methods')));
}

class AddPaymentMethodPage extends StatelessWidget {
  const AddPaymentMethodPage({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Add Payment Method')));
}

class PaymentHistoryPage extends StatelessWidget {
  const PaymentHistoryPage({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Payment History')));
}

class InvoicesPage extends StatelessWidget {
  const InvoicesPage({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Invoices')));
}

class QRScannerPage extends StatelessWidget {
  const QRScannerPage({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('QR Scanner')));
}

class MapPage extends StatelessWidget {
  const MapPage({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Map')));
}

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Camera')));
}

class ImageViewerPage extends StatelessWidget {
  const ImageViewerPage({super.key, required this.imageUrl, this.heroTag});
  final String imageUrl;
  final String? heroTag;
  @override
  Widget build(BuildContext context) =>
      Scaffold(body: Center(child: Text('Image Viewer: $imageUrl')));
}

class WebViewPage extends StatelessWidget {
  const WebViewPage({super.key, required this.url, this.title});
  final String url;
  final String? title;
  @override
  Widget build(BuildContext context) =>
      Scaffold(body: Center(child: Text('Web View: $url')));
}

class ClubInvitePage extends StatelessWidget {
  const ClubInvitePage({super.key, required this.inviteCode});
  final String inviteCode;
  @override
  Widget build(BuildContext context) =>
      Scaffold(body: Center(child: Text('Club Invite: $inviteCode')));
}

class EventInvitePage extends StatelessWidget {
  const EventInvitePage({super.key, required this.eventId});
  final String eventId;
  @override
  Widget build(BuildContext context) =>
      Scaffold(body: Center(child: Text('Event Invite: $eventId')));
}

class ShareClubPage extends StatelessWidget {
  const ShareClubPage({super.key, required this.clubId});
  final String clubId;
  @override
  Widget build(BuildContext context) =>
      Scaffold(body: Center(child: Text('Share Club: $clubId')));
}

class ShareBookingPage extends StatelessWidget {
  const ShareBookingPage({super.key, required this.bookingId});
  final String bookingId;
  @override
  Widget build(BuildContext context) =>
      Scaffold(body: Center(child: Text('Share Booking: $bookingId')));
}

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('404 - Page Not Found')));
}

class MaintenancePage extends StatelessWidget {
  const MaintenancePage({super.key, this.message});
  final String? message;
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(child: Text('Maintenance: ${message ?? 'Under maintenance'}')),
  );
}
