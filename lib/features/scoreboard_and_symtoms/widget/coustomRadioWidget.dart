// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/features/scoreboard_and_symtoms/controller/scoreboard_controller.dart';

class CoustomRadioWidget extends StatelessWidget {
  final String text;
  final double fontsize;
  final int groupValue;
  final int value;
  final void Function(int? value) onChanged;
  const CoustomRadioWidget({
    super.key,
    required this.scoreboardController,
    required this.text,
    required this.fontsize,
    required this.groupValue,
    required this.onChanged,
    required this.value,
  });

  final ScoreboardController scoreboardController;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final fontSize = screenWidth < 400 ? 17.0 : 18.0;

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: 58,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: AppColors.secondary),
      ),
      child: Row(
        children: [
          Radio(
            toggleable: true,
            activeColor: AppColors.primaryBackground,
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
          ),

          Text(
            text,
            style: getTextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w400,
              color: AppColors.primaryBackground,
            ),
          ),
        ],
      ),
    );
  }
}
