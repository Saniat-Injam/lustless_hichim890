// lib/features/home/widgets/level_badge.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/features/home/controller/yes_relapsed_controller.dart';

class LevelBadge extends StatelessWidget {
  const LevelBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<YesRelapsedController>(); 

    return Container(
      width: 136,
      height: 136,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xff0D0331),
        border: Border.all(
          width: 0.67,
          color: const Color(0xffFFFFFF).withAlpha(38), // 0.15 ≈ 38
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            spreadRadius: -2,
            color: const Color(0xffFFD9D9).withAlpha(64), // 0.25 ≈ 64
          ),
        ],
      ),
      child: Center(
        child: Obx(() => Text(
              controller.levelText.value,
              style: getTextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: const Color(0xffFFFFFF),
              ),
            )),
      ),
    );
  }
}
