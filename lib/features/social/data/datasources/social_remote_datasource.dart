import 'package:graphql_flutter/graphql_flutter.dart' hide NetworkException;
import 'package:logger/logger.dart';

import '../../../../core/errors/exceptions.dart';
import '../models/activity_model.dart';
import '../models/club_review_model.dart';
import '../models/notification_model.dart';

/// Abstract class defining the remote interface for all social features
/// including activity, reviews, and notifications.
abstract class SocialRemoteDataSource {
  /// Fetches a list of activity items based on optional filters.
  ///
  /// Filters allow limiting by [userId], [type], and [clubId].
  /// Supports pagination via [limit] and [cursor].
  Future<List<ActivityModel>> getUserActivity({
    String? userId,
    ActivityType? type,
    String? clubId,
    int? limit,
    String? cursor,
  });

  /// Fetches a list of [ClubReviewModel]s for a specific club.
  ///
  /// Supports pagination via [limit] and [cursor].
  Future<List<ClubReviewModel>> getClubReviews({
    required String clubId,
    int? limit,
    String? cursor,
  });

  /// Creates a new club review.
  ///
  /// [rating] is required. Optional fields include [comment] and detailed
  /// [aspects] ratings.
  Future<ClubReviewModel> createReview({
    required String clubId,
    required int rating,
    String? comment,
    Map<String, int>? aspects,
  });

  /// Sends a like action to a specific activity.
  ///
  /// Returns the updated [ActivityModel].
  Future<ActivityModel> likeActivity(String activityId);

  /// Adds a comment to a specific activity.
  ///
  /// Returns the created [ActivityCommentModel].
  Future<ActivityCommentModel> addComment({
    required String activityId,
    required String text,
  });

  /// Shares a specific activity, typically creating a share link or log.
  Future<void> shareActivity(String activityId);

  /// Fetches a list of user notifications.
  ///
  /// Supports filtering by [unreadOnly] and pagination via [limit] and [cursor].
  Future<List<NotificationModel>> getNotifications({
    bool? unreadOnly,
    int? limit,
    String? cursor,
  });

  /// Marks a specific notification as read.
  Future<void> markNotificationAsRead(String notificationId);

  /// Marks all current user notifications as read.
  Future<void> markAllNotificationsAsRead();

  /// Establishes a real-time subscription for a user's notifications.
  Stream<NotificationModel> subscribeToNotifications(String userId);

  /// Establishes a real-time subscription for activities related to a specific club.
  Stream<ActivityModel> subscribeToClubActivity(String clubId);
}

/// Implementation of [SocialRemoteDataSource] using GraphQL.
class SocialRemoteDataSourceImpl implements SocialRemoteDataSource {
  /// Creates an instance of [SocialRemoteDataSourceImpl].
  ///
  /// [client] is required for GraphQL operations.
  /// If [logger] is not provided, it falls back to a default logger instance.
  SocialRemoteDataSourceImpl({
    required GraphQLClient client,
    Logger? logger,
  })  : _client = client,
        _logger = logger ?? Logger();

  final GraphQLClient _client;
  final Logger _logger;

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

      // TODO: Add userActivityQuery to GraphQLDocuments
      const userActivityQuery = '''
        query UserActivity(\$userId: ID, \$filter: ActivityFilterInput, \$pagination: PaginationInput) {
          userActivity(userId: \$userId, filter: \$filter, pagination: \$pagination) {
            nodes {
              id
              type
              userId
              clubId
              description
              metadata
              likes
              comments
              createdAt
            }
            pageInfo {
              hasNextPage
              totalCount
            }
          }
        }
      ''';

      // Execute query with timeout
      final result = await _client
          .query(
            QueryOptions(
              document: gql(userActivityQuery),
              variables: variables,
              fetchPolicy: FetchPolicy.cacheAndNetwork,
            ),
          )
          .timeout(
            const Duration(seconds: 15),
            onTimeout: () {
              _logger.w('UserActivity query timeout');
              throw NetworkException.timeout();
            },
          );

      if (result.hasException) {
        throw NetworkException.serverError(
          500,
          result.exception?.toString() ?? 'Failed to fetch activity',
        );
      }

