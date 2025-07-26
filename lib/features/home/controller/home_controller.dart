import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/common/widgets/custom_alignment_widget.dart';
import 'package:lustless_hichim890/core/common/widgets/custom_button.dart';
import 'package:lustless_hichim890/core/common/widgets/custom_color.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/core/utils/constants/icon_path.dart';

class HomeController extends GetxController {
  static const int _initialSeconds = 24 * 60 * 60;
  var seconds = _initialSeconds.obs;

  Timer? _timer;

  void startTimer() {
    _timer?.cancel();

    if (seconds.value <= 0) {
      seconds.value = _initialSeconds;
    }

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds.value > 0) {
        seconds.value--;
      } else {
        timer.cancel(); // Countdown শেষ
      }
    });
  }

  void stopTimer() => _timer?.cancel();

  void resetTimer() {
    seconds.value = _initialSeconds; // ৫️⃣ reset-এও ২৪ ঘণ্টা
    stopTimer();
  }

  String get formattedTime {
    final total = seconds.value;
    final hours = total ~/ 3600;
    final minutes = (total % 3600) ~/ 60;
    final secs = total % 60;
    return '${hours}hr : ${minutes}m : ${secs}s';
  }

  @override
  void onClose() {
    super.onInit();
    startTimer();
  }

  TextEditingController insperationController = TextEditingController(); ////
  TextEditingController motivationController = TextEditingController();
  RxInt dayValue = 10.obs;
  RxString timeValue = '00:20:0.1'.obs;
  RxInt progressValue = 60.obs;
  RxDouble progressDecimal = 0.50.obs;
  RxInt hoursLeft = 8.obs;
  RxInt goal = 1.obs;
  var isMotivationSaved = false.obs;
  void updateProgress(int newProgress) {
    progressValue.value = newProgress;
  }

  void toggleMotivationSaved() {
    isMotivationSaved.value = !isMotivationSaved.value;
  }

  // bottom sheet
  void whatMotivatesYou(BuildContext context, int index) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

        return Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: getContainerGradient(),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(
                      IconPath.closelogo,
                      width: 24,
                      height: 24,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                CustomAlignmentWidget(
                  alignment: Alignment.centerLeft,
                  text: 'What Motivates You?',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textWhite,
                ),
                SizedBox(height: 6),
                CustomAlignmentWidget(
                  alignment: Alignment.centerLeft,
                  text:
                      'Having a clear motivation helps you stay focused on your recovery journey. Why do you want to quit porn?',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textWhite,
                ),
                SizedBox(height: 20),
                CustomAlignmentWidget(
                  alignment: Alignment.centerLeft,
                  text: 'Need inspiration?',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textWhite,
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: insperationController,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'For better relationships with my partner',
                    hintStyle: getTextStyle(
                      fontSize: 14,
                      color: AppColors.textWhite,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.secondary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.secondary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: Icon(
                      Icons.lightbulb_outlined,
                      size: 24,
                      color: AppColors.textWhite,
                    ),
                  ),

                  style: getTextStyle(fontSize: 14, color: AppColors.textWhite),
                ),
                SizedBox(height: 16),
                CustomAlignmentWidget(
                  alignment: Alignment.centerLeft,
                  text: "Your Motivation:",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textWhite,
                ),
                SizedBox(height: 27),
                TextFormField(
                  controller: motivationController,
                  maxLines: 15,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'Type your motivation here..........',
                    hintStyle: getTextStyle(
                      fontSize: 14,
                      color: AppColors.textWhite,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.secondary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.secondary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: getTextStyle(fontSize: 14, color: AppColors.textWhite),
                ),
                SizedBox(height: 20),
                CustomButton(
                  title: "Save Motivation",
                  onPress: () {
                    toggleMotivationSaved();
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 20),
                CustomAlignmentWidget(
                  alignment: Alignment.center,
                  text: "Use current suggestion",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textWhite,
                ),

                SizedBox(height: keyboardHeight > 0 ? keyboardHeight : 40),
              ],
            ),
          ),
        );
      },
    );
  }
}
