import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController{
   final newPasswordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();

  var newPasswordError = ''.obs;
  var confirmPasswordError = ''.obs;

  // Clear error messages
  void clearErrors() {
    newPasswordError.value = '';
    confirmPasswordError.value = '';
  }

  // Validate passwords
  bool validatePasswords() {
    clearErrors();

    if (newPasswordEditingController.text.isEmpty) {
      newPasswordError.value = 'Password cannot be empty';
      return false;
    }

    if (confirmPasswordEditingController.text.isEmpty) {
      confirmPasswordError.value = 'Confirm Password cannot be empty';
      return false;
    }

    if (newPasswordEditingController.text !=
        confirmPasswordEditingController.text) {
      confirmPasswordError.value = 'Passwords do not match';
      return false;
    }

    if (newPasswordEditingController.text.length < 8) {
      newPasswordError.value = 'Password should be at least 8 characters';
      return false;
    }

    return true;
  }
}