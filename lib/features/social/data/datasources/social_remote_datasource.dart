import 'package:graphql_flutter/graphql_flutter.dart' hide NetworkException;
import 'package:logger/logger.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/graphql/graphql_operations.dart';
import '../../../../core/network/graphql_client.dart';
import '../models/activity_model.dart';
import '../models/club_review_model.dart';
import '../models/notification_model.dart';

abstract class SocialRemoteDataSource {
  Future<List<ActivityModel>> getUserActivity({
    String? userId,
    ActivityType? type,
    String? clubId,
    int? limit,
    String? cursor,
  });

  Future<List<ClubReviewModel>> getClubReviews({
    required String clubId,
    int? limit,
    String? cursor,
  });

  Future<ClubReviewModel> createReview({
    required String clubId,
    required int rating,
    String? comment,
    Map<String, int>? aspects,
  });

  Future<ActivityModel> likeActivity(String activityId);

  Future<ActivityCommentModel> addComment({
    required String activityId,
    required String text,
  });

  Future<void> shareActivity(String activityId);

  Future<List<NotificationModel>> getNotifications({
    bool? unreadOnly,
    int? limit,
    String? cursor,
  });

  Future<void> markNotificationAsRead(String notificationId);

  Future<void> markAllNotificationsAsRead();

  Stream<NotificationModel> subscribeToNotifications(String userId);

  Stream<ActivityModel> subscribeToClubActivity(String clubId);
}

class SocialRemoteDataSourceImpl implements SocialRemoteDataSource {
  final GraphQLClient _client;
  final Logger _logger;

  SocialRemoteDataSourceImpl({
    GraphQLClient? client,
    Logger? logger,
  })  : _client = client ?? GraphQLClientConfig.client,
        _logger = logger ?? Logger();

  @override
  Future<List<ActivityModel>> getUserActivity({
    String? userId,
    ActivityType? type,
    String? clubId,
    int? limit,
    String? cursor,
  }) async {
    try {
      _logger.d('Fetching user activity for userId: $userId');

      final variables = <String, dynamic>{
        if (userId != null) 'userId': userId,
        'filter': {
          if (type != null) 'type': type.name.toUpperCase(),
          if (clubId != null) 'clubId': clubId,
        },
        'pagination': {
          if (limit != null) 'first': limit,
          if (cursor != null) 'after': cursor,
        },
      };

      final result = await GraphQLHelpers.executeQuery(
        QueryOptions(
          document: gql(GraphQLOperations.userActivityQuery),
          variables: variables,
          fetchPolicy: FetchPolicy.cacheAndNetwork,
        ),
      );

      if (!GraphQLHelpers.isSuccess(result)) {
        throw NetworkException.serverError(
          500,
          GraphQLHelpers.getErrorMessage(result) ?? 'Failed to fetch activity',
        );
      }

      final data = result.data?['userActivity'];
      if (data == null) {
        throw const NetworkException('No activity data received', 'NO_DATA');
      }

      final nodes = data['nodes'] as List<dynamic>?;
      if (nodes == null) {
        return [];
      }

      return nodes
          .map((node) => ActivityModel.fromJson(node as Map<String, dynamic>))
          .toList();
    } on GraphQLException catch (e) {
      _logger.e('GraphQL error fetching activity', error: e);
      throw GraphQLException(e.toString());
    } on Exception catch (e) {
      _logger.e('Error fetching activity', error: e);
      throw NetworkException('Failed to fetch activity: $e');
    }
  }

