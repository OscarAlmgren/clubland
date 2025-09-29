/// Route names and paths for the Clubland app.
///
/// This class provides a centralized source of truth for all application routes,
/// including their paths, parameter names, and utility functions for navigation.
class AppRoutes {
  AppRoutes._();

  // --- Authentication Routes ---
  /// The initial splash screen route path.
  static const String splash = '/';

  /// The user sign-in page route path.
  static const String login = '/login';

  /// The user registration page route path.
  static const String register = '/register';

  /// The forgotten password request page route path.
  static const String forgotPassword = '/forgot-password';

  /// The password reset confirmation page route path.
  static const String resetPassword = '/reset-password';

  /// The route path for passwordless/Hanko authentication methods.
  static const String hankoAuth = '/hanko-auth';

  // --- Main App Routes ---
  /// The main application entry point route path after authentication.
  static const String home = '/home';

  /// The main application dashboard route path.
  static const String dashboard = '/dashboard';

  // --- Club Routes ---
  /// The club listing/browse page route path.
  static const String clubs = '/clubs';

  /// The parameterized club details page route path.
  /// Use [clubDetailsRoute] to generate the concrete path.
  static const String clubDetails = '/clubs/:clubId';

  /// The club search results page route path.
  static const String clubSearch = '/clubs/search';

  /// The page showing clubs near the user's location route path.
  static const String nearbyClubs = '/clubs/nearby';

  /// The page listing the user's favorite clubs route path.
  static const String favoriteClubs = '/clubs/favorites';

  // --- Booking Routes ---
  /// The main booking overview page route path.
  static const String bookings = '/bookings';

  /// The parameterized booking details page route path.
  /// Use [bookingDetailsRoute] to generate the concrete path.
  static const String bookingDetails = '/bookings/:bookingId';

  /// The parameterized page for creating a new booking for a specific club.
  /// Use [createBookingRoute] to generate the concrete path.
  static const String createBooking = '/clubs/:clubId/book';

  /// The parameterized page for editing an existing booking.
  /// Use [editBookingRoute] to generate the concrete path.
  static const String editBooking = '/bookings/:bookingId/edit';

  /// The page listing the user's past and future booking history route path.
  static const String bookingHistory = '/bookings/history';

  // --- Profile Routes ---
  /// The user profile page route path.
  static const String profile = '/profile';

  /// The profile editing page route path.
  static const String editProfile = '/profile/edit';

  /// The main settings page route path.
  static const String settings = '/settings';

  /// The notification settings page route path.
  static const String notifications = '/settings/notifications';

  /// The privacy settings page route path.
  static const String privacy = '/settings/privacy';

  /// The security settings page route path.
  static const String security = '/settings/security';

  /// The support and FAQ page route path.
  static const String support = '/settings/support';

  /// The 'About the App' page route path.
  static const String about = '/settings/about';

  // --- Membership Routes ---
  /// The main membership status page route path.
  static const String membership = '/membership';

  /// The page showing different membership tiers route path.
  static const String membershipTiers = '/membership/tiers';

  /// The page for upgrading membership route path.
  static const String membershipUpgrade = '/membership/upgrade';

  /// The page detailing membership benefits route path.
  static const String membershipBenefits = '/membership/benefits';

  // --- Payment Routes ---
  /// The main payments hub route path.
  static const String payments = '/payments';

  /// The page to manage saved payment methods route path.
  static const String paymentMethods = '/payments/methods';

  /// The page to add a new payment method route path.
  static const String addPaymentMethod = '/payments/methods/add';

  /// The payment transaction history page route path.
  static const String paymentHistory = '/payments/history';

  /// The invoices list page route path.
  static const String invoices = '/payments/invoices';

  // --- Utility Routes ---
  /// The in-app QR code scanner route path.
  static const String qrScanner = '/qr-scanner';

  /// The map view route path (e.g., showing clubs on a map).
  static const String map = '/map';

  /// The in-app camera route path.
  static const String camera = '/camera';

  /// The route path for viewing full-screen images.
  static const String imageViewer = '/image-viewer';

  /// The route path for displaying internal web content (e.g., terms and conditions).
  static const String webView = '/web-view';

  // --- Error Routes ---
  /// The route path for when a requested page is not found.
  static const String notFound = '/404';

  /// A generic error display page route path.
  static const String error = '/error';

  /// A route path indicating the app is under maintenance.
  static const String maintenance = '/maintenance';

  // --- Deep Link Routes ---
  /// Deep link route for accepting a club invitation.
  static const String clubInvite = '/invite/club/:inviteCode';

  /// Deep link route for viewing an event invitation.
  static const String eventInvite = '/invite/event/:eventId';

  /// Deep link route for sharing a specific club.
  static const String shareClub = '/share/club/:clubId';

  /// Deep link route for sharing a specific booking.
  static const String shareBooking = '/share/booking/:bookingId';

  // --- Route Parameters ---
  /// The parameter key name for club identifiers.
  static const String clubIdParam = 'clubId';

  /// The parameter key name for booking identifiers.
  static const String bookingIdParam = 'bookingId';

  /// The parameter key name for club invitation codes.
  static const String inviteCodeParam = 'inviteCode';

  /// The parameter key name for event identifiers.
  static const String eventIdParam = 'eventId';

  // --- Route Query Parameters ---
  /// The query parameter key used for redirecting after a successful action (e.g., login).
  static const String redirectParam = 'redirect';

  /// The query parameter key used to pass a success or info message.
  static const String messageParam = 'message';

  /// The query parameter key used to pass an error description.
  static const String errorParam = 'error';

