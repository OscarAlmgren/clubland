import 'package:graphql_flutter/graphql_flutter.dart' hide NetworkException;
import 'package:logger/logger.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../graphql/social/mark_all_notifications_read.graphql.dart';
import '../../../../graphql/social/mark_notification_read.graphql.dart';
import '../../../../graphql/social/notification_received.graphql.dart';
import '../../../../graphql/social/notifications.graphql.dart';
import '../models/notification_model.dart';

/// Remote interface for the social feature.
///
/// Only notification operations are implemented — they are the only social
/// surface the backend schema exposes today. Activity feeds, likes,
/// comments, shares, and review creation have no backend queries/mutations
/// yet; add them here once the schema grows them (club reviews live in the
/// clubs feature via clubReviews/get_club_reviews.graphql).
abstract class SocialRemoteDataSource {
  /// Fetches notifications for the current user.
  Future<List<NotificationModel>> getNotifications({
    bool unreadOnly = false,
    int? limit,
  });

  /// Marks a single notification as read.
  Future<void> markNotificationAsRead(String notificationId);

  /// Marks all of the current user's notifications as read.
  Future<void> markAllNotificationsAsRead();

  /// Subscribes to real-time notification delivery.
  Stream<NotificationModel> subscribeToNotifications();
}

/// GraphQL implementation of [SocialRemoteDataSource]
class SocialRemoteDataSourceImpl implements SocialRemoteDataSource {
  SocialRemoteDataSourceImpl({required GraphQLClient client, Logger? logger})
    : _client = client,
      _logger = logger ?? Logger();

  final GraphQLClient _client;
  final Logger _logger;

  @override
  Future<List<NotificationModel>> getNotifications({
    bool unreadOnly = false,
    int? limit,
  }) async {
    _logger.d('Fetching notifications (unreadOnly: $unreadOnly)');

    final result = await _client.query(
      QueryOptions(
        document: documentNodeQueryNotifications,
        variables: {
          'unreadOnly': unreadOnly,
          if (limit != null) 'pagination': {'limit': limit},
        },
        fetchPolicy: FetchPolicy.cacheAndNetwork,
      ),
    );

    if (result.hasException) {
      _logger.e('Failed to fetch notifications', error: result.exception);
      throw NetworkException.serverError(
        500,
        result.exception?.graphqlErrors.firstOrNull?.message ??
            'Failed to fetch notifications',
      );
    }

    final data = result.data?['notifications'] as Map<String, dynamic>?;
    final nodes = data?['nodes'] as List<dynamic>? ?? [];

    return nodes.whereType<Map<String, dynamic>>().map((node) {
      // The schema tracks read state via readAt/status, the model via a
      // boolean.
      return NotificationModel.fromJson({
        ...node,
        'read':
            node['readAt'] != null ||
            (node['status'] as String?)?.toUpperCase() == 'READ',
      });
    }).toList();
  }

  @override
  Future<void> markNotificationAsRead(String notificationId) async {
    _logger.d('Marking notification as read: $notificationId');

    final result = await _client.mutate(
      MutationOptions(
        document: documentNodeMutationMarkNotificationRead,
        variables: {'id': notificationId},
      ),
    );

    if (result.hasException) {
      _logger.e('Failed to mark notification read', error: result.exception);
      throw NetworkException.serverError(
        500,
        result.exception?.graphqlErrors.firstOrNull?.message ??
            'Failed to mark notification as read',
      );
    }
  }

  @override
  Future<void> markAllNotificationsAsRead() async {
    _logger.d('Marking all notifications as read');

    final result = await _client.mutate(
      MutationOptions(document: documentNodeMutationMarkAllNotificationsRead),
    );

    if (result.hasException) {
      _logger.e(
        'Failed to mark all notifications read',
        error: result.exception,
      );
      throw NetworkException.serverError(
        500,
        result.exception?.graphqlErrors.firstOrNull?.message ??
            'Failed to mark all notifications as read',
      );
    }
  }

  @override
  Stream<NotificationModel> subscribeToNotifications() {
    _logger.d('Subscribing to notifications');

    return _client
        .subscribe(
          SubscriptionOptions(
            document: documentNodeSubscriptionNotificationReceived,
          ),
        )
        .map((result) {
          if (result.hasException) {
            throw NetworkException.serverError(
              500,
              result.exception?.graphqlErrors.firstOrNull?.message ??
                  'Notification subscription error',
            );
          }

          final data = result.data?['notificationReceived'];
          if (data == null) {
            throw const NetworkException(
              'No notification data received',
              'NO_DATA',
            );
          }

          final node = data as Map<String, dynamic>;
          return NotificationModel.fromJson({
            ...node,
            'read': node['readAt'] != null,
          });
        });
  }
}
