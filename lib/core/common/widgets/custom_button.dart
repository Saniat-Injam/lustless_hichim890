import 'package:flutter/material.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.backgroundColor = AppColors.textWhite,
    this.borderColor = AppColors.textSecondary,
    this.textStyle,
    required this.onPress,
    this.textColor = AppColors.textSecondary,
    this.width = double.infinity,
    this.borderRadius = 30.0,
    this.height = 48.0,
  });
  final Color textColor;
  final String title;
  final Color backgroundColor;
  final Color? borderColor;
  final TextStyle? textStyle;
  final VoidCallback? onPress;
  final double width;
  final double borderRadius;
  final double height;  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Center(
        child: Container(
          width: width,
          height: height,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor ?? backgroundColor),
            borderRadius: BorderRadius.circular(borderRadius),
            color: backgroundColor,
          ),
          child: Center(
            child: Text(
              title,
              style: getTextStyle(
                fontSize: 16,
                color: textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