      final rawData = result.data?['userActivity'];
      if (rawData == null) {
        throw const NetworkException('No activity data received', 'NO_DATA');
      }

      // 💡 FIX 1: Cast the raw GraphQL result data to a Map<String, dynamic>
      final data = rawData as Map<String, dynamic>;

      // FIX 2: Now that 'data' is correctly typed, accessing 'nodes' is safe.
      // The inner type cast (as List<dynamic>?) is also explicitly handled.
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

      // TODO: Add clubReviewsQuery to GraphQLDocuments
      const clubReviewsQuery = '''
        query ClubReviews(\$clubId: ID!, \$pagination: PaginationInput) {
          clubReviews(clubId: \$clubId, pagination: \$pagination) {
            nodes {
              id
              clubId
              userId
              rating
              comment
              aspects
              createdAt
              updatedAt
            }
            pageInfo {
              hasNextPage
              totalCount
            }
          }
        }
      ''';

      // Execute query with timeout
      final result = await _client
          .query(
            QueryOptions(
              document: gql(clubReviewsQuery),
              variables: variables,
              fetchPolicy: FetchPolicy.cacheAndNetwork,
            ),
          )
          .timeout(
            const Duration(seconds: 15),
            onTimeout: () {
              _logger.w('ClubReviews query timeout');
              throw NetworkException.timeout();
            },
          );

      if (result.hasException) {
        throw NetworkException.serverError(
          500,
          result.exception?.toString() ?? 'Failed to fetch reviews',
        );
      }

      final data = result.data?['clubReviews'] as Map<String, dynamic>?;
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

      // TODO: Add createReviewMutation to GraphQLDocuments
      const createReviewMutation = '''
        mutation CreateReview(\$input: CreateReviewInput!) {
          createReview(input: \$input) {
            success
            message
            review {
              id
              clubId
              userId
              rating
              comment
              aspects
              createdAt
              updatedAt
            }
          }
        }
      ''';

      // Execute mutation with timeout
      final result = await _client
          .mutate(
            MutationOptions(
              document: gql(createReviewMutation),
              variables: variables,
            ),
          )
          .timeout(
            const Duration(seconds: 20),
            onTimeout: () {
              _logger.w('CreateReview mutation timeout');
              throw NetworkException.timeout();
            },
          );

      if (result.hasException) {
        throw NetworkException.serverError(
          500,
          result.exception?.toString() ?? 'Failed to create review',
        );
      }

      final data = result.data?['createReview'] as Map<String, dynamic>?;
      if (data == null || data['success'] != true) {
        throw NetworkException(
          data?['message']?.toString() ?? 'Failed to create review',
          'CREATE_REVIEW_FAILED',
        );
      }

      final reviewData = data['review'] as Map<String, dynamic>?;
      if (reviewData == null) {
        throw const NetworkException('No review data received', 'NO_DATA');
      }

      _logger.i('Successfully created review for club: $clubId');
      return ClubReviewModel.fromJson(reviewData);
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

      // TODO: Add likeActivityMutation to GraphQLDocuments
      const likeActivityMutation = '''
        mutation LikeActivity(\$activityId: ID!) {
          likeActivity(activityId: \$activityId) {
            success
            message
            activity {
              id
              type
              userId
              clubId
              description
              metadata
              likes
              comments
              createdAt
            }
          }
        }
      ''';

      // Execute mutation with timeout
      final result = await _client
          .mutate(
            MutationOptions(
              document: gql(likeActivityMutation),
              variables: {'activityId': activityId},
            ),
          )
          .timeout(
            const Duration(seconds: 20),
            onTimeout: () {
              _logger.w('LikeActivity mutation timeout');
              throw NetworkException.timeout();
            },
          );

      if (result.hasException) {
        throw NetworkException.serverError(
          500,
          result.exception?.toString() ?? 'Failed to like activity',
        );
      }

      final data = result.data?['likeActivity'] as Map<String, dynamic>?;
      if (data == null || data['success'] != true) {
        throw const NetworkException('Failed to like activity', 'LIKE_FAILED');
      }

      final activityData = data['activity'] as Map<String, dynamic>?;
      if (activityData == null) {
        throw const NetworkException('No activity data received', 'NO_DATA');
      }

