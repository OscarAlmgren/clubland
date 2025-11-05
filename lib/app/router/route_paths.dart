/// Route paths for the Clubland application
class RoutePaths {
  // Private constructor to prevent instantiation
  RoutePaths._();

  // Authentication routes
  /// Path for the user login screen.
  static const String login = '/login';

  /// Path for the user registration/signup screen.
  static const String register = '/register';

  /// Path for the forgotten password recovery screen.
  static const String forgotPassword = '/forgot-password';

  // Main app routes
  /// The root path for the main application home screen.
  static const String home = '/';

  /// Path for the list of clubs screen.
  static const String clubs = '/clubs';

  /// Path template for a specific club's detail screen.
  static const String clubDetail = '/clubs/:id';

  /// Path for the list of bookings screen.
  static const String bookings = '/bookings';

  /// Path template for a specific booking's detail screen.
  static const String bookingDetail = '/bookings/:id';

  /// Path for the list of events screen.
  static const String events = '/events';

  /// Path template for a specific event's detail screen.
  static const String eventDetail = '/events/:id';

  /// Path template for RSVP form for an event.
  static const String eventRSVP = '/events/:id/rsvp';

  /// Path for the list of user's RSVPs.
  static const String myRSVPs = '/my-rsvps';

  /// Path for the list of visits screen.
  static const String visits = '/visits';

  /// Path template for a specific visit's detail screen.
  static const String visitDetail = '/visits/:id';

  /// Path for the social feed or activity screen.
  static const String social = '/social';

  /// Path for the travel planning or exploration screen.
  static const String travel = '/travel';

  /// Path for the user profile screen.
  static const String profile = '/profile';

  /// Path for the application settings screen.
  static const String settings = '/settings';

  // Nested routes
  /// Path for the notifications settings screen (nested under profile).
  static const String notifications = '/profile/notifications';

  /// Path for the privacy settings screen (nested under profile).
  static const String privacy = '/profile/privacy';

  /// Path for the security settings screen (nested under profile).
  static const String security = '/profile/security';

  /// Path for the membership management screen (nested under profile).
  static const String membership = '/profile/membership';

  // Special routes
  /// Path displayed when the application is under maintenance.
  static const String maintenance = '/maintenance';

  /// Path for the initial user onboarding flow.
  static const String onboarding = '/onboarding';

  /// Path for the QR code scanning utility.
  static const String qrScanner = '/qr-scanner';

  /// Generates the absolute path for a specific club's detail screen.
  static String getClubDetailPath(String clubId) => '/clubs/$clubId';

  /// Generates the absolute path for a specific booking's detail screen.
  static String getBookingDetailPath(String bookingId) =>
      '/bookings/$bookingId';

  /// Generates the absolute path for a specific visit's detail screen.
  static String getVisitDetailPath(String visitId) => '/visits/$visitId';

  /// Generates the absolute path for a specific event's detail screen.
  static String getEventDetailPath(String eventId) => '/events/$eventId';

  /// Generates the absolute path for a specific event's RSVP form.
  static String getEventRSVPPath(String eventId) => '/events/$eventId/rsvp';
}
