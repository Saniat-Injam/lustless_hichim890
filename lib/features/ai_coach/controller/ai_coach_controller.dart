import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Message {
  final String text;
  final bool isUser;

  Message({required this.text, required this.isUser});

  Map<String, dynamic> toJson() => {'text': text, 'isUser': isUser};

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(text: json['text'], isUser: json['isUser']);
  }
}

class CoachController extends GetxController {
  final String apiKey = " ";
  final String apiUrl = " ";

  var messageController = TextEditingController();
  var messages = <Message>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadMessages();
  }

  void sendMessage() async {
    if (messageController.text.trim().isEmpty) return;

    var userMessage = Message(
      text: messageController.text.trim(),
      isUser: true,
    );
    messages.add(userMessage);
    messageController.clear();
    saveMessages();

    var aiResponse = await fetchAIResponse(userMessage.text);
    if (aiResponse.isNotEmpty) {
      messages.add(Message(text: aiResponse, isUser: false));
      saveMessages();
    }
  }

  Future<String> fetchAIResponse(String userInput) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          'model': 'gpt-3.5-turbo',
          'messages': [
            {'role': 'system', 'content': 'You are an AI coach.'},
            {'role': 'user', 'content': userInput},
          ],
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return responseData['choices'][0]['message']['content'].trim();
      } else {
        return "Error: ${response.reasonPhrase}";
      }
    } catch (e) {
      return "Failed to connect to AI.";
    }
  }

  Future<void> saveMessages() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedData =
        messages.map((msg) => json.encode(msg.toJson())).toList();
    await prefs.setStringList('chat_messages', encodedData);
  }

  Future<void> loadMessages() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedData = prefs.getStringList('chat_messages') ?? [];
    messages.assignAll(
      encodedData.map((msg) => Message.fromJson(json.decode(msg))).toList(),
    );
  }
}
