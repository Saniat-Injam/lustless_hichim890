import 'package:flutter/material.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';

class IconButtonWidget extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onTap;

  const IconButtonWidget({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 95,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Color(0xFF071123),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Color(0xFF133663)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, width: 44, height: 44),
            SizedBox(height: 5),
            Text(
              title,
              style: getTextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Color(0xffFFFFFF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
