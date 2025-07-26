import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/features/auth/screen/signin_register_screen.dart';
import 'package:lustless_hichim890/services/api_keys.dart';

class StripeService {
  StripeService._privateConstructor();
  static final StripeService instance = StripeService._privateConstructor();

  String? _lastClientSecret;

  Future<void> makePayment(
    BuildContext context, {
    required String planId,
    required double amount,
    required String email,
    required int durationDays,
  }) async {
    try {
      final int amountInCents = (amount * 100).round();
      String? paymentIntentClientSecret = await _createPaymentIntent(
        amountInCents,
        "usd",
        planId,
        email,
        durationDays,
      );
      if (paymentIntentClientSecret == null) {
        _showErrorDialog(
          // ignore: use_build_context_synchronously
          context,
          'Failed to create payment intent. Please try again.',
        );
        return;
      }

      _lastClientSecret = paymentIntentClientSecret;

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentClientSecret,
          style: ThemeMode.dark,
          merchantDisplayName: 'Merchant Name',
        ),
      );

      // ignore: use_build_context_synchronously
      await _processPayment(context);
    } catch (e) {
      debugPrint('Payment Error: $e');
      // ignore: use_build_context_synchronously
      _showErrorDialog(context, 'Payment failed: $e');
    }
  }

  Future<String?> _createPaymentIntent(
    int amount,
    String currency,
    String planId,
    String email,
    int durationDays,
  ) async {
    try {
      Map<String, dynamic> data = {
        'amount': amount.toString(),
        'currency': currency,
        'receipt_email': email,
        'metadata[plan_id]': planId,
        'metadata[email]': email,
        'metadata[durationDays]': durationDays.toString(),
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $stripeSecretKey',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: _encodeMap(data),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseData = jsonDecode(response.body);
        return responseData['client_secret'];
      } else {
        debugPrint(
          'Error creating payment intent: ${response.statusCode} - ${response.body}',
        );
        return null;
      }
    } catch (e) {
      debugPrint('Error creating payment intent: $e');
      return null;
    }
  }

  Future<void> _processPayment(BuildContext context) async {
    try {
      await Stripe.instance.presentPaymentSheet();

      // Print client secret after successful payment
      debugPrint('✅ Payment Successful. Client Secret: $_lastClientSecret');

      await showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: AppColors.secondary,
            title: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  'Payment Successful',
                  style: getTextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryBackground,
                  ),
                ),
              ),
            ),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 0),
                  backgroundColor: AppColors.primaryBackground,
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                onPressed: () {
                  Get.offAll(() => SigninRegisterScreen());
                },
                child: Text(
                  'OK',
                  style: getTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkBackground,
                  ),
                ),
              ),
            ],
          );
        },
      );
    } catch (e) {
      debugPrint('Error processing payment: $e');
      // ignore: use_build_context_synchronously
      _showErrorDialog(context, 'Payment failed: $e');
    }
  }

  String _encodeMap(Map<String, dynamic> data) {
    return data.entries
        .map(
          (e) =>
              '${Uri.encodeQueryComponent(e.key)}=${Uri.encodeQueryComponent(e.value.toString())}',
        )
        .join('&');
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.secondary,
          title: Center(
            child: Text(
              'Payment Error',
              style: getTextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryBackground,
              ),
            ),
          ),
          content: Text(
            'Cancel Payment',
            style: getTextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.textWhite,
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 0),
                backgroundColor: AppColors.primaryBackground,
                side: BorderSide.none,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'OK',
                style: getTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.darkBackground,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
