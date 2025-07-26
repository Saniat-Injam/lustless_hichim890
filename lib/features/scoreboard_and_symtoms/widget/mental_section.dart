import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/features/scoreboard_and_symtoms/controller/field_controller.dart';
import 'package:lustless_hichim890/features/scoreboard_and_symtoms/controller/scoreboard_controller.dart';
import 'package:lustless_hichim890/features/scoreboard_and_symtoms/widget/coustomRadioWidget.dart';

class MentalSection extends StatelessWidget {
  const MentalSection({super.key, required this.fontSize});
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
            'Mental',
            style: getTextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryBackground,
            ),
          ),
          SizedBox(height: 15),
          CoustomRadioWidget(
            scoreboardController: scoreboardController,
            text: 'Feeling unmotivated',
            fontsize: fontSize,
            value: 1,
            groupValue: scoreboardController.selectedMentalSection.value,
            onChanged: (int? value) {
              scoreboardController.toggleMental(value);
              fieldController.validateMentalSection();
            },
          ),
          CoustomRadioWidget(
            scoreboardController: scoreboardController,
            text: 'Lack of ambition to pursue goals',
            fontsize: fontSize,
            value: 2,
            groupValue: scoreboardController.selectedMentalSection.value,
            onChanged: (int? value) {
              scoreboardController.toggleMental(value);
              fieldController.validateMentalSection();
            },
          ),
          CoustomRadioWidget(
            scoreboardController: scoreboardController,
            text: 'Difficulty concentrating',
            fontsize: fontSize,
            value: 3,
            groupValue: scoreboardController.selectedMentalSection.value,
            onChanged: (int? value) {
              scoreboardController.toggleMental(value);
              fieldController.validateMentalSection();
            },
          ),
          CoustomRadioWidget(
            scoreboardController: scoreboardController,
            text: "Poor memory or 'brain fog'",
            fontsize: fontSize,
            value: 4,
            groupValue: scoreboardController.selectedMentalSection.value,
            onChanged: (int? value) {
              scoreboardController.toggleMental(value);
              fieldController.validateMentalSection();
            },
          ),
        ],
      ),
    );
  }
}