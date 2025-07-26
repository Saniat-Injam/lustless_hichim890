import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/features/auth/controller/forget_passowrd_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// ignore: must_be_immutable
class CustomPinField extends StatelessWidget {
  final TextEditingController controller;
  final ForgetPasswordController forgetPasswordController =
      Get.find<ForgetPasswordController>();

  CustomPinField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PinCodeTextField(
        autoDisposeControllers: false,
        controller: controller,
        appContext: context,
        length: 4,
        onChanged: (value) {
          forgetPasswordController.validateForm2();
        },
        textStyle: getTextStyle(
          color: AppColors.textWhite,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        pinTheme: PinTheme(
          fieldHeight: 60,
          fieldWidth: 60,
          selectedBorderWidth: 1,
          selectedColor: AppColors.textWhite,
          activeColor: AppColors.textWhite,
          inactiveColor: AppColors.textWhite,
          activeBorderWidth: 1,
          inactiveBorderWidth: 1,
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(6),
        ),
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        keyboardType: TextInputType.number,
      ),
    );
  }
}