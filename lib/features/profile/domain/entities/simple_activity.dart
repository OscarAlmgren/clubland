// Simple activity data class
class SimpleActivity {
  const SimpleActivity({
    required this.id,
    required this.type,
    required this.title,
    required this.description,
    required this.timestamp,
  });

  final String id;
  final String type;
  final String title;
  final String description;
  final DateTime timestamp;
}
