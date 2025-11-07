import 'package:equatable/equatable.dart';

/// News post entity - represents a club news update
class NewsPostEntity extends Equatable {
  const NewsPostEntity({
    required this.id,
    required this.clubId,
    required this.title,
    required this.content,
    required this.postedAt,
    this.imageUrl,
    this.author,
  });

  final String id;
  final String clubId;
  final String title;
  final String content;
  final DateTime postedAt;
  final String? imageUrl;
  final String? author;

  @override
  List<Object?> get props => [
        id,
        clubId,
        title,
        content,
        postedAt,
        imageUrl,
        author,
      ];
}
