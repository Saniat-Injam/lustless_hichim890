import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/common/widgets/custom_color.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/core/utils/constants/icon_path.dart';
import 'package:lustless_hichim890/features/auth/controller/login_screen_controller.dart';
import 'package:lustless_hichim890/features/auth/controller/signup_controller.dart';
import 'package:lustless_hichim890/features/auth/widget/register_container_widget.dart';
import 'package:lustless_hichim890/features/auth/widget/sign_in_container_widget.dart';

class SigninRegisterScreen extends StatelessWidget {
  SigninRegisterScreen({super.key});
  final LoginScreenController loginScreenController = Get.put(
    LoginScreenController(),
  );
  final SignupController signupController = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: getContainerGradient()),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
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
                Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap:
                              () => loginScreenController.toggleSelection(true),
                          child: Obx(() {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 5,
                              ),
                              child: Container(
                                height: 38,
                                decoration: BoxDecoration(
                                  color:
                                      loginScreenController
                                              .isUnlockedSelected
                                              .value
                                          ? Colors.white
                                          : Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    'Sign In',
                                    style: getTextStyle(
                                      color:
                                          loginScreenController
                                                  .isUnlockedSelected
                                                  .value
                                              ? AppColors.primary
                                              : Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),

                      Expanded(
                        child: GestureDetector(
                          onTap:
                              () =>
                                  loginScreenController.toggleSelection(false),
                          child: Obx(() {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 5,
                              ),
                              child: Container(
                                height: 38,
                                decoration: BoxDecoration(
                                  color:
                                      !loginScreenController
                                              .isUnlockedSelected
                                              .value
                                          ? Colors.white
                                          : Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    'Register',
                                    style: getTextStyle(
                                      color:
                                          !loginScreenController
                                                  .isUnlockedSelected
                                                  .value
                                              ? AppColors.primary
                                              : Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 35),
                Obx(() {
                  if (loginScreenController.isUnlockedSelected.value) {
                    return SignInContainerWidget().buildSignInForm(
                      context,
                      loginScreenController,
                    );
                  } else {
                    return RegisterContainerWidget().buildRegisterForm(
                      signupController,
                      loginScreenController,
                    );
                  }
                }),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
