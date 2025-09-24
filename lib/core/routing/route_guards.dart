import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/domain/entities/user_entity.dart';
import 'app_routes.dart';

/// Route guards for handling authentication and authorization
class RouteGuards {
  RouteGuards._();

  /// Main redirect logic for route protection
  static String? redirect({
    required BuildContext context,
    required GoRouterState state,
    required AsyncValue<UserEntity?> authState,
  }) {
    final path = state.uri.path;
    final isAuthRoute = _isAuthenticationRoute(path);
    final requiresAuth = AppRoutes.requiresAuth(path);

    return authState.when(
      data: (user) => _handleAuthenticatedState(
        user: user,
        path: path,
        isAuthRoute: isAuthRoute,
        requiresAuth: requiresAuth,
        state: state,
      ),
      loading: () => _handleLoadingState(path, isAuthRoute),
      error: (error, stackTrace) =>
          _handleErrorState(error: error, path: path, isAuthRoute: isAuthRoute),
    );
  }

  /// Handle redirect when user authentication state is loaded
  static String? _handleAuthenticatedState({
    required UserEntity? user,
    required String path,
    required bool isAuthRoute,
    required bool requiresAuth,
    required GoRouterState state,
  }) {
    final isAuthenticated = user != null;

    // If user is not authenticated and route requires auth
    if (!isAuthenticated && requiresAuth) {
      return _buildLoginRedirect(path);
    }

    // If user is authenticated but on auth route
    if (isAuthenticated && isAuthRoute) {
      return _getRedirectAfterLogin(state) ?? AppRoutes.home;
    }

    // Check user permissions for specific routes
    if (isAuthenticated && requiresAuth) {
      final permissionCheck = _checkUserPermissions(user, path);
      if (permissionCheck != null) {
        return permissionCheck;
      }
    }

    // Check if user needs to complete profile
    if (isAuthenticated && _needsProfileCompletion(user)) {
      return AppRoutes.editProfile;
    }

    // No redirect needed
    return null;
  }

  /// Handle redirect when authentication state is loading
  static String? _handleLoadingState(String path, bool isAuthRoute) {
    // Show splash screen while loading, unless already on splash
    if (path != AppRoutes.splash) {
      return AppRoutes.splash;
    }
    return null;
  }

  /// Handle redirect when there's an authentication error
  static String? _handleErrorState({
    required Object error,
    required String path,
    required bool isAuthRoute,
  }) {
    // If not on auth route and there's an error, redirect to login
    if (!isAuthRoute) {
      return AppRoutes.login;
    }
    return null;
  }

  /// Check if the route is an authentication route
  static bool _isAuthenticationRoute(String path) {
    const authRoutes = [
      AppRoutes.splash,
      AppRoutes.login,
      AppRoutes.register,
      AppRoutes.forgotPassword,
      AppRoutes.resetPassword,
      AppRoutes.hankoAuth,
    ];

    return authRoutes.contains(path);
  }

  /// Build login redirect URL with return path
  static String _buildLoginRedirect(String originalPath) {
    final uri = Uri.parse(AppRoutes.login);
    final queryParams = <String, String>{AppRoutes.redirectParam: originalPath};

    return uri.replace(queryParameters: queryParams).toString();
  }

  /// Get redirect path after successful login
  static String? _getRedirectAfterLogin(GoRouterState state) =>
      state.uri.queryParameters[AppRoutes.redirectParam];

  /// Check user permissions for specific routes
  static String? _checkUserPermissions(UserEntity user, String path) {
    // Admin routes
    if (_isAdminRoute(path) && !user.hasRole('admin')) {
      return AppRoutes.home;
    }

    // Premium features
    if (_isPremiumRoute(path) && !_hasPremiumAccess(user)) {
      return AppRoutes.membershipUpgrade;
    }

    // Club-specific access
    if (_isClubSpecificRoute(path)) {
      final clubId = _extractClubIdFromPath(path);
      if (clubId != null && !_hasClubAccess(user, clubId)) {
        return AppRoutes.clubs;
      }
    }

    return null;
  }

  /// Check if user needs to complete their profile
  static bool _needsProfileCompletion(UserEntity user) {
    // Check if essential profile information is missing
    return user.firstName == null ||
        user.lastName == null ||
        user.status == UserStatus.pending;
  }

  /// Check if route requires admin access
  static bool _isAdminRoute(String path) {
    const adminRoutes = ['/admin', '/dashboard/admin', '/users/manage'];

    return adminRoutes.any((route) => path.startsWith(route));
  }

  /// Check if route requires premium access
  static bool _isPremiumRoute(String path) {
    const premiumRoutes = [
      '/premium',
      '/clubs/exclusive',
      '/bookings/priority',
    ];

    return premiumRoutes.any((route) => path.startsWith(route));
  }

  /// Check if route is club-specific
  static bool _isClubSpecificRoute(String path) =>
      path.contains('/clubs/') && path.contains(':clubId');

