import 'package:equatable/equatable.dart';

/// Represents a single social activity item in the application, such as a check-in or review.
class ActivityModel extends Equatable {
  /// Constructs an [ActivityModel].
  const ActivityModel({
    required this.id,
    required this.type,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.user,
    this.club,
    this.metadata,
    this.interactions,
    this.comments = const [],
  });

  /// Creates an [ActivityModel] from a JSON map.
  factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
    id: json['id'] as String,
    type: json['type'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    createdAt: DateTime.parse(json['createdAt'] as String),
    user: UserSummary.fromJson(json['user'] as Map<String, dynamic>),
    club: json['club'] != null
        ? ClubSummary.fromJson(json['club'] as Map<String, dynamic>)
        : null,
    metadata: json['metadata'] as Map<String, dynamic>?,
    interactions: json['interactions'] != null
        ? ActivityInteractions.fromJson(
            json['interactions'] as Map<String, dynamic>,
          )
        : null,
    comments:
        (json['comments'] as List<dynamic>?)
            ?.map(
              (comment) => ActivityCommentModel.fromJson(
                comment as Map<String, dynamic>,
              ),
            )
            .toList() ??
        [],
  );

  /// The unique identifier for the activity.
  final String id;

  /// The type of activity (e.g., 'CHECKED_IN', 'REVIEWED').
  final String type;

  /// A brief title for the activity.
  final String title;

  /// A longer description or body text for the activity.
  final String description;

  /// The timestamp when the activity was created.
  final DateTime createdAt;

  /// Summary information about the user who performed the activity.
  final UserSummary user;

  /// Summary information about the club related to the activity (if applicable).
  final ClubSummary? club;

  /// Additional, flexible data associated with the activity.
  final Map<String, dynamic>? metadata;

  /// Summary of user interactions (likes, comments, shares) on the activity.
  final ActivityInteractions? interactions;

  /// A list of comments left on the activity. Defaults to an empty list.
  final List<ActivityCommentModel> comments;

  /// Converts this [ActivityModel] instance to a JSON map.
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'title': title,
    'description': description,
    'createdAt': createdAt.toIso8601String(),
    'user': user.toJson(),
    'club': club?.toJson(),
    'metadata': metadata,
    'interactions': interactions?.toJson(),
    'comments': comments.map((c) => c.toJson()).toList(),
  };

  @override
  List<Object?> get props => [
    id,
    type,
    title,
    description,
    createdAt,
    user,
    club,
    metadata,
    interactions,
    comments,
  ];
}

/// Summarizes the total interactions on an [ActivityModel].
class ActivityInteractions extends Equatable {
  /// Constructs an [ActivityInteractions] model.
  const ActivityInteractions({
    required this.likes,
    required this.comments,
    required this.shares,
    required this.userLiked,
    required this.userCommented,
  });

  /// Creates an [ActivityInteractions] from a JSON map.
  factory ActivityInteractions.fromJson(Map<String, dynamic> json) =>
      ActivityInteractions(
        likes: json['likes'] as int? ?? 0,
        comments: json['comments'] as int? ?? 0,
        shares: json['shares'] as int? ?? 0,
        userLiked: json['userLiked'] as bool? ?? false,
        userCommented: json['userCommented'] as bool? ?? false,
      );

  /// The total count of likes.
  final int likes;

  /// The total count of comments.
  final int comments;

  /// The total count of shares.
  final int shares;

  /// Flag indicating if the current user has liked this activity.
  final bool userLiked;

  /// Flag indicating if the current user has commented on this activity.
  final bool userCommented;

  /// Converts this [ActivityInteractions] instance to a JSON map.
  Map<String, dynamic> toJson() => {
    'likes': likes,
    'comments': comments,
    'shares': shares,
    'userLiked': userLiked,
    'userCommented': userCommented,
  };

  @override
  List<Object> get props => [likes, comments, shares, userLiked, userCommented];
}

/// Represents a single comment left on an activity.
class ActivityCommentModel extends Equatable {
  /// Constructs an [ActivityCommentModel].
  const ActivityCommentModel({
    required this.id,
    required this.text,
    required this.createdAt,
    required this.user,
  });

  /// Creates an [ActivityCommentModel] from a JSON map.
  factory ActivityCommentModel.fromJson(Map<String, dynamic> json) =>
      ActivityCommentModel(
        id: json['id'] as String,
        text: json['text'] as String,
        createdAt: DateTime.parse(json['createdAt'] as String),
        user: UserSummary.fromJson(json['user'] as Map<String, dynamic>),
      );

  /// The unique identifier for the comment.
  final String id;

  /// The content of the comment.
  final String text;

  /// The timestamp when the comment was created.
  final DateTime createdAt;

  /// Summary information about the user who made the comment.
  final UserSummary user;

  /// Converts this [ActivityCommentModel] instance to a JSON map.
  Map<String, dynamic> toJson() => {
    'id': id,
    'text': text,
    'createdAt': createdAt.toIso8601String(),
    'user': user.toJson(),
  };

  @override
  List<Object> get props => [id, text, createdAt, user];
}

/// Represents a minimal summary of a user.
class UserSummary extends Equatable {
  /// Constructs a [UserSummary] model.
  const UserSummary({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.avatar,
  });

  /// Creates a [UserSummary] from a JSON map.
  factory UserSummary.fromJson(Map<String, dynamic> json) => UserSummary(
    id: json['id'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    avatar: json['avatar'] as String?,
  );

  /// The unique identifier for the user.
  final String id;

  /// The user's first name.
  final String firstName;

  /// The user's last name.
  final String lastName;

  /// The URL for the user's avatar image, if available.
  final String? avatar;

  /// Converts this [UserSummary] instance to a JSON map.
  Map<String, dynamic> toJson() => {
    'id': id,
    'firstName': firstName,
    'lastName': lastName,
    'avatar': avatar,
  };

  /// A computed property that returns the user's full name.
  String get fullName => '$firstName $lastName';

  @override
  List<Object?> get props => [id, firstName, lastName, avatar];
}

/// Represents a minimal summary of a club.
class ClubSummary extends Equatable {
  /// Constructs a [ClubSummary] model.
  const ClubSummary({required this.id, required this.name, this.logo});

  /// Creates a [ClubSummary] from a JSON map.
  factory ClubSummary.fromJson(Map<String, dynamic> json) => ClubSummary(
    id: json['id'] as String,
    name: json['name'] as String,
    logo: json['logo'] as String?,
  );

  /// The unique identifier for the club.
  final String id;

  /// The name of the club.
  final String name;

  /// The URL for the club's logo, if available.
  final String? logo;

  /// Converts this [ClubSummary] instance to a JSON map.
  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'logo': logo};

  @override
  List<Object?> get props => [id, name, logo];
}
