import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/features/scoreboard_and_symtoms/controller/field_controller.dart';
import 'package:lustless_hichim890/features/scoreboard_and_symtoms/controller/scoreboard_controller.dart';
import 'package:lustless_hichim890/features/scoreboard_and_symtoms/widget/coustomRadioWidget.dart';

class PhysicalSection extends StatelessWidget {
  const PhysicalSection({super.key, required this.fontSize});
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final ScoreboardController scoreboardController = Get.find<ScoreboardController>();
    final FieldController fieldController = Get.find<FieldController>();
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Physical',
            style: getTextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryBackground,
            ),
          ),
          SizedBox(height: 15),
          CoustomRadioWidget(
            scoreboardController: scoreboardController,
            text: "Tiredness and lethargy",
            fontsize: fontSize,
            value: 1,
            groupValue: scoreboardController.selectedPhysicalSection.value,
            onChanged: (int? value) {
              scoreboardController.togglePhysical(value);
              fieldController.validatePhysicalSection();
            },
          ),
          CoustomRadioWidget(
            scoreboardController: scoreboardController,
            text: "Low libido or sex drive",
            fontsize: fontSize,
            value: 2,
            groupValue: scoreboardController.selectedPhysicalSection.value,
            onChanged: (int? value) {
              scoreboardController.togglePhysical(value);
              fieldController.validatePhysicalSection();
            },
          ),
          CoustomRadioWidget(
            scoreboardController: scoreboardController,
            text: "Weak erections without porn",
            fontsize: fontSize,
            value: 3,
            groupValue: scoreboardController.selectedPhysicalSection.value,
            onChanged: (int? value) {
              scoreboardController.togglePhysical(value);
              fieldController.validatePhysicalSection();
            },
          ),
        ],
      ),
    );
  }
}