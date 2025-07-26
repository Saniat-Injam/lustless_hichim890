import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/features/home/controller/home_controller.dart';

class ProgressSection extends StatelessWidget {
  const ProgressSection({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 135,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xff071123),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1, color: Color(0xff133663)),
          boxShadow: [BoxShadow(blurRadius: 20.33)],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Progress',
                    style: getTextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                  Spacer(),
                  Obx(
                    () => Text(
                      '${controller.progressValue.value}',
                      style: getTextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 36),
                    child: Obx(
                      () => Text(
                        '.${(controller.progressDecimal.value * 100).toInt()}%',
                        style: getTextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Obx(
                  () => Text(
                    '${controller.hoursLeft.value} Hours to reach ${controller.goal.value} day goal',
                    style: getTextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ),
              ),
              Obx(() {
                return LinearProgressIndicator(
                  minHeight: 5,
                  value: controller.progressValue.value / 100,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xff357BE1),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
