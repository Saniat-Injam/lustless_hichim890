import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lustless_hichim890/features/payment/model/subscription_plan.dart';

class ApiService {
  static const String _baseUrl = 'https://hachim-backend-1.onrender.com'; 

  Future<List<SubscriptionPlan>> fetchSubscriptionPlans() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/subscriptions/active'));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => SubscriptionPlan.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load subscription plans: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching subscription plans: $e');
    }
  }
}