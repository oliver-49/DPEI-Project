// Data model for help ticket structure
class HelpTicketModel {
  final String title;
  final String description;
  final DateTime createdAt;
  bool isResolved;

  HelpTicketModel({
    required this.title,
    required this.description,
    required this.createdAt,
    this.isResolved = false,
  });

  // Convert to map for JSON serialization (useful for API calls)
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
      'isResolved': isResolved,
    };
  }
}