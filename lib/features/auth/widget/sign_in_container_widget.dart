import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:lustless_hichim890/core/bindings/auth_custom_textfield.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/common/widgets/custom_button.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/core/utils/constants/icon_path.dart';
import 'package:lustless_hichim890/features/auth/controller/login_screen_controller.dart';
import 'package:lustless_hichim890/features/auth/screen/forget_passowrd.dart';
import 'package:lustless_hichim890/features/auth/widget/social_custom_widget.dart';
import 'package:lustless_hichim890/features/bottom_nav_ber/screen/bottom_navigation_ber.dart';
import 'package:lustless_hichim890/services/shared_preferences_helper.dart';

class SignInContainerWidget {
  Widget buildSignInForm(
    BuildContext context,
    LoginScreenController loginScreenController,
  ) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email address',
              style: getTextStyle(
                color: AppColors.textWhite,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        AuthCustomTextField(
          onChanged: (value) {
            loginScreenController.validateFrom();
          },
          controller: loginScreenController.emailController,
          text: 'Enter your email',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Incorrect email or password';
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
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: getTextStyle(
                color: AppColors.textWhite,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Obx(
          () => AuthCustomTextField(
            onChanged: (value) {
              loginScreenController.validateFrom();
            },
            text: 'Enter your password',
            controller: loginScreenController.passwordControler,
            obscureText: loginScreenController.isPasswordVisible.value,
            suffixIcon: IconButton(
              icon: Icon(
                loginScreenController.isPasswordVisible.value
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: AppColors.textWhite,
              ),
              onPressed: loginScreenController.togglePasswordVisibility,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Incorrect email or password';
              }
              if (value.length < 8) {
                return 'Password must be at least 8 characters';
              }
              return null;
            },
          ),
        ),
        SizedBox(height: 20),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ForgetPassword(),
                ),
              );
            },
            child: Text(
              'Forgot Password?',
              style: getTextStyle(
                color: AppColors.textWhite,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        CustomButton(
          title: "Sign In",
          onPress: () async {
            if (loginScreenController.isFromValid.value) {
              try {
                await EasyLoading.show(status: 'Sending...');
                final response = await http.post(
                  Uri.parse('https://hachim-backend-1.onrender.com/auth/login'), 
                  headers: {'Content-Type': 'application/json'},
                  body: jsonEncode({
                    'email': loginScreenController.emailController.text,
                    'password': loginScreenController.passwordControler.text,
                  }),
                );
                 final responseBody = jsonDecode(response.body);
                final responseMessage =
                    responseBody['message']?.toString() ??
                    'No message provided';
                await EasyLoading.dismiss();

                if (response.statusCode == 200) {
                  final String accessToken = responseBody['data']['access_token'];
                  await SharedPreferencesHelper.saveToken(accessToken);
                  EasyLoading.showSuccess(responseMessage);
                  Get.offAll(() => BottomNavbar());
                } else {
                  EasyLoading.showError('User not found.');
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
          borderRadius: 30,
        ),
        SizedBox(height: 40),
        Align(
          alignment: Alignment.center,
          child: Text(
            'Other sign in options?',
            style: getTextStyle(
              color: AppColors.textWhite,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialCustomWidget(
              imagePath: IconPath.facebooklogo,
            ),
            SizedBox(width: 20),
            SocialCustomWidget(imagePath: IconPath.googlelogo),
            SizedBox(width: 20),
            SocialCustomWidget(imagePath: IconPath.applelogo),
          ],
        ),
      ],
    );
  }
}