  /// Extract club ID from path
  static String? _extractClubIdFromPath(String path) {
    final regex = RegExp(r'/clubs/([^/]+)');
    final match = regex.firstMatch(path);
    return match?.group(1);
  }

  /// Check if user has premium access
  static bool _hasPremiumAccess(UserEntity user) {
    const premiumRoles = ['premium', 'gold', 'platinum', 'diamond'];
    return premiumRoles.any((role) => user.hasRole(role));
  }

  /// Check if user has access to specific club
  static bool _hasClubAccess(UserEntity user, String clubId) {
    // Check if user is a member of the club or has general access
    return user.clubId == clubId ||
        user.hasPermission('access_all_clubs') ||
        user.hasRole('admin');
  }

  /// Check if route requires specific membership tier
  static bool _requiresMembershipTier(String path, String tier) {
    final tierRoutes = {
      'gold': ['/clubs/gold', '/services/concierge'],
      'platinum': ['/clubs/platinum', '/services/vip'],
      'diamond': ['/clubs/diamond', '/services/ultra-vip'],
    };

    final routes = tierRoutes[tier] ?? [];
    return routes.any((route) => path.startsWith(route));
  }

  /// Check if user can access route during maintenance
  static bool _canAccessDuringMaintenance(UserEntity user, String path) {
    // Only admins can access the app during maintenance
    return user.hasRole('admin') || user.hasPermission('maintenance_access');
  }

  /// Check if route requires email verification
  static bool _requiresEmailVerification(String path) {
    const verificationRequiredRoutes = [
      AppRoutes.createBooking,
      AppRoutes.payments,
      AppRoutes.membership,
    ];

    return verificationRequiredRoutes.any((route) => path.startsWith(route));
  }

  /// Check if user's email is verified
  static bool _isEmailVerified(UserEntity user) =>
      user.status == UserStatus.verified || user.status == UserStatus.active;

  /// Get appropriate redirect for unverified users
  static String _getEmailVerificationRedirect() => '/verify-email';

  /// Check for app maintenance mode
  static String? _checkMaintenanceMode(String path) {
    // This would typically check a remote config or feature flag
    const isMaintenanceMode = false; // TODO: Implement actual check

    if (isMaintenanceMode && path != AppRoutes.maintenance) {
      return AppRoutes.maintenance;
    }

    return null;
  }

  /// Check if route requires phone verification
  static bool _requiresPhoneVerification(String path) {
    const phoneVerificationRoutes = [
      '/security/two-factor',
      '/payments/large-amounts',
    ];

    return phoneVerificationRoutes.any((route) => path.startsWith(route));
  }

  /// Advanced permission checking with context
  static String? checkAdvancedPermissions({
    required UserEntity user,
    required String path,
    required GoRouterState state,
  }) {
    // Check email verification requirements
    if (_requiresEmailVerification(path) && !_isEmailVerified(user)) {
      return _getEmailVerificationRedirect();
    }

    // Check phone verification requirements
    if (_requiresPhoneVerification(path) && user.profile?.phoneNumber == null) {
      return '/verify-phone';
    }

    // Check membership tier requirements
    for (final tier in ['diamond', 'platinum', 'gold']) {
      if (_requiresMembershipTier(path, tier) && !user.hasRole(tier)) {
        return AppRoutes.membershipUpgrade;
      }
    }

    // Check maintenance mode
    final maintenanceRedirect = _checkMaintenanceMode(path);
    if (maintenanceRedirect != null &&
        !_canAccessDuringMaintenance(user, path)) {
      return maintenanceRedirect;
    }

    return null;
  }
}

/// Extension methods for user permissions
extension UserPermissionsExtension on UserEntity {
  /// Check if user has any of the specified roles
  bool hasAnyRole(List<String> roles) => roles.any((role) => hasRole(role));

  /// Check if user has all of the specified roles
  bool hasAllRoles(List<String> roles) => roles.every((role) => hasRole(role));

  /// Check if user has any of the specified permissions
  bool hasAnyPermission(List<String> permissions) =>
      permissions.any((permission) => hasPermission(permission));

  /// Check if user has all of the specified permissions
  bool hasAllPermissions(List<String> permissions) =>
      permissions.every((permission) => hasPermission(permission));

  /// Check if user is a premium member
  bool get isPremiumMember =>
      hasAnyRole(['premium', 'gold', 'platinum', 'diamond']);

  /// Check if user is an admin
  bool get isAdmin => hasAnyRole(['admin', 'super_admin']);

  /// Check if user profile is complete
  bool get isProfileComplete =>
      firstName != null &&
      lastName != null &&
      profile?.phoneNumber != null &&
      status != UserStatus.pending;

  /// Get user's highest membership tier
  String get membershipTier {
    if (hasRole('diamond')) return 'diamond';
    if (hasRole('platinum')) return 'platinum';
    if (hasRole('gold')) return 'gold';
    if (hasRole('premium')) return 'premium';
    return 'basic';
  }
}
