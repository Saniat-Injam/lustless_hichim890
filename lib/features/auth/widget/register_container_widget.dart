import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lustless_hichim890/services/shared_preferences_helper.dart';
import 'dart:convert';
import 'package:lustless_hichim890/core/bindings/auth_custom_textfield.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/common/widgets/custom_button.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/features/auth/controller/login_screen_controller.dart';
import 'package:lustless_hichim890/features/auth/controller/signup_controller.dart';
import 'package:lustless_hichim890/features/auth/widget/custom_textalign_widget.dart';
import 'package:lustless_hichim890/features/bottom_nav_ber/screen/bottom_navigation_ber.dart';

class RegisterContainerWidget {
  Widget buildRegisterForm(
    SignupController signupController,
    LoginScreenController loginScreenController,
  ) {
    return Column(
      children: [
        CustomTextAlignWidget(text: 'Username'),
        SizedBox(height: 10),
        AuthCustomTextField(
          text: 'Username',
          onChanged: (value) {
            signupController.validateFrom();
          },
          controller: signupController.nameController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Username';
            }
            return null;
          },
        ),
        SizedBox(height: 20),
        CustomTextAlignWidget(text: 'Email address'),
        SizedBox(height: 10),
        AuthCustomTextField(
          controller: signupController.emailController1,
          text: 'Enter your Email',
          onChanged: (value) {
            signupController.validateFrom();
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter a valid email address';
            }
            RegExp emailRegex = RegExp(
              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
            );
            if (!emailRegex.hasMatch(value)) {
              return 'Invalid email format. Example: example@mail.com';
            }
            return null;
          },
        ),
        SizedBox(height: 20),
        CustomTextAlignWidget(text: 'Create a password'),
        SizedBox(height: 10),
        Obx(
          () => AuthCustomTextField(
            text: 'Enter your Password',
            onChanged: (value) {
              signupController.validateFrom();
            },
            controller: signupController.passwordController,
            obscureText: signupController.isPasswordVisible.value,
            suffixIcon: IconButton(
              icon: Icon(
                signupController.isPasswordVisible.value
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: AppColors.textWhite,
              ),
              onPressed: signupController.togglePasswordVisibility,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password is required';
              }
              if (value.length < 8) {
                return 'Password must be at least 8 characters';
              }
              return null;
            },
          ),
        ),
        SizedBox(height: 20),
        CustomTextAlignWidget(text: 'Confirm password'),
        SizedBox(height: 10),
        Obx(
          () => AuthCustomTextField(
            controller: signupController.retypepasswordController,
            text: 'Enter your Password',
            onChanged: (value) {
              signupController.validateFrom();
            },
            obscureText: signupController.isPasswordVisible1.value,
            suffixIcon: IconButton(
              icon: Icon(
                signupController.isPasswordVisible1.value
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: AppColors.textWhite,
              ),
              onPressed: signupController.togglePasswordVisibility1,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }
              if (value != signupController.passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
        ),
        SizedBox(height: 30),
        CustomButton(
          title: "Register",
          onPress: () async {
            if (signupController.isFromValid.value) {
              try {
                await EasyLoading.show(status: 'Sending...');
                final response = await http.post(
                  Uri.parse(
                    'https://hachim-backend-1.onrender.com/auth/register',
                  ),
                  headers: {'Content-Type': 'application/json'},
                  body: jsonEncode({
                    'userName': signupController.nameController.text,
                    'email': signupController.emailController1.text,
                    'password': signupController.passwordController.text,
                    'confirmPassword':
                        signupController.retypepasswordController.text,
                  }),
                );
                final responseBody = jsonDecode(response.body);
                final responseMessage =
                    responseBody['message']?.toString() ?? 'No message provided';
                await EasyLoading.dismiss();
                if (response.statusCode == 200 || response.statusCode == 201) {
                  final String accessToken = responseBody['data']['access_token'];
                  await SharedPreferencesHelper.saveToken(accessToken);
                  EasyLoading.showSuccess(responseMessage);
                  Get.offAll(() => BottomNavbar());
                } else {
                  EasyLoading.showError(responseMessage);
                }
              } catch (e) {
                await EasyLoading.dismiss();
                EasyLoading.showError('Network error: $e');
              }
            } else {
              await EasyLoading.dismiss();
              EasyLoading.showError('Please fill the fields correctly');
            }
          },
        ),
        SizedBox(height: 11),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already have an account?",
              style: getTextStyle(
                color: AppColors.textWhite,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(width: 8),
            GestureDetector(
              onTap: () {
                loginScreenController.toggleSelection(true);
              },
              child: Text(
                "Sign In",
                style: getTextStyle(
                  color: AppColors.textWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}