class ChatMessage {
  final String text;
  final bool isMe;
  final String avatarUrl;
  final DateTime? time;
  // final bool isTyping;

  ChatMessage({
    required this.text,
    required this.isMe,
    required this.avatarUrl,
    this.time,
    // this.isTyping = false,
  });
}
