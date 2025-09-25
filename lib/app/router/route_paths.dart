/// Route paths for the Clubland application
class RoutePaths {
  // Private constructor to prevent instantiation
  RoutePaths._();

  // Authentication routes
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';

  // Main app routes
  static const String home = '/';
  static const String clubs = '/clubs';
  static const String clubDetail = '/clubs/:id';
  static const String bookings = '/bookings';
  static const String bookingDetail = '/bookings/:id';
  static const String visits = '/visits';
  static const String visitDetail = '/visits/:id';
  static const String social = '/social';
  static const String travel = '/travel';
  static const String profile = '/profile';
  static const String settings = '/settings';

  // Nested routes
  static const String notifications = '/profile/notifications';
  static const String privacy = '/profile/privacy';
  static const String security = '/profile/security';
  static const String membership = '/profile/membership';

  // Special routes
  static const String maintenance = '/maintenance';
  static const String onboarding = '/onboarding';
  static const String qrScanner = '/qr-scanner';

  /// Get club detail path with ID
  static String getClubDetailPath(String clubId) => '/clubs/$clubId';

  /// Get booking detail path with ID
  static String getBookingDetailPath(String bookingId) => '/bookings/$bookingId';

  /// Get visit detail path with ID
  static String getVisitDetailPath(String visitId) => '/visits/$visitId';
}