  @override
  Future<List<ClubReviewModel>> getClubReviews({
    required String clubId,
    int? limit,
    String? cursor,
  }) async {
    try {
      _logger.d('Fetching reviews for club: $clubId');

      final variables = <String, dynamic>{
        'clubId': clubId,
        'pagination': {
          if (limit != null) 'first': limit,
          if (cursor != null) 'after': cursor,
        },
      };

      final result = await GraphQLHelpers.executeQuery(
        QueryOptions(
          document: gql(GraphQLOperations.clubReviewsQuery),
          variables: variables,
          fetchPolicy: FetchPolicy.cacheAndNetwork,
        ),
      );

      if (!GraphQLHelpers.isSuccess(result)) {
        throw NetworkException.serverError(
          500,
          GraphQLHelpers.getErrorMessage(result) ?? 'Failed to fetch reviews',
        );
      }

      final data = result.data?['clubReviews'];
      if (data == null) {
        throw const NetworkException('No reviews data received', 'NO_DATA');
      }

      final nodes = data['nodes'] as List<dynamic>?;
      if (nodes == null) {
        return [];
      }

      return nodes
          .map((node) => ClubReviewModel.fromJson(node as Map<String, dynamic>))
          .toList();
    } on GraphQLException catch (e) {
      _logger.e('GraphQL error fetching reviews', error: e);
      throw GraphQLException(e.toString());
    } on Exception catch (e) {
      _logger.e('Error fetching reviews', error: e);
      throw NetworkException('Failed to fetch reviews: $e');
    }
  }

  @override
  Future<ClubReviewModel> createReview({
    required String clubId,
    required int rating,
    String? comment,
    Map<String, int>? aspects,
  }) async {
    try {
      _logger.d('Creating review for club: $clubId');

      final variables = {
        'input': {
          'clubId': clubId,
          'rating': rating,
          if (comment != null) 'comment': comment,
          if (aspects != null) 'aspects': aspects,
        },
      };

      final result = await GraphQLHelpers.executeMutation(
        MutationOptions(
          document: gql(GraphQLOperations.createReviewMutation),
          variables: variables,
        ),
      );

      if (!GraphQLHelpers.isSuccess(result)) {
        throw NetworkException.serverError(
          500,
          GraphQLHelpers.getErrorMessage(result) ?? 'Failed to create review',
        );
      }

      final data = result.data?['createReview'];
      if (data == null || data['success'] != true) {
        throw NetworkException(
          data?['message']?.toString() ?? 'Failed to create review',
          'CREATE_REVIEW_FAILED',
        );
      }

      final reviewData = data['review'];
      if (reviewData == null) {
        throw const NetworkException('No review data received', 'NO_DATA');
      }

      _logger.i('Successfully created review for club: $clubId');
      return ClubReviewModel.fromJson(reviewData as Map<String, dynamic>);
    } on GraphQLException catch (e) {
      _logger.e('GraphQL error creating review', error: e);
      throw GraphQLException(e.toString());
    } on Exception catch (e) {
      _logger.e('Error creating review', error: e);
      throw NetworkException('Failed to create review: $e');
    }
  }

  @override
  Future<ActivityModel> likeActivity(String activityId) async {
    try {
      _logger.d('Liking activity: $activityId');

      final result = await GraphQLHelpers.executeMutation(
        MutationOptions(
          document: gql(GraphQLOperations.likeActivityMutation),
          variables: {'activityId': activityId},
        ),
      );

      if (!GraphQLHelpers.isSuccess(result)) {
        throw NetworkException.serverError(
          500,
          GraphQLHelpers.getErrorMessage(result) ?? 'Failed to like activity',
        );
      }

      final data = result.data?['likeActivity'];
      if (data == null || data['success'] != true) {
        throw const NetworkException('Failed to like activity', 'LIKE_FAILED');
      }

      final activityData = data['activity'];
      if (activityData == null) {
        throw const NetworkException('No activity data received', 'NO_DATA');
      }

      return ActivityModel.fromJson(activityData as Map<String, dynamic>);
    } on GraphQLException catch (e) {
      _logger.e('GraphQL error liking activity', error: e);
      throw GraphQLException(e.toString());
    } on Exception catch (e) {
      _logger.e('Error liking activity', error: e);
      throw NetworkException('Failed to like activity: $e');
    }
  }

