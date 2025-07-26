import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/common/widgets/custom_button.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/core/utils/constants/icon_path.dart';
import 'package:lustless_hichim890/features/auth/controller/forget_passowrd_controller.dart';
import 'package:lustless_hichim890/features/auth/screen/change_password.dart';
import 'package:lustless_hichim890/features/auth/widget/custom_pin.dart';
import 'package:lustless_hichim890/features/auth/widget/custom_textalign_widget.dart'
    show CustomTextAlignWidget;

class FOtpSendScreen extends StatelessWidget {
  final String gmail;
  FOtpSendScreen({super.key, required this.gmail});
  final ForgetPasswordController forgetPasswordController =
      Get.find<ForgetPasswordController>();

  Future<bool> _sendForgotPasswordRequest(String email) async {
    const String apiUrl =
        'https://hachim-backend-1.onrender.com/auth/request-reset-code';
    try {
      await EasyLoading.show(status: 'Sending...');

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email}),
      );
      final responseBody = jsonDecode(response.body);
      final responseMessage =
          responseBody['message']?.toString() ?? 'No message provided';

      await EasyLoading.dismiss();

      if (response.statusCode == 200) {
        EasyLoading.showSuccess(responseMessage);
        return true;
      } else {
        EasyLoading.showError(responseMessage);
        return false;
      }
    } catch (e) {
      await EasyLoading.dismiss();
      EasyLoading.showError('An error occurred. Please check your connection.');
      return false;
    }
  }

  Future<bool> _verifyOtpCode(String email, String code) async {
    const String apiUrl =
        'https://hachim-backend-1.onrender.com/auth/verify-reset-code';
    try {
      await EasyLoading.show(status: 'Verifying...');

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'code': code}),
      );
      final responseBody = jsonDecode(response.body);
      final responseMessage =
          responseBody['message']?.toString() ?? 'No message provided';

      await EasyLoading.dismiss();

      if (response.statusCode == 200) {
        EasyLoading.showSuccess(responseMessage);
        return true;
      } else {
        EasyLoading.showError(responseMessage);
        return false;
      }
    } catch (e) {
      await EasyLoading.dismiss();
      EasyLoading.showError('An error occurred. Please check your connection.');
      return false;
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
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Center(
                  child: Image.asset(
                    IconPath.lustlesslogo,
                    height: 99,
                    width: 163,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 16),
                CustomTextAlignWidget(
                  text: "Please check your email",
                  fontSize: 28,
                ),
                SizedBox(height: 32),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "We've sent a code to",
                    style: getTextStyle(
                      color: AppColors.textWhite,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    gmail,
                    style: getTextStyle(
                      color: AppColors.textWhite,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 35),
                CustomPinField(
                  controller: forgetPasswordController.pinController,
                ),
                SizedBox(height: 35),
                CustomButton(
                  title: "Verify",
                  onPress: () async {
                    final isVerified = await _verifyOtpCode(
                      gmail,
                      forgetPasswordController.pinController.text,
                    );
                    if (isVerified) {
                      Get.to(ChangePassword(gmail: gmail));
                    }
                  },
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () =>
                          forgetPasswordController.timerSeconds.value == 0
                              ? GestureDetector(
                                onTap: () {
                                  _sendForgotPasswordRequest(gmail);
                                  forgetPasswordController.restartTimer();
                                },
                                child: Text(
                                  "Send code again",
                                  style: getTextStyle(
                                    color: AppColors.textWhite,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              )
                              : SizedBox.shrink(),
                    ),
                    SizedBox(width: 10),
                    Obx(
                      () => Text(
                        forgetPasswordController.timerText.value,
                        style: getTextStyle(
                          color: AppColors.textWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
