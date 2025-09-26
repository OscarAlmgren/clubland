import 'package:equatable/equatable.dart';

class ClubReviewModel extends Equatable {
  const ClubReviewModel({
    required this.id,
    required this.rating,
    required this.createdAt,
    required this.user,
    this.comment,
    this.aspects,
    this.helpful,
    this.responses = const [],
    this.updatedAt,
  });

  final String id;
  final int rating;
  final String? comment;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final UserSummary user;
  final ReviewAspects? aspects;
  final ReviewHelpful? helpful;
  final List<ReviewResponse> responses;

  factory ClubReviewModel.fromJson(Map<String, dynamic> json) {
    return ClubReviewModel(
      id: json['id'] as String,
      rating: json['rating'] as int,
      comment: json['comment'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
      user: UserSummary.fromJson(json['user'] as Map<String, dynamic>),
      aspects: json['aspects'] != null
          ? ReviewAspects.fromJson(json['aspects'] as Map<String, dynamic>)
          : null,
      helpful: json['helpful'] != null
          ? ReviewHelpful.fromJson(json['helpful'] as Map<String, dynamic>)
          : null,
      responses: (json['responses'] as List<dynamic>?)
              ?.map((response) => ReviewResponse.fromJson(response as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'rating': rating,
      'comment': comment,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'user': user.toJson(),
      'aspects': aspects?.toJson(),
      'helpful': helpful?.toJson(),
      'responses': responses.map((r) => r.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        rating,
        comment,
        createdAt,
        updatedAt,
        user,
        aspects,
        helpful,
        responses,
      ];
}

class ReviewAspects extends Equatable {
  const ReviewAspects({
    required this.cleanliness,
    required this.staff,
    required this.facilities,
    required this.value,
  });

  final int cleanliness;
  final int staff;
  final int facilities;
  final int value;

  factory ReviewAspects.fromJson(Map<String, dynamic> json) {
    return ReviewAspects(
      cleanliness: json['cleanliness'] as int? ?? 0,
      staff: json['staff'] as int? ?? 0,
      facilities: json['facilities'] as int? ?? 0,
      value: json['value'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cleanliness': cleanliness,
      'staff': staff,
      'facilities': facilities,
      'value': value,
    };
  }

  @override
  List<Object> get props => [cleanliness, staff, facilities, value];
}

class ReviewHelpful extends Equatable {
  const ReviewHelpful({
    required this.count,
    required this.userMarkedHelpful,
  });

  final int count;
  final bool userMarkedHelpful;

  factory ReviewHelpful.fromJson(Map<String, dynamic> json) {
    return ReviewHelpful(
      count: json['count'] as int? ?? 0,
      userMarkedHelpful: json['userMarkedHelpful'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'userMarkedHelpful': userMarkedHelpful,
    };
  }

  @override
  List<Object> get props => [count, userMarkedHelpful];
}

class ReviewResponse extends Equatable {
  const ReviewResponse({
    required this.id,
    required this.text,
    required this.createdAt,
    required this.author,
  });

  final String id;
  final String text;
  final DateTime createdAt;
  final ResponseAuthor author;

  factory ReviewResponse.fromJson(Map<String, dynamic> json) {
    return ReviewResponse(
      id: json['id'] as String,
      text: json['text'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      author: ResponseAuthor.fromJson(json['author'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'createdAt': createdAt.toIso8601String(),
      'author': author.toJson(),
    };
  }

  @override
  List<Object> get props => [id, text, createdAt, author];
}

class ResponseAuthor extends Equatable {
  const ResponseAuthor({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.role,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String role;

  factory ResponseAuthor.fromJson(Map<String, dynamic> json) {
    return ResponseAuthor(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      role: json['role'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'role': role,
    };
  }

  String get fullName => '$firstName $lastName';

  @override
  List<Object> get props => [id, firstName, lastName, role];
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