import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lustless_hichim890/features/payment/model/subscription_plan.dart';
import 'package:lustless_hichim890/features/payment/service/api_service.dart';
import 'package:email_validator/email_validator.dart';

class PaymentController extends GetxController {
  final ApiService _apiService = ApiService();
  final RxList<SubscriptionPlan> plans = <SubscriptionPlan>[].obs;
  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;
  final RxString email = ''.obs;
  final RxBool isEmailValid = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPlans();
    ever(email, (_) => validateEmail());
  }

  Future<void> fetchPlans() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final fetchedPlans = await _apiService.fetchSubscriptionPlans();
      plans.value = fetchedPlans.where((plan) => plan.isActive).toList();
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void validateEmail() {
    final emailValue = email.value.trim();
    isEmailValid.value = EmailValidator.validate(emailValue) &&
        emailValue.toLowerCase().endsWith('@gmail.com');
  }

  void setEmail(String value) {
    email.value = value;
  }

  Future<bool> checkSubscription(String email) async {
    try {
      const String apiUrl = 'https://hachim-backend-1.onrender.com/payments/check-payment';
      final Uri uri = Uri.parse('$apiUrl?email=${Uri.encodeQueryComponent(email.trim())}');
      if (kDebugMode) {
        print('Checking subscription for email: $email');
      } 
      if (kDebugMode) {
        print('API URL: $uri');
      } 

      final response = await http.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (kDebugMode) {
        print('API Response Status: ${response.statusCode}');
      }
      if (kDebugMode) {
        print('API Response Body: ${response.body}');
      }

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);
        if (kDebugMode) {
          print('Parsed Response: $responseBody');
        } 

        if (responseBody['statusCode'] == 200 && responseBody['success'] == true) {
          final bool hasSubscription = responseBody['data']['subscription'] == true;
          if (kDebugMode) {
            print('Subscription Status: $hasSubscription');
          } 
          return hasSubscription;
        } else {
          if (kDebugMode) {
            print('API Error: statusCode=${responseBody['statusCode']}, success=${responseBody['success']}');
          } 
          return false;
        }
      } else {
        if (kDebugMode) {
          print('HTTP Error: ${response.statusCode}');
        }
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Exception in checkSubscription: $e');
      } 
      return false;
    }
  }
}