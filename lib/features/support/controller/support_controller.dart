import 'package:get/get.dart';
import 'package:lustless_hichim890/features/support/model/model.dart';

class SupportController extends GetxController {
  var messages =
      <ChatMessage>[
        ChatMessage(
          text: "Hi, Mandy",
          isMe: true,
          avatarUrl: "https://randomuser.me/api/portraits/men/1.jpg",
          time: DateTime.now(),
        ),
        ChatMessage(
          text: "I've tried the app",
          isMe: true,
          avatarUrl: "https://randomuser.me/api/portraits/men/1.jpg",
          time: DateTime.now(),
        ),
        ChatMessage(
          text: "Really?",
          isMe: false,
          avatarUrl: "https://randomuser.me/api/portraits/women/2.jpg",
          time: DateTime.now(),
        ),
        ChatMessage(
          text: "Yeah, It's really good!",
          isMe: true,
          avatarUrl: "https://randomuser.me/api/portraits/men/1.jpg",
          time: DateTime.now(),
        ),
      ].obs;

  void sendMessage(String text) {
    messages.add(
      ChatMessage(
        text: text,
        isMe: true,
        avatarUrl: "https://randomuser.me/api/portraits/men/1.jpg",
        time: DateTime.now(),
      ),
    );

    Future.delayed(const Duration(seconds: 1), () {
      messages.add(
        ChatMessage(
          text: getSupportReply(text),
          isMe: false,
          avatarUrl: "https://randomuser.me/api/portraits/women/2.jpg",
          time: DateTime.now(),
        ),
      );
    });
  }

  String getSupportReply(String userMessage) {
    if (userMessage.toLowerCase().contains("hello") ||
        userMessage.toLowerCase().contains("hi")) {
      return "Hello! How can I help you today?";
    } else if (userMessage.toLowerCase().contains("app")) {
      return "Glad you tried the app! Do you have any feedback?";
    } else if (userMessage.toLowerCase().contains("good")) {
      return "Thank you! We're happy you like it.";
    } else {
      return "Thank you for your message. Our support team will get back to you soon!";
    }
  }
}
