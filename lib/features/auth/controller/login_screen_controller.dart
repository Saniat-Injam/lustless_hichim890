import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {
   TextEditingController passwordControler = TextEditingController();
  TextEditingController emailController = TextEditingController();
  var isUnlockedSelected = true.obs;
    void toggleSelection(bool isUnlocked) {
    isUnlockedSelected.value = isUnlocked;
  }
  var isPasswordVisible = true.obs;
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
    var isFromValid = false.obs;
  void validateFrom() {
    isFromValid.value =
        emailController.text.isNotEmpty && passwordControler.text.isNotEmpty;
  }
}