      return ActivityModel.fromJson(activityData);
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

      // TODO: Add addCommentMutation to GraphQLDocuments
      const addCommentMutation = '''
        mutation AddComment(\$activityId: ID!, \$text: String!) {
          addComment(activityId: \$activityId, text: \$text) {
            success
            message
            comment {
              id
              activityId
              userId
              text
              createdAt
            }
          }
        }
      ''';

      // Execute mutation with timeout
      final result = await _client
          .mutate(
            MutationOptions(
              document: gql(addCommentMutation),
              variables: {'activityId': activityId, 'text': text},
            ),
          )
          .timeout(
            const Duration(seconds: 20),
            onTimeout: () {
              _logger.w('AddComment mutation timeout');
              throw NetworkException.timeout();
            },
          );

      if (result.hasException) {
        throw NetworkException.serverError(
          500,
          result.exception?.toString() ?? 'Failed to add comment',
        );
      }

      final data = result.data?['addComment'] as Map<String, dynamic>?;
      if (data == null || data['success'] != true) {
        throw const NetworkException('Failed to add comment', 'COMMENT_FAILED');
      }

      final commentData = data['comment'] as Map<String, dynamic>?;
      if (commentData == null) {
        throw const NetworkException('No comment data received', 'NO_DATA');
      }

      return ActivityCommentModel.fromJson(commentData);
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

      /// GraphQL mutation to share a specific activity.
      /// The full query is embedded here as it was missing from GraphQLOperations.
      const mutation = r'''
        mutation ShareActivity($activityId: ID!) {
          shareActivity(activityId: $activityId) {
            success
            message
            shareUrl
          }
        }
      ''';

      // Execute mutation with timeout
      final result = await _client
          .mutate(
            MutationOptions(
              document: gql(mutation),
              variables: {'activityId': activityId},
            ),
          )
          .timeout(
            const Duration(seconds: 20),
            onTimeout: () {
              _logger.w('ShareActivity mutation timeout');
              throw NetworkException.timeout();
            },
          );

      if (result.hasException) {
        throw NetworkException.serverError(
          500,
          result.exception?.toString() ?? 'Failed to share activity',
        );
      }

      final data = result.data?['shareActivity'] as Map<String, dynamic>?;
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