  @override
  Future<ActivityCommentModel> addComment({
    required String activityId,
    required String text,
  }) async {
    try {
      _logger.d('Adding comment to activity: $activityId');

      final result = await GraphQLHelpers.executeMutation(
        MutationOptions(
          document: gql(GraphQLOperations.addCommentMutation),
          variables: {
            'activityId': activityId,
            'text': text,
          },
        ),
      );

      if (!GraphQLHelpers.isSuccess(result)) {
        throw NetworkException.serverError(
          500,
          GraphQLHelpers.getErrorMessage(result) ?? 'Failed to add comment',
        );
      }

      final data = result.data?['addComment'];
      if (data == null || data['success'] != true) {
        throw const NetworkException('Failed to add comment', 'COMMENT_FAILED');
      }

      final commentData = data['comment'];
      if (commentData == null) {
        throw const NetworkException('No comment data received', 'NO_DATA');
      }

      return ActivityCommentModel.fromJson(commentData as Map<String, dynamic>);
    } on GraphQLException catch (e) {
      _logger.e('GraphQL error adding comment', error: e);
      throw GraphQLException(e.toString());
    } on Exception catch (e) {
      _logger.e('Error adding comment', error: e);
      throw NetworkException('Failed to add comment: $e');
    }
  }

  @override
  Future<void> shareActivity(String activityId) async {
    try {
      _logger.d('Sharing activity: $activityId');

      const mutation = '''
        mutation ShareActivity(\$activityId: ID!) {
          shareActivity(activityId: \$activityId) {
            success
            message
            shareUrl
          }
        }
      ''';

      final result = await GraphQLHelpers.executeMutation(
        MutationOptions(
          document: gql(mutation),
          variables: {'activityId': activityId},
        ),
      );

      if (!GraphQLHelpers.isSuccess(result)) {
        throw NetworkException.serverError(
          500,
          GraphQLHelpers.getErrorMessage(result) ?? 'Failed to share activity',
        );
      }

      final data = result.data?['shareActivity'];
      if (data == null || data['success'] != true) {
        throw NetworkException(
          data?['message']?.toString() ?? 'Failed to share activity',
          'SHARE_FAILED',
        );
      }

      _logger.i('Successfully shared activity: $activityId');
    } on GraphQLException catch (e) {
      _logger.e('GraphQL error sharing activity', error: e);
      throw GraphQLException(e.toString());
    } on Exception catch (e) {
      _logger.e('Error sharing activity', error: e);
      throw NetworkException('Failed to share activity: $e');
    }
  }

  @override
  Future<List<NotificationModel>> getNotifications({
    bool? unreadOnly,
    int? limit,
    String? cursor,
  }) async {
    try {
      _logger.d('Fetching notifications, unreadOnly: $unreadOnly');

      const query = '''
        query Notifications(
          \$filter: NotificationFilterInput
          \$pagination: PaginationInput
        ) {
          notifications(filter: \$filter, pagination: \$pagination) {
            nodes {
              id
              type
              title
              message
              data
              createdAt
              read
              readAt
              actionUrl
            }
            pageInfo {
              hasNextPage
              totalCount
            }
          }
        }
      ''';

      final variables = <String, dynamic>{
        'filter': {
          if (unreadOnly == true) 'read': false,
        },
        'pagination': {
          if (limit != null) 'first': limit,
          if (cursor != null) 'after': cursor,
        },
      };

      final result = await GraphQLHelpers.executeQuery(
        QueryOptions(
          document: gql(query),
          variables: variables,
          fetchPolicy: FetchPolicy.cacheAndNetwork,
        ),
      );

      if (!GraphQLHelpers.isSuccess(result)) {
        throw NetworkException.serverError(
          500,
          GraphQLHelpers.getErrorMessage(result) ?? 'Failed to fetch notifications',
        );
      }

      final data = result.data?['notifications'];
      if (data == null) {
        throw const NetworkException('No notifications data received', 'NO_DATA');
      }

      final nodes = data['nodes'] as List<dynamic>?;
      if (nodes == null) {
        return [];
      }

      return nodes
          .map((node) => NotificationModel.fromJson(node as Map<String, dynamic>))
          .toList();
    } on GraphQLException catch (e) {
      _logger.e('GraphQL error fetching notifications', error: e);
      throw GraphQLException(e.toString());
    } on Exception catch (e) {
      _logger.e('Error fetching notifications', error: e);
      throw NetworkException('Failed to fetch notifications: $e');
    }
  }

