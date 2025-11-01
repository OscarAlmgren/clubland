/// Simple club data class for use in controllers and UI.
class SimpleClub {
  /// Creates a [SimpleClub] data model.
  const SimpleClub({
    required this.id,
    required this.name,
    required this.slug,
    this.description = '',
    this.logo,
    this.coverImage,
  });

  /// The unique identifier for the club.
  final String id;

  /// The public, displayable name of the club.
  final String name;

  /// The URL-friendly identifier for the club (used in paths/links).
  final String slug;

  /// A brief description of the club. Defaults to an empty string.
  final String description;

  /// The URL for the club's main logo or avatar.
  final String? logo;

  /// The URL for the club's cover or banner image.
  final String? coverImage;
}
