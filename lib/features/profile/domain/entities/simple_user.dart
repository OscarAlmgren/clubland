
/// A data model containing a summary of a user's key profile information and statistics.
class SimpleUser {
  /// Constructs a [SimpleUser] model.
  const SimpleUser({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.avatar,
    this.bio,
    this.visitCount = 0,
    this.reviewCount = 0,
    this.clubCount = 0,
    this.points = 0,
  });

  /// The unique identifier for the user.
  final String id;

  /// The user's first name.
  final String firstName;

  /// The user's last name.
  final String lastName;

  /// The user's email address.
  final String email;

  /// The URL of the user's avatar image.
  final String? avatar;

  /// A short biography or description of the user.
  final String? bio;

  /// The total number of club visits recorded for the user. Defaults to 0.
  final int visitCount;

  /// The total number of reviews written by the user. Defaults to 0.
  final int reviewCount;

  /// The total number of clubs the user is associated with. Defaults to 0.
  final int clubCount;

  /// The total loyalty or achievement points the user has earned. Defaults to 0.
  final int points;

  /// A computed property that returns the user's full name.
  String get fullName => '$firstName $lastName';
}
