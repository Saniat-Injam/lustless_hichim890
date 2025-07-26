import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/common/widgets/custom_color.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/core/utils/constants/image_path.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EnterNewPin extends StatelessWidget {
  EnterNewPin({super.key});
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: getContainerGradient()),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColors.primaryBackground,
                    size: 26,
                  ),
                ),
              ),
              SizedBox(height: 100),
              Image.asset(
                ImagePath.privacylock,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 19),
                child: Text(
                  'Enter New PIN',
                  style: getTextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryBackground,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 45, vertical: 10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 70,
                  child: PinCodeTextField(
                    length: 4,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.circle,
                      fieldHeight: 55,
                      fieldWidth: 55,
                      activeFillColor: AppColors.pincolor,
                      selectedFillColor: AppColors.pincolor,
                      inactiveFillColor: AppColors.pincolor,
                      inactiveColor: AppColors.primaryBackground.withValues(
                        alpha: 0.5,
                      ),
                      selectedColor: AppColors.primaryBackground,
                      activeColor: AppColors.primaryBackground.withValues(
                        alpha: 0.5,
                      ),
                    ),
                    textStyle: getTextStyle(
                      color: AppColors.primaryBackground,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    // animationDuration: const Duration(milliseconds: 0),
                    backgroundColor: Colors.transparent,
                    enableActiveFill: true,
                    controller: otpController,
                    appContext: context,
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
