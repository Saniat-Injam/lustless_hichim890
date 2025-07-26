import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lustless_hichim890/core/services/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/journal_post_model.dart';

class JournalService {
  static const String baseUrl =
      "https://hachim-backend-1.onrender.com"; // Replace with actual API base URL

  Future<JournalResponse> createJournalEntry(JournalEntryModel entry) async {
    final url = Uri.parse('$baseUrl/journal/create');
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('access_token');

    print('token $token');
    try {
      final response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(entry.toJson()),
      );

      print('res: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return JournalResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Error: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      throw Exception('Failed to create journal entry: $e');
    }
  }
}
