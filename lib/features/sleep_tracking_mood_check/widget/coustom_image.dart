import 'package:flutter/material.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';

class CoustomImage extends StatelessWidget {
  final String image1;
  final String text1;
  final bool isSelected;
  final Function()? onTap1;

  const CoustomImage({
    super.key,
    required this.image1,
    required this.text1,
    required this.isSelected,
    required this.onTap1,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap1,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color:
                  isSelected
                      ? AppColors.primaryBackground.withValues(alpha: 0.2)
                      : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              image1,
              height: 44,
              width: 44,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              text1,
              style: getTextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color:
                    isSelected
                        ? AppColors.primaryBackground.withValues(alpha: 0.7)
                        : AppColors.primaryBackground,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
