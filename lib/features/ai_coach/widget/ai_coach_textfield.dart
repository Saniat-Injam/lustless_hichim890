import 'package:flutter/material.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';

class AICoachTextField extends StatelessWidget {
  final TextEditingController controller;
  final Widget? suffix;

  const AICoachTextField({super.key, required this.controller, this.suffix});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 12, left: 10),
          hintText: "Type message",
          hintStyle: getTextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: Color(0xFFF1F2F6),
          ),
          suffixIcon: suffix,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
