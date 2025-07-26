import 'package:flutter/material.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';

class CustomPriceListWidget extends StatelessWidget {
  final String imagePath; 
  final String text; 

  const CustomPriceListWidget({
    super.key,
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          height: 13,
          width: 13,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 5),
        Text(
          text,
          style: getTextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.textWhite,
          ),
        ),
      ],
    );
  }
}
