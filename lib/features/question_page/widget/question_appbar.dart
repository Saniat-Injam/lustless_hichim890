import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/utils/constants/icon_path.dart';
import 'package:lustless_hichim890/features/onboring_screen/screen/onborging_screen.dart';
import 'package:lustless_hichim890/features/question_page/controller/question_controller.dart';

class BackButtonSliderRow extends StatelessWidget {
  final double sliderValue;
  final ValueChanged<double> onSliderChanged;
  final QuestionController questionController;

  const BackButtonSliderRow({
    super.key,
    required this.sliderValue,
    required this.onSliderChanged,
    required this.questionController,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              if (questionController.questionNumber.value > 1) {
                questionController.questionNumber.value -= 1;
                questionController.sliderValue.value =
                    questionController.questionNumber.value.toDouble();
              } else {
                Get.to(OnbordingScreen());
              }
            },
            child: Image(
              image: AssetImage(IconPath.back),
              height: 15,
              width: 18,
            ),
          ),
          SizedBox(width: screenWidth * 0.1),
          Expanded(
            child: Slider(
              value: sliderValue,
              min: 0.0,
              max: questionController.questions.length.toDouble() - 1,
              onChanged: onSliderChanged,
              activeColor: Color(0xffFFFFFF),
              inactiveColor: Color(0xff1C1C1E),
              thumbColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
