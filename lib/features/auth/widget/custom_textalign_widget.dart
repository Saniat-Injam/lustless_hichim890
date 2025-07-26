import 'package:flutter/material.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';

class CustomTextAlignWidget extends StatelessWidget {
  const CustomTextAlignWidget({
    super.key,
    required this.text,
    this.fontSize = 18.0,
    this.alignment = Alignment.centerLeft,
    this.fontWeight = FontWeight.w400, 
  });

  final String text;
  final double fontSize;
  final Alignment alignment;
  final FontWeight fontWeight; 

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Text(
        text,
        style: getTextStyle(
          color: AppColors.textWhite,
          fontSize: fontSize,
          fontWeight: fontWeight, 
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
