import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/features/bottom_nav_ber/screen/bottom_navigation_ber.dart';
import 'package:lustless_hichim890/features/sleep_tracking_mood_check/controller/sleep_tracking_controller.dart';

class MoodCheck extends StatelessWidget {
  MoodCheck({super.key});
  final SleepTrackingController sleepTrackingController = Get.put(
    SleepTrackingController(),
  );
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70, bottom: 70),
              child: Text(
                "How Are You Feelling?",
                style: getTextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryBackground,
                ),
              ),
            ),
            Obx(
              () => Text(
                sleepTrackingController.getMoodLabel(),
                textAlign: TextAlign.center,
                style: getTextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blurTextColor,
                ),
              ),
            ),
            SizedBox(height: 10),
            Obx(
              () => SliderTheme(
                data: SliderTheme.of(context).copyWith(trackHeight: 20),
                child: Slider(
                  value: sleepTrackingController.moodValue.value,
                  min: 0.0,
                  max: 1.0,
                  activeColor: AppColors.sliderColor,
                  inactiveColor: AppColors.backgroundDark,
                  thumbColor: AppColors.primaryBackground,
                  onChanged: (value) {
                    sleepTrackingController.updateMoodValue(value);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Bad',
                    style: getTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.blurTextColor2,
                    ),
                  ),
                  Text(
                    'Really Good',
                    style: getTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.blurTextColor2,
                    ),
                  ),
                ],
              ),
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
                Get.to(() => BottomNavbar());
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
      ),
    );
  }
}
