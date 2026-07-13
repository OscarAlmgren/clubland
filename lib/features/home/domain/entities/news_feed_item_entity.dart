import 'package:equatable/equatable.dart';

import '../../../../core/graphql/graphql_api.dart';
import '../../../events/domain/entities/event_entity.dart';
import 'lunch_menu_entity.dart';
import 'news_post_entity.dart';

/// Type of news feed item
enum NewsFeedItemType { newsPost, event, lunchMenu }

/// News feed item entity - wrapper for different types of content
class NewsFeedItemEntity extends Equatable {
  const NewsFeedItemEntity({
    required this.id,
    required this.type,
    required this.timestamp,
    this.newsPost,
    this.event,
    this.lunchMenu,
    this.userRSVPResponse,
  }) : assert(
         (type == NewsFeedItemType.newsPost && newsPost != null) ||
             (type == NewsFeedItemType.event && event != null) ||
             (type == NewsFeedItemType.lunchMenu && lunchMenu != null),
         'Content must match the specified type',
       );

  final String id;
  final NewsFeedItemType type;
  final DateTime timestamp;

  // Content (only one should be non-null based on type)
  final NewsPostEntity? newsPost;
  final EventEntity? event;
  final LunchMenuEntity? lunchMenu;

  // For events, the user's RSVP response if they have one
  final Enum$RSVPResponse? userRSVPResponse;

  /// Create a news post feed item
  factory NewsFeedItemEntity.newsPost({required NewsPostEntity newsPost}) {
    return NewsFeedItemEntity(
      id: 'news_${newsPost.id}',
      type: NewsFeedItemType.newsPost,
      timestamp: newsPost.postedAt,
      newsPost: newsPost,
    );
  }

  /// Create an event feed item
  factory NewsFeedItemEntity.event({
    required EventEntity event,
    Enum$RSVPResponse? userRSVPResponse,
  }) {
    return NewsFeedItemEntity(
      id: 'event_${event.id}',
      type: NewsFeedItemType.event,
      timestamp: event.startTime,
      event: event,
      userRSVPResponse: userRSVPResponse,
    );
  }

  /// Create a lunch menu feed item
  factory NewsFeedItemEntity.lunchMenu({required LunchMenuEntity lunchMenu}) {
    return NewsFeedItemEntity(
      id: 'lunch_${lunchMenu.id}',
      type: NewsFeedItemType.lunchMenu,
      timestamp: lunchMenu.weekStartDate,
      lunchMenu: lunchMenu,
    );
  }

  @override
  List<Object?> get props => [
    id,
    type,
    timestamp,
    newsPost,
    event,
    lunchMenu,
    userRSVPResponse,
  ];
}