  @override
  Future<void> markNotificationAsRead(String notificationId) async {
    try {
      _logger.d('Marking notification as read: $notificationId');

      const mutation = '''
        mutation MarkNotificationRead(\$notificationId: ID!) {
          markNotificationRead(notificationId: \$notificationId) {
            success
            message
          }
        }
      ''';

      final result = await GraphQLHelpers.executeMutation(
        MutationOptions(
          document: gql(mutation),
          variables: {'notificationId': notificationId},
        ),
        showErrorToUser: false, // Handle silently for UX
      );

      if (!GraphQLHelpers.isSuccess(result)) {
        _logger.w('Failed to mark notification as read: $notificationId');
        return;
      }

      _logger.d('Successfully marked notification as read: $notificationId');
    } on Exception catch (e) {
      _logger.e('Error marking notification as read', error: e);
      // Don't throw - this should be a silent operation
    }
  }

  @override
  Future<void> markAllNotificationsAsRead() async {
    try {
      _logger.d('Marking all notifications as read');

      const mutation = '''
        mutation MarkAllNotificationsRead {
          markAllNotificationsRead {
            success
            message
            count
          }
        }
      ''';

      final result = await GraphQLHelpers.executeMutation(
        MutationOptions(
          document: gql(mutation),
        ),
      );

      if (!GraphQLHelpers.isSuccess(result)) {
        throw NetworkException.serverError(
          500,
          GraphQLHelpers.getErrorMessage(result) ?? 'Failed to mark notifications as read',
        );
      }

      final data = result.data?['markAllNotificationsRead'];
      if (data?['success'] == true) {
        final count = data['count'] as int?;
        _logger.i('Successfully marked $count notifications as read');
      }
    } on GraphQLException catch (e) {
      _logger.e('GraphQL error marking all notifications as read', error: e);
      throw GraphQLException(e.toString());
    } on Exception catch (e) {
      _logger.e('Error marking all notifications as read', error: e);
      throw NetworkException('Failed to mark notifications as read: $e');
    }
  }

  @override
  Stream<NotificationModel> subscribeToNotifications(String userId) {
    try {
      _logger.d('Subscribing to notifications for user: $userId');

      return GraphQLHelpers.executeSubscription<Map<String, dynamic>>(
        SubscriptionOptions(
          document: gql(GraphQLOperations.notificationsSubscription),
          variables: {'userId': userId},
        ),
        showErrorToUser: false,
      ).map((result) {
        final data = result.data?['notifications'];
        if (data == null) {
          throw const NetworkException('No notification data received', 'NO_DATA');
        }
        return NotificationModel.fromJson(data as Map<String, dynamic>);
      }).handleError((Object error) {
        _logger.e('Error in notifications subscription', error: error);
        throw NetworkException('Notifications subscription error: $error');
      });
    } on Exception catch (e) {
      _logger.e('Error setting up notifications subscription', error: e);
      throw NetworkException('Failed to subscribe to notifications: $e');
    }
  }

  @override
  Stream<ActivityModel> subscribeToClubActivity(String clubId) {
    try {
      _logger.d('Subscribing to club activity: $clubId');

      return GraphQLHelpers.executeSubscription<Map<String, dynamic>>(
        SubscriptionOptions(
          document: gql(GraphQLOperations.clubActivitySubscription),
          variables: {'clubId': clubId},
        ),
        showErrorToUser: false,
      ).map((result) {
        final data = result.data?['clubActivity'];
        if (data == null || data['activity'] == null) {
          throw const NetworkException('No activity data received', 'NO_DATA');
        }
        return ActivityModel.fromJson(data['activity'] as Map<String, dynamic>);
      }).handleError((Object error) {
        _logger.e('Error in club activity subscription', error: error);
        throw NetworkException('Club activity subscription error: $error');
      });
    } on Exception catch (e) {
      _logger.e('Error setting up club activity subscription', error: e);
      throw NetworkException('Failed to subscribe to club activity: $e');
    }
  }
}

enum ActivityType {
  checkedIn,
  booked,
  reviewed,
  joined,
  shared,
  liked,
  commented,
  achieved,
}
