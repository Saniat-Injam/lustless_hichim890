import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/features/sleep_tracking_mood_check/controller/sleep_tracking_controller.dart';
import 'package:lustless_hichim890/features/sleep_tracking_mood_check/screens/sleep_plan_today.dart';
import 'package:lustless_hichim890/features/sleep_tracking_mood_check/widget/coustom_image.dart';

class SleepPriority extends StatelessWidget {
  SleepPriority({super.key});
  final SleepTrackingController controller =
      Get.find<SleepTrackingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primaryBackground,
            size: 26,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.darkBackground,
      ),
      backgroundColor: AppColors.darkBackground,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    'What is The priority of',
                    style: getTextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryBackground,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'today ?',
                    style: getTextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryBackground,
                    ),
                  ),
                  SizedBox(height: 16),
                  Obx(
                    () => Text(
                      'Choose up to 3 (${controller.selectedValue.length}/3)',
                      style: getTextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryBackground.withValues(
                          alpha: 0.54,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ],
          ),
          SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: controller.priorities.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              childAspectRatio: 2 / 1.4,
            ),
            itemBuilder: (context, index) {
              final priority = controller.priorities[index];
              return Obx(
                () => CoustomImage(
                  image1: priority['image'] ?? '',
                  text1: priority['text'] ?? '',
                  isSelected: controller.selectedValue.contains(index),
                  onTap1: () {
                    controller.togglePriority(index);
                  },
                ),
              );
            },
          ),
          Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(300, 50),
              backgroundColor: AppColors.primaryBackground,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              side: BorderSide.none,
            ),
            onPressed: () {
              Get.to(() => SleepPlanToday());
            },
            child: Text(
              'Next',
              style: getTextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: AppColors.buttontext,
              ),
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
