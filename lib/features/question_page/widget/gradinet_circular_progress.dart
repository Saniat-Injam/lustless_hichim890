import 'package:flutter/material.dart';

class GradientCircularProgressPainter extends CustomPainter {
  final double progress;
  GradientCircularProgressPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..strokeWidth = 10
          ..style = PaintingStyle.stroke
          ..shader = LinearGradient(
            colors: [Color(0xffC3E4FF), Color(0xffC73AFF)],
            begin: Alignment.topCenter,
            end: Alignment.centerRight,
          ).createShader(
            Rect.fromCircle(
              center: Offset(size.width / 2, size.height / 2),
              radius: size.width / 2,
            ),
          );

    final Paint backgroundPaint =
        Paint()
          ..color = Color(0xffC4C4C4).withValues(alpha: 0.30)
          ..strokeWidth = 10
          ..style = PaintingStyle.stroke;

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 2,
      backgroundPaint,
    );

    double angle = 2 * 3.14159265359 * progress;
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2,
      ),
      -3.14159265359 / 2,
      angle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
