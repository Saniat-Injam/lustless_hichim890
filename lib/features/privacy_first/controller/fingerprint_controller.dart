import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final LocalAuthentication auth = LocalAuthentication();
  var isAuthenticated = false.obs;



  Future<bool> checkBiometricSupport() async {
    try {
      return await auth.canCheckBiometrics;
    } catch (e) {
      Get.snackbar('Error', 'Biometric check failed');
      return false;
    }
  }

  Future<void> authenticateWithBiometrics() async {
    try {
      bool canCheckBiometrics = await checkBiometricSupport();
      if (!canCheckBiometrics) {
        Get.snackbar('Error', 'Biometric authentication not available');
        return;
      }

      bool authenticated = await auth.authenticate(
        localizedReason: 'Scan your fingerprint to login',
        options: const AuthenticationOptions(
          biometricOnly: true,
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );

      if (authenticated) {
        isAuthenticated.value = true;
        await saveFingerprintStatus(true); // ✅ Save flag
        Get.offNamed('/home');
      } else {
        Get.snackbar('Error', 'Authentication failed');
      }
    } on PlatformException catch (e) {
      Get.snackbar('Error', 'Platform error: $e');
    debugPrint("The error in fingerprint save is $e");
    }
  }

  /// Save fingerprint success flag
  Future<void> saveFingerprintStatus(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('fingerprint_authenticated', value);
  }

  /// Load fingerprint status on startup
  Future<void> loadFingerprintStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getBool('fingerprint_authenticated') ?? false;
    isAuthenticated.value = value;

    if (value) {
      // Optional: auto-navigate if already authenticated
      Get.offNamed('/home');
    }
  }

  /// Optional: Reset status (e.g., on logout)
  Future<void> clearFingerprintStatus() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('fingerprint_authenticated');
    isAuthenticated.value = false;
  }
}