      /// GraphQL query to fetch a list of user notifications.
      /// The full query is embedded here as it was missing from GraphQLOperations.
      const query = r'''
        query Notifications(
          $filter: NotificationFilterInput
          $pagination: PaginationInput
        ) {
          notifications(filter: $filter, pagination: $pagination) {
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
        'filter': {if (unreadOnly ?? false) 'read': false},
        'pagination': {
          if (limit != null) 'first': limit,
          if (cursor != null) 'after': cursor,
        },
      };

      // Execute query with timeout
      final result = await _client
          .query(
            QueryOptions(
              document: gql(query),
              variables: variables,
              fetchPolicy: FetchPolicy.cacheAndNetwork,
            ),
          )
          .timeout(
            const Duration(seconds: 15),
            onTimeout: () {
              _logger.w('Notifications query timeout');
              throw NetworkException.timeout();
            },
          );

      if (result.hasException) {
        throw NetworkException.serverError(
          500,
          result.exception?.toString() ?? 'Failed to fetch notifications',
        );
      }

      final data = result.data?['notifications'] as Map<String, dynamic>?;
      if (data == null) {
        throw const NetworkException(
          'No notifications data received',
          'NO_DATA',
        );
      }

      final nodes = data['nodes'] as List<dynamic>?;
      if (nodes == null) {
        return [];
      }

      return nodes
          .map(
            (node) => NotificationModel.fromJson(node as Map<String, dynamic>),
          )
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

      /// GraphQL mutation to mark a single notification as read.
      /// The full query is embedded here as it was missing from GraphQLOperations.
      const mutation = r'''
        mutation MarkNotificationRead($notificationId: ID!) {
          markNotificationRead(notificationId: $notificationId) {
            success
            message
          }
        }
      ''';

      // Execute mutation with timeout
      final result = await _client
          .mutate(
            MutationOptions(
              document: gql(mutation),
              variables: {'notificationId': notificationId},
            ),
          )
          .timeout(
            const Duration(seconds: 20),
            onTimeout: () {
              _logger.w('MarkNotificationRead mutation timeout');
              throw NetworkException.timeout();
            },
          );

      if (result.hasException) {
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

      /// GraphQL mutation to mark all unread notifications as read.
      /// The full query is embedded here as it was missing from GraphQLOperations.
      const mutation = '''
        mutation MarkAllNotificationsRead {
          markAllNotificationsRead {
            success
            message
            count
          }
        }
      ''';

      // Execute mutation with timeout
      final result = await _client
          .mutate(MutationOptions(document: gql(mutation)))
          .timeout(
            const Duration(seconds: 20),
            onTimeout: () {
              _logger.w('MarkAllNotificationsRead mutation timeout');
              throw NetworkException.timeout();
            },
          );

      if (result.hasException) {
        throw NetworkException.serverError(
          500,
          result.exception?.toString() ??
              'Failed to mark notifications as read',
        );
      }

      final data = result.data?['markAllNotificationsRead'] as Map<String, dynamic>?;
      if (data?['success'] == true) {
        final count = data?['count'] as int?;
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

      // TODO: Add notificationsSubscription to GraphQLDocuments
      const notificationsSubscription = '''
        subscription NotificationReceived(\$userId: ID!) {
          notificationReceived(userId: \$userId) {
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
        }
      ''';

      // Execute subscription
      return _client
          .subscribe(
            SubscriptionOptions(
              document: gql(notificationsSubscription),
              variables: {'userId': userId},
            ),
          )
          .timeout(
            const Duration(seconds: 30),
            onTimeout: (sink) {
              _logger.w('NotificationReceived subscription timeout');
              sink.addError(
                const NetworkException(
                  'Subscription connection timed out',
                  'SUBSCRIPTION_TIMEOUT',
                ),
              );
              sink.close();
            },
          )
          .map((result) {
        if (result.hasException) {
          throw NetworkException('Subscription error: ${result.exception}');
        }
        final data = result.data?['notifications'];
        if (data == null) {
          throw const NetworkException(
            'No notification data received',
            'NO_DATA',
          );
        }
        return NotificationModel.fromJson(data as Map<String, dynamic>);
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

      // TODO: Add clubActivitySubscription to GraphQLDocuments
      const clubActivitySubscription = '''
        subscription ClubActivityUpdated(\$clubId: ID!) {
          clubActivityUpdated(clubId: \$clubId) {
            activity {
              id
              type
              userId
              clubId
              description
              metadata
              likes
              comments
              createdAt
            }
          }
        }
      ''';

      // Execute subscription
      return _client
          .subscribe(
            SubscriptionOptions(
              document: gql(clubActivitySubscription),
              variables: {'clubId': clubId},
            ),
          )
          .timeout(
            const Duration(seconds: 30),
            onTimeout: (sink) {
              _logger.w('ClubActivityUpdated subscription timeout');
              sink.addError(
                const NetworkException(
                  'Subscription connection timed out',
                  'SUBSCRIPTION_TIMEOUT',
                ),
              );
              sink.close();
            },
          )
          .map((result) {
        if (result.hasException) {
          throw NetworkException('Subscription error: ${result.exception}');
        }
        final data = result.data?['clubActivity'] as Map<String, dynamic>?;
        if (data == null || data['activity'] == null) {
          throw const NetworkException(
            'No activity data received',
            'NO_DATA',
          );
        }
        return ActivityModel.fromJson(
          data['activity'] as Map<String, dynamic>,
        );
      });
    } on Exception catch (e) {
      _logger.e('Error setting up club activity subscription', error: e);
      throw NetworkException('Failed to subscribe to club activity: $e');
    }
  }
}

/// Defines the possible types of social activity events.
enum ActivityType {
  /// User checked into a club.
  checkedIn,

  /// User booked an event or service.
  booked,

  /// User published a review.
  reviewed,

  /// User joined a group or club.
  joined,

  /// User shared content.
  shared,

  /// User liked an activity.
  liked,

  /// User commented on an activity.
  commented,

  /// User earned an achievement or badge.
  achieved,
}
