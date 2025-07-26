import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/features/scoreboard_and_symtoms/controller/field_controller.dart';
import 'package:lustless_hichim890/features/scoreboard_and_symtoms/controller/scoreboard_controller.dart';
import 'package:lustless_hichim890/features/scoreboard_and_symtoms/widget/coustomRadioWidget.dart';

class FaithSection extends StatelessWidget {
  const FaithSection({super.key, required this.fontSize});
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
            'Faith',
            style: getTextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryBackground,
            ),
          ),
          SizedBox(height: 15),
          CoustomRadioWidget(
            scoreboardController: scoreboardController,
            text: "Feeling distant from god",
            fontsize: fontSize,
            value: 1,
            groupValue: scoreboardController.selectedFaithSection.value,
            onChanged: (int? value) {
              scoreboardController.toggleFaith(value);
              fieldController.validateFaithSection();
            },
          ),
        ],
      ),
    );
  }
}