import 'package:flutter/material.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';

class SocialCustomWidget extends StatelessWidget {
  const SocialCustomWidget({
    super.key,
    required this.imagePath, 
  });

  final String imagePath; 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.socialborder,
          width: 1,
        ),
      ),
      child: CircleAvatar(
        backgroundColor: AppColors.socialBackground,
        radius: 20,
        child: Image.asset(
          imagePath, // Use the passed image path
          height: 15,
          width: 15,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
