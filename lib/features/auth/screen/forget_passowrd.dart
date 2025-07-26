import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lustless_hichim890/core/bindings/auth_custom_textfield.dart';
import 'package:lustless_hichim890/core/common/widgets/custom_button.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/core/utils/constants/icon_path.dart';
import 'package:lustless_hichim890/features/auth/controller/forget_passowrd_controller.dart';
import 'package:lustless_hichim890/features/auth/screen/forget_otp_send_screen.dart';
import 'package:lustless_hichim890/features/auth/widget/custom_textalign_widget.dart';

// ignore: must_be_immutable
class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  final ValueNotifier<int> focusedButtonIndex = ValueNotifier<int>(0);

  final ForgetPasswordController forgetPasswordController = Get.put(
    ForgetPasswordController(),
  );
  var isLoading = false.obs;

  Future<bool> _sendForgotPasswordRequest(String email) async {
    const String apiUrl = 'https://hachim-backend-1.onrender.com/auth/request-reset-code';
    try {
      await EasyLoading.show(status: 'Sending...');

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'email': email}),
      );
      final responseBody = jsonDecode(response.body);
                  final responseMessage = responseBody['message']?.toString() ?? 'No message provided';

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
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                CustomTextAlignWidget(text: "Forget Password", fontSize: 30),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Don’t worry! It happens. Please enter the email associated with your account.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textWhite,
                      height: 1.5,
                    ),
                  ),
                ),
                SizedBox(height: 18),
                CustomTextAlignWidget(text: "Email Address", fontSize: 20),
                SizedBox(height: 31),
                AuthCustomTextField(
                  controller: forgetPasswordController.emailController,
                  text: "Your email",
                ),
                SizedBox(height: 63),
                Obx(
                  () => CustomButton(
                    title: isLoading.value ? "Sending..." : "Send Code",
                    onPress: isLoading.value
                        ? null
                        : () async {
                            isLoading.value = true;

                            final email = forgetPasswordController.emailController.text.trim();

                            if (email.isEmpty || !GetUtils.isEmail(email)) {
                              EasyLoading.showError('Please enter a valid email address.');
                              isLoading.value = false;
                              return;
                            }

                            final success = await _sendForgotPasswordRequest(email);

                            isLoading.value = false;

                            if (success) {
                              Navigator.push(
                                // ignore: use_build_context_synchronously
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FOtpSendScreen(gmail: email,),
                                ),
                              );
                            }
                          },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}