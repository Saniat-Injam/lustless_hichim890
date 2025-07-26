import 'package:flutter/material.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';

class CustomAlignmentWidget extends StatelessWidget {
  final Alignment alignment;
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const CustomAlignmentWidget({
    super.key,
    required this.alignment,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Text(
        text,
        style: getTextStylenunito(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }
}
