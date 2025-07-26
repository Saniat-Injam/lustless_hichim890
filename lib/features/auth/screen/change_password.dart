import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lustless_hichim890/core/bindings/auth_custom_textfield.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/common/widgets/custom_button.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/core/utils/constants/icon_path.dart';
import 'package:lustless_hichim890/features/auth/controller/change_password_controller.dart';
import 'package:lustless_hichim890/features/auth/screen/password_changed_page.dart';
import 'package:lustless_hichim890/features/auth/widget/custom_textalign_widget.dart';

class ChangePassword extends StatelessWidget {
  final String gmail;
  ChangePassword({super.key, required this.gmail});
  final ChangePasswordController controller = Get.put(
    ChangePasswordController(),
  );

  Future<void> _changePassword() async {
    const String apiUrl = 'https://hachim-backend-1.onrender.com/auth/reset-password';
    try {
      await EasyLoading.show(status: 'Changing Password...');

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': gmail,
          'password': controller.newPasswordEditingController.text,
          'confirmPassword': controller.confirmPasswordEditingController.text,
        }),
      );
      final responseBody = jsonDecode(response.body);
      final responseMessage = responseBody['message']?.toString() ?? 'No message provided';

      await EasyLoading.dismiss();

      if (response.statusCode == 200) {
        EasyLoading.showSuccess(responseMessage);
        Get.to(() => PasswordChangedPage());
      } else {
        EasyLoading.showError(responseMessage);
        controller.newPasswordError.value = responseMessage;
        controller.confirmPasswordError.value = responseMessage;
      }
    } catch (e) {
      await EasyLoading.dismiss();
      EasyLoading.showError('An error occurred. Please check your connection.');
      controller.newPasswordError.value = 'Network error, please try again';
      controller.confirmPasswordError.value = 'Network error, please try again';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: AppColors.bodyColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),
                Center(
                  child: Image.asset(
                    IconPath.lustlesslogo,
                    height: 99,
                    width: 163,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),
                const CustomTextAlignWidget(text: "New password?", fontSize: 28),
                const SizedBox(height: 32),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Please type something you’ll remember",
                    style: getTextStyle(
                      color: AppColors.textWhite,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const CustomTextAlignWidget(text: 'Create a password'),
                const SizedBox(height: 15),
                AuthCustomTextField(
                  controller: controller.newPasswordEditingController,
                  text: 'Enter your Password',
                  onChanged: (value) {
                    controller.newPasswordError.value = '';
                  },
                  validator: (value) {
                    if (controller.newPasswordError.value.isNotEmpty) {
                      return controller.newPasswordError.value;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18),
                const CustomTextAlignWidget(text: 'Confirm password'),
                const SizedBox(height: 15),
                AuthCustomTextField(
                  controller: controller.confirmPasswordEditingController,
                  text: 'Confirm your Password',
                  onChanged: (value) {
                    controller.confirmPasswordError.value = '';
                  },
                  validator: (value) {
                    if (controller.confirmPasswordError.value.isNotEmpty) {
                      return controller.confirmPasswordError.value;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                CustomButton(
                  title: "Change Password",
                  onPress: _changePassword,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}