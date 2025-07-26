import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:lustless_hichim890/app.dart';
import 'package:lustless_hichim890/services/api_keys.dart';

void main() async {
  await _setupStripe();
  runApp(const Lustless());
}

Future<void> _setupStripe() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = stripePublishableKey;
}
