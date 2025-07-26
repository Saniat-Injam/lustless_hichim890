import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/common/widgets/custom_button.dart';
import 'package:lustless_hichim890/core/common/widgets/custom_color.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/core/utils/constants/icon_path.dart';
import 'package:lustless_hichim890/features/distractiontools_screen/controller/distraction_singlepage_controller.dart';

class DistractionSinglePage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  DistractionSinglePage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  final DistractionSinglePageController controller = Get.put(
    DistractionSinglePageController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: getContainerGradient()),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                ListTile(
                  leading: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(
                      IconPath.arrowleft,
                      width: 24,
                      height: 24,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Center(
                    child: Text(
                      "Distraction Tools",
                      style: getTextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textWhite,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Image.asset(
                  imagePath,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 60),
                Text(
                  title,
                  style: getTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textWhite,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  subtitle,
                  style: getTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor,
                  ),
                ),
                Obx(() {
                  return Text(
                    "${controller.timeRemaining ~/ 60}:${(controller.timeRemaining % 60).toString().padLeft(2, '0')}",
                    style: getTextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textWhite,
                    ),
                  );
                }),
                Obx(() {
                  return CustomButton(
                    title:
                        controller.isRunning
                            ? "Stop Exercise"
                            : "Start Exercise",
                    onPress: controller.startStopTimer,
                    width: 260,
                    height: 55,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
