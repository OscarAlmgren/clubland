/// Route names and paths for the Clubland app
class AppRoutes {
  AppRoutes._();

  // Authentication Routes
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String resetPassword = '/reset-password';
  static const String hankoAuth = '/hanko-auth';

  // Main App Routes
  static const String home = '/home';
  static const String dashboard = '/dashboard';

  // Club Routes
  static const String clubs = '/clubs';
  static const String clubDetails = '/clubs/:clubId';
  static const String clubSearch = '/clubs/search';
  static const String nearbyClubs = '/clubs/nearby';
  static const String favoriteClubs = '/clubs/favorites';

  // Booking Routes
  static const String bookings = '/bookings';
  static const String bookingDetails = '/bookings/:bookingId';
  static const String createBooking = '/clubs/:clubId/book';
  static const String editBooking = '/bookings/:bookingId/edit';
  static const String bookingHistory = '/bookings/history';

  // Profile Routes
  static const String profile = '/profile';
  static const String editProfile = '/profile/edit';
  static const String settings = '/settings';
  static const String notifications = '/settings/notifications';
  static const String privacy = '/settings/privacy';
  static const String security = '/settings/security';
  static const String support = '/settings/support';
  static const String about = '/settings/about';

  // Membership Routes
  static const String membership = '/membership';
  static const String membershipTiers = '/membership/tiers';
  static const String membershipUpgrade = '/membership/upgrade';
  static const String membershipBenefits = '/membership/benefits';

  // Payment Routes
  static const String payments = '/payments';
  static const String paymentMethods = '/payments/methods';
  static const String addPaymentMethod = '/payments/methods/add';
  static const String paymentHistory = '/payments/history';
  static const String invoices = '/payments/invoices';

  // Utility Routes
  static const String qrScanner = '/qr-scanner';
  static const String map = '/map';
  static const String camera = '/camera';
  static const String imageViewer = '/image-viewer';
  static const String webView = '/web-view';

  // Error Routes
  static const String notFound = '/404';
  static const String error = '/error';
  static const String maintenance = '/maintenance';

  // Deep Link Routes
  static const String clubInvite = '/invite/club/:inviteCode';
  static const String eventInvite = '/invite/event/:eventId';
  static const String shareClub = '/share/club/:clubId';
  static const String shareBooking = '/share/booking/:bookingId';

  // Route Parameters
  static const String clubIdParam = 'clubId';
  static const String bookingIdParam = 'bookingId';
  static const String inviteCodeParam = 'inviteCode';
  static const String eventIdParam = 'eventId';

  // Route Query Parameters
  static const String redirectParam = 'redirect';
  static const String messageParam = 'message';
  static const String errorParam = 'error';
  static const String tokenParam = 'token';

  /// Generate club details route
  static String clubDetailsRoute(String clubId) =>
      clubDetails.replaceAll(':$clubIdParam', clubId);

  /// Generate booking details route
  static String bookingDetailsRoute(String bookingId) =>
      bookingDetails.replaceAll(':$bookingIdParam', bookingId);

  /// Generate create booking route
  static String createBookingRoute(String clubId) =>
      createBooking.replaceAll(':$clubIdParam', clubId);

  /// Generate edit booking route
  static String editBookingRoute(String bookingId) =>
      editBooking.replaceAll(':$bookingIdParam', bookingId);

  /// Generate club invite route
  static String clubInviteRoute(String inviteCode) =>
      clubInvite.replaceAll(':$inviteCodeParam', inviteCode);

  /// Generate event invite route
  static String eventInviteRoute(String eventId) =>
      eventInvite.replaceAll(':$eventIdParam', eventId);

  /// Generate share club route
  static String shareClubRoute(String clubId) =>
      shareClub.replaceAll(':$clubIdParam', clubId);

  /// Generate share booking route
  static String shareBookingRoute(String bookingId) =>
      shareBooking.replaceAll(':$bookingIdParam', bookingId);

  /// Check if route requires authentication
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

  /// Check if route is part of main navigation
  static bool isMainNavRoute(String route) {
    const mainNavRoutes = [home, clubs, bookings, profile];

    return mainNavRoutes.contains(route);
  }

  /// Get main navigation index for route
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

  /// Get route title for app bar
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
