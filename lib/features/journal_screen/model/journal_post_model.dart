// Request model for journal entry
class JournalEntryModel {
  final String note;
  final String date;
  final int mode;
  final int urge;

  JournalEntryModel({
    required this.note,
    required this.date,
    required this.mode,
    required this.urge,
  });

  Map<String, dynamic> toJson() => {
    'note': note,
    'date': date,
    'mode': mode,
    'urge': urge,
  };
}

// Response model (assuming a simple success message)
class JournalResponse {
  final String message;

  JournalResponse({required this.message});

  factory JournalResponse.fromJson(Map<String, dynamic> json) {
    return JournalResponse(
      message: json['message'] ?? 'Entry created successfully',
    );
  }
}
