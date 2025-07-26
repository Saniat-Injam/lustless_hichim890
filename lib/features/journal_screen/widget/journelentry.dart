class JournalEntry {
  final String date;
  final String day;
  final String time;
  final String message;

  JournalEntry({
    required this.date,
    required this.day,
    required this.time,
    required this.message,
  });

  factory JournalEntry.fromJson(Map<String, dynamic> json) {
    return JournalEntry(
      date: json['date'] ?? '',
      day: json['day'] ?? '',
      time: json['time'] ?? '',
      message: json['message'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'date': date, 'day': day, 'time': time, 'message': message};
  }
}
