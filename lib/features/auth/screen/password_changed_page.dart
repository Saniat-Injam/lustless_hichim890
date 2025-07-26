import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/common/widgets/custom_button.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/core/utils/constants/icon_path.dart';
import 'package:lustless_hichim890/features/auth/screen/signin_register_screen.dart';
import 'package:lustless_hichim890/features/auth/widget/custom_textalign_widget.dart';

class PasswordChangedPage extends StatelessWidget {
  const PasswordChangedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: AppColors.bodyColor),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
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
                SizedBox(height: 150),
                CustomTextAlignWidget(
                  text: " Password changed?",
                  fontSize: 28,
                  alignment: Alignment.center,
                ),

                SizedBox(height: 10),
                Text(
                  "Your password has been changed ",
                  style: getTextStyle(
                    color: AppColors.textWhite,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  "successfully ",
                  style: getTextStyle(
                    color: AppColors.textWhite,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 30),
                CustomButton(
                  title: "Back to login",
                  onPress: () {
                    Get.offAll(SigninRegisterScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
