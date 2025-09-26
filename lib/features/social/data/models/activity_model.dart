import 'package:equatable/equatable.dart';

class ActivityModel extends Equatable {
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

  final String id;
  final String type;
  final String title;
  final String description;
  final DateTime createdAt;
  final UserSummary user;
  final ClubSummary? club;
  final Map<String, dynamic>? metadata;
  final ActivityInteractions? interactions;
  final List<ActivityCommentModel> comments;

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
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
          ? ActivityInteractions.fromJson(json['interactions'] as Map<String, dynamic>)
          : null,
      comments: (json['comments'] as List<dynamic>?)
              ?.map((comment) => ActivityCommentModel.fromJson(comment as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
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
  }

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

class ActivityInteractions extends Equatable {
  const ActivityInteractions({
    required this.likes,
    required this.comments,
    required this.shares,
    required this.userLiked,
    required this.userCommented,
  });

  final int likes;
  final int comments;
  final int shares;
  final bool userLiked;
  final bool userCommented;

  factory ActivityInteractions.fromJson(Map<String, dynamic> json) {
    return ActivityInteractions(
      likes: json['likes'] as int? ?? 0,
      comments: json['comments'] as int? ?? 0,
      shares: json['shares'] as int? ?? 0,
      userLiked: json['userLiked'] as bool? ?? false,
      userCommented: json['userCommented'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'likes': likes,
      'comments': comments,
      'shares': shares,
      'userLiked': userLiked,
      'userCommented': userCommented,
    };
  }

  @override
  List<Object> get props => [likes, comments, shares, userLiked, userCommented];
}

class ActivityCommentModel extends Equatable {
  const ActivityCommentModel({
    required this.id,
    required this.text,
    required this.createdAt,
    required this.user,
  });

  final String id;
  final String text;
  final DateTime createdAt;
  final UserSummary user;

  factory ActivityCommentModel.fromJson(Map<String, dynamic> json) {
    return ActivityCommentModel(
      id: json['id'] as String,
      text: json['text'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      user: UserSummary.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'createdAt': createdAt.toIso8601String(),
      'user': user.toJson(),
    };
  }

  @override
  List<Object> get props => [id, text, createdAt, user];
}

class UserSummary extends Equatable {
  const UserSummary({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.avatar,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String? avatar;

  factory UserSummary.fromJson(Map<String, dynamic> json) {
    return UserSummary(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      avatar: json['avatar'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'avatar': avatar,
    };
  }

  String get fullName => '$firstName $lastName';

  @override
  List<Object?> get props => [id, firstName, lastName, avatar];
}

class ClubSummary extends Equatable {
  const ClubSummary({
    required this.id,
    required this.name,
    this.logo,
  });

  final String id;
  final String name;
  final String? logo;

  factory ClubSummary.fromJson(Map<String, dynamic> json) {
    return ClubSummary(
      id: json['id'] as String,
      name: json['name'] as String,
      logo: json['logo'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logo': logo,
    };
  }

  @override
  List<Object?> get props => [id, name, logo];
}