  /// The query parameter key used for passing temporary authentication tokens.
  static const String tokenParam = 'token';

  // --- Route Generators ---

  /// Generates the full, concrete path for the club details page.
  ///
  /// Replaces the `:clubIdParam` placeholder with the provided [clubId].
  static String clubDetailsRoute(String clubId) =>
      clubDetails.replaceAll(':$clubIdParam', clubId);

  /// Generates the full, concrete path for the booking details page.
  ///
  /// Replaces the `:bookingIdParam` placeholder with the provided [bookingId].
  static String bookingDetailsRoute(String bookingId) =>
      bookingDetails.replaceAll(':$bookingIdParam', bookingId);

  /// Generates the full, concrete path for the create booking page.
  ///
  /// Replaces the `:clubIdParam` placeholder with the provided [clubId].
  static String createBookingRoute(String clubId) =>
      createBooking.replaceAll(':$clubIdParam', clubId);

  /// Generates the full, concrete path for the edit booking page.
  ///
  /// Replaces the `:bookingIdParam` placeholder with the provided [bookingId].
  static String editBookingRoute(String bookingId) =>
      editBooking.replaceAll(':$bookingIdParam', bookingId);

  /// Generates the full, concrete path for the club invitation deep link.
  ///
  /// Replaces the `:inviteCodeParam` placeholder with the provided [inviteCode].
  static String clubInviteRoute(String inviteCode) =>
      clubInvite.replaceAll(':$inviteCodeParam', inviteCode);

  /// Generates the full, concrete path for the event invitation deep link.
  ///
  /// Replaces the `:eventIdParam` placeholder with the provided [eventId].
  static String eventInviteRoute(String eventId) =>
      eventInvite.replaceAll(':$eventIdParam', eventId);

  /// Generates the full, concrete path for the share club deep link.
  ///
  /// Replaces the `:clubIdParam` placeholder with the provided [clubId].
  static String shareClubRoute(String clubId) =>
      shareClub.replaceAll(':$clubIdParam', clubId);

  /// Generates the full, concrete path for the share booking deep link.
  ///
  /// Replaces the `:bookingIdParam` placeholder with the provided [bookingId].
  static String shareBookingRoute(String bookingId) =>
      shareBooking.replaceAll(':$bookingIdParam', bookingId);

  // --- Utility Methods ---

  /// Checks if the provided [route] requires an authenticated user.
  ///
  /// Returns `false` for authentication routes, error pages, and public share/invite links.
  static bool requiresAuth(String route) {
    const unauthenticatedRoutes = [
      splash,
      login,
      register,
      forgotPassword,
      resetPassword,
      hankoAuth,
      notFound,
      error,
      maintenance,
    ];

    return !unauthenticatedRoutes.contains(route) &&
        !route.startsWith('/invite/') &&
        !route.startsWith('/share/');
  }

  /// Checks if the provided [route] is one of the main navigation destinations
  /// (Home, Clubs, Bookings, Profile).
  static bool isMainNavRoute(String route) {
    const mainNavRoutes = [home, clubs, bookings, profile];

    return mainNavRoutes.contains(route);
  }

  /// Gets the main navigation index (0-based) corresponding to the provided [route].
  ///
  /// Returns `0` (Home) if the route is not a main navigation route.
  static int getMainNavIndex(String route) {
    switch (route) {
      case home:
        return 0;
      case clubs:
        return 1;
      case bookings:
        return 2;
      case profile:
        return 3;
      default:
        return 0;
    }
  }

  /// Retrieves the display title for the app bar based on the provided [route].
  ///
  /// Defaults to 'Clubland' if no specific title is found.
  static String getRouteTitle(String route) {
    switch (route) {
      case splash:
        return 'Clubland';
      case login:
        return 'Sign In';
      case register:
        return 'Sign Up';
      case forgotPassword:
        return 'Forgot Password';
      case resetPassword:
        return 'Reset Password';
      case hankoAuth:
        return 'Authentication';
      case home:
        return 'Home';
      case dashboard:
        return 'Dashboard';
      case clubs:
        return 'Clubs';
      case clubSearch:
        return 'Search Clubs';
      case nearbyClubs:
        return 'Nearby Clubs';
      case favoriteClubs:
        return 'Favorite Clubs';
      case bookings:
        return 'Bookings';
      case bookingHistory:
        return 'Booking History';
      case profile:
        return 'Profile';
      case editProfile:
        return 'Edit Profile';
      case settings:
        return 'Settings';
      case notifications:
        return 'Notifications';
      case privacy:
        return 'Privacy';
      case security:
        return 'Security';
      case support:
        return 'Support';
      case about:
        return 'About';
      case membership:
        return 'Membership';
      case membershipTiers:
        return 'Membership Tiers';
      case membershipUpgrade:
        return 'Upgrade Membership';
      case membershipBenefits:
        return 'Membership Benefits';
      case payments:
        return 'Payments';
      case paymentMethods:
        return 'Payment Methods';
      case addPaymentMethod:
        return 'Add Payment Method';
      case paymentHistory:
        return 'Payment History';
      case invoices:
        return 'Invoices';
      case qrScanner:
        return 'QR Scanner';
      case map:
        return 'Map';
      case camera:
        return 'Camera';
      case imageViewer:
        return 'Image Viewer';
      case webView:
        return 'Web View';
      case notFound:
        return 'Page Not Found';
      case error:
        return 'Error';
      case maintenance:
        return 'Maintenance';
      default:
        return 'Clubland';
    }
  }
}
