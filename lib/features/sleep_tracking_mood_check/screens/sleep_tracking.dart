import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/core/utils/constants/image_path.dart';
import 'package:lustless_hichim890/features/sleep_tracking_mood_check/controller/sleep_tracking_controller.dart';
import 'package:lustless_hichim890/features/sleep_tracking_mood_check/screens/sleep_priority.dart';

class SleepTracking extends StatelessWidget {
  SleepTracking({super.key});
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
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            Image.asset(
              ImagePath.group,
              height: 92,
              width: 92,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 30),
            Text(
              'Did you sleep well',
              style: getTextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: AppColors.primaryBackground,
              ),
            ),
            SizedBox(height: 6),
            Text(
              'last night',
              style: getTextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: AppColors.primaryBackground,
              ),
            ),
            SizedBox(height: 65),
            Obx(
              () => Text(
                sleepTrackingController.getSleptLabel(),
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
                  value: sleepTrackingController.sleepValue.value,
                  min: 0.0,
                  max: 1.0,
                  activeColor: AppColors.sliderColor,
                  inactiveColor: AppColors.backgroundDark,
                  thumbColor: AppColors.primaryBackground,
                  onChanged: (value) {
                    sleepTrackingController.updateSleepValue(value);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Not at all',
                    style: getTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.blurTextColor2,
                    ),
                  ),
                  Text(
                    'Absolutely',
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
                Get.to(() => SleepPriority());
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
          ],
        ),
      ),
    );
  }
}
