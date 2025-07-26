import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController1 = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypepasswordController = TextEditingController();

  var isPasswordVisible = false.obs;
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  var isPasswordVisible1 = false.obs;
  void togglePasswordVisibility1() {
    isPasswordVisible1.value = !isPasswordVisible1.value;
  }

  var isFromValid = false.obs;
  void validateFrom() {
    isFromValid.value =
        nameController.text.isNotEmpty &&
        emailController1.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        retypepasswordController.text.isNotEmpty;
  }
}
