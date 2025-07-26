import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/utils/constants/image_path.dart';
import 'package:lustless_hichim890/features/question_page/controller/question_controller.dart';
import 'package:lustless_hichim890/features/question_page/widget/ques_option.dart';
import 'package:lustless_hichim890/features/question_page/widget/question.dart';
import 'package:lustless_hichim890/features/question_page/widget/question_appbar.dart';
import 'package:lustless_hichim890/features/scoreboard_and_symtoms/screen/scoreboard_symtom_screen.dart';

class QuestionPage extends StatelessWidget {
  final QuestionController questionController = Get.put(QuestionController());

  QuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagePath.imageback),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() {
                  return BackButtonSliderRow(
                    sliderValue: questionController.sliderValue.value,
                    onSliderChanged: (double newValue) {
                      questionController.sliderValue.value = newValue;
                    },
                    questionController: questionController,
                  );
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Question',
                      style: getTextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: Color(0xffFFFFFF),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(width: 15),
                    Obx(
                      () => Text(
                        '#${questionController.questionNumber.value}',
                        style: getTextStyle(
                          fontSize: 30,
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Obx(() {
                  Question currentQuestion =
                      questionController.questions[questionController
                              .questionNumber
                              .value -
                          1];
                  return Text(
                    currentQuestion.questionText,
                    style: getTextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffFFFFFF),
                      lineHeight: 12,
                    ),
                  );
                }),
                SizedBox(height: 20),
                Obx(() {
                  int currentQuestionIndex =
                      questionController.questionNumber.value - 1;

                  if (currentQuestionIndex < 0 ||
                      currentQuestionIndex >=
                          questionController.questions.length) {
                    return SizedBox();
                  }

                  Question currentQuestion =
                      questionController.questions[currentQuestionIndex];

                  return Column(
                    children: List.generate(currentQuestion.options.length, (
                      index,
                    ) {
                      return OptionCard(
                        number: (index + 1).toString(),
                        label: currentQuestion.options[index],
                        circleColor: Color(0xff4DBDFD),
                        textColor: Color(0xffFFFFFF),
                        isSelected:
                            questionController
                                .selectedOptions[questionController
                                    .questionNumber
                                    .value -
                                1] ==
                            index,
                        onTap: () {
                          questionController.selectOption(index);
                        },
                      );
                    }),
                  );
                }),

                SizedBox(height: 100),
                Center(
                  child: InkWell(
                    onTap: () {
                      Get.offAll(() => ScoreboardSymtomScreen());
                    },
                    child: Text(
                      'Skip Test',
                      style: getTextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffCECECE),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
