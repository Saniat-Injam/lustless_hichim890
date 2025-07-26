import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/features/home/controller/home_controller.dart';

class CircularProgressDisplay extends StatelessWidget {
  const CircularProgressDisplay({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Center(
      child: Container(
        width: screenWidth * 0.40,
        height: screenHeight * 0.2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xff0D0331),
          border: Border.all(
            width: 0.67,
            color: Color(0xffFFFFFF).withValues(alpha: .15),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              color: Color(0xffFFD9D9).withValues(alpha: .25),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Text(
                      'Days',
                      style: getTextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    SizedBox(width: 8),
                    Obx(
                      () => Text(
                        controller.dayValue.toString(),
                        style: getTextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Obx(
              () => Text(
                controller.timeValue.toString(),
                style: getTextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffFFFFFF),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
