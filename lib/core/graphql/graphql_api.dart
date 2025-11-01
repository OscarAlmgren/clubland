/// GraphQL API - Type-safe generated GraphQL operations
///
/// This file exports all generated GraphQL operations from graphql_codegen.
/// All operations are generated from .graphql files in lib/graphql/ directory
/// using the graphql_codegen package.
///
/// Benefits:
/// - Full type safety with generated Dart classes
/// - Automatic serialization/deserialization
/// - IDE autocomplete and compile-time validation
/// - No raw GraphQL strings in codebase
///
/// Usage:
/// ```dart
/// import 'package:clubland/core/graphql/graphql_api.dart';
///
/// // Use generated mutation with type-safe variables
/// final result = await graphQLClient.mutate(
///   MutationOptions(
///     document: documentNodeMutationLogin,
///     variables: Variables$Mutation$Login(
///       email: 'user@example.com',
///       password: 'password123',
///     ).toJson(),
///   ),
/// );
///
/// // Parse response with type-safe classes
/// final data = Mutation$Login.fromJson(result.data!);
/// final token = data.login.token;
/// final user = data.login.user;
/// ```
library;

// =================================================================
// AUTHENTICATION OPERATIONS
// =================================================================
export '../../graphql/auth/login.graphql.dart';
export '../../graphql/auth/logout.graphql.dart';
export '../../graphql/auth/refresh_token.graphql.dart';
export '../../graphql/auth/register.graphql.dart';
// =================================================================
// VISIT OPERATIONS
// =================================================================
export '../../graphql/bookings/checkout_visit.graphql.dart';
// =================================================================
// MEMBER OPERATIONS (BOOKINGS)
// =================================================================
export '../../graphql/bookings/create_member.graphql.dart';
export '../../graphql/bookings/member.graphql.dart';
export '../../graphql/bookings/members.graphql.dart';
export '../../graphql/bookings/my_visits.graphql.dart';
export '../../graphql/bookings/record_visit.graphql.dart';
export '../../graphql/bookings/update_member.graphql.dart';
export '../../graphql/bookings/visits.graphql.dart';
// =================================================================
// CLUB OPERATIONS
// =================================================================
export '../../graphql/clubs/club.graphql.dart';
export '../../graphql/clubs/my_club.graphql.dart';
// =================================================================
// USER PROFILE OPERATIONS
// =================================================================
export '../../graphql/profile/current_user.graphql.dart';
// =================================================================
// NOTIFICATION OPERATIONS (SOCIAL)
// =================================================================
export '../../graphql/social/create_notification.graphql.dart';
export '../../graphql/social/mark_all_notifications_read.graphql.dart';
export '../../graphql/social/mark_notification_read.graphql.dart';
export '../../graphql/social/notifications.graphql.dart';
export '../../graphql/social/unread_notification_count.graphql.dart';
// =================================================================
// SUBSCRIPTION OPERATIONS
// =================================================================
export '../../graphql/subscriptions/notification_received.graphql.dart';
export '../../graphql/subscriptions/transaction_status_changed.graphql.dart';
export '../../graphql/subscriptions/visit_status_changed.graphql.dart';
// =================================================================
// SCHEMA TYPES
// =================================================================
export '../../schema/schema.graphql.dart';
