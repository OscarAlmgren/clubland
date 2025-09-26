import 'package:equatable/equatable.dart';

class NotificationModel extends Equatable {
  const NotificationModel({
    required this.id,
    required this.type,
    required this.title,
    required this.message,
    required this.createdAt,
    required this.read,
    this.data,
    this.readAt,
    this.actionUrl,
  });

  final String id;
  final String type;
  final String title;
  final String message;
  final Map<String, dynamic>? data;
  final DateTime createdAt;
  final bool read;
  final DateTime? readAt;
  final String? actionUrl;

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      data: json['data'] as Map<String, dynamic>?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      read: json['read'] as bool? ?? false,
      readAt: json['readAt'] != null
          ? DateTime.parse(json['readAt'] as String)
          : null,
      actionUrl: json['actionUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'title': title,
      'message': message,
      'data': data,
      'createdAt': createdAt.toIso8601String(),
      'read': read,
      'readAt': readAt?.toIso8601String(),
      'actionUrl': actionUrl,
    };
  }

  bool get isUnread => !read;

  NotificationModel copyWith({
    String? id,
    String? type,
    String? title,
    String? message,
    Map<String, dynamic>? data,
    DateTime? createdAt,
    bool? read,
    DateTime? readAt,
    String? actionUrl,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      message: message ?? this.message,
      data: data ?? this.data,
      createdAt: createdAt ?? this.createdAt,
      read: read ?? this.read,
      readAt: readAt ?? this.readAt,
      actionUrl: actionUrl ?? this.actionUrl,
    );
  }

  @override
  List<Object?> get props => [
        id,
        type,
        title,
        message,
        data,
        createdAt,
        read,
        readAt,
        actionUrl,
      ];
}