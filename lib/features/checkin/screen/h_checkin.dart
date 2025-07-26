import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/utils/constants/image_path.dart';
import 'package:lustless_hichim890/features/bottom_nav_ber/screen/bottom_navigation_ber.dart';
import 'package:lustless_hichim890/features/checkin/controller/h_checkincontroller.dart';
import 'package:lustless_hichim890/features/checkin/widget/h_backbutton.dart';
import 'package:lustless_hichim890/features/checkin/widget/h_checkinoption.dart';
import 'package:lustless_hichim890/features/checkin/widget/h_question.dart';

class HomeCheckIn extends StatelessWidget {
  const HomeCheckIn({super.key});

  @override
  Widget build(BuildContext context) {
    final HCheckincontroller hCheckincontroller = Get.put(
      HCheckincontroller(context),
    );

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagePath.imageback),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 23),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() {
                  return HbackButtonSLiderRow(
                    sliderValue: hCheckincontroller.sliderValue.value,
                    onSliderChanged: (double newValue) {
                      hCheckincontroller.sliderValue.value = newValue;
                    },
                    hCheckincontroller: hCheckincontroller,
                  );
                }),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Question',
                      style: getTextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffFFFFFF),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(width: 15),
                    Obx(
                      () => Text(
                        '#${hCheckincontroller.questionNumber.value}',
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
                  HQuestions currentQuestion =
                      hCheckincontroller.question[hCheckincontroller
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
                SizedBox(height: 32),
                Obx(() {
                  int currentQuestionIndex =
                      hCheckincontroller.questionNumber.value - 1;
                  if (currentQuestionIndex < 0 ||
                      currentQuestionIndex >=
                          hCheckincontroller.question.length) {
                    return SizedBox();
                  }
                  HQuestions currentQuestion =
                      hCheckincontroller.question[currentQuestionIndex];
                  return Column(
                    children: List.generate(currentQuestion.options.length, (
                      index,
                    ) {
                      return HCheckinoption(
                        number: (index + 1).toString(),
                        circleColor: Color(0xff4DBDFD),
                        textColor: Color(0xffFFFFFF),
                        isSelected:
                            hCheckincontroller
                                .selectedOptions[hCheckincontroller
                                    .questionNumber
                                    .value -
                                1] ==
                            index,
                        onTap: () {
                          // Update selected option and move to the next question
                          hCheckincontroller.selectOption(index);
                        },
                        labels: currentQuestion.options[index],
                      );
                    }),
                  );
                }),
                SizedBox(height: 140),
                Center(
                  child: InkWell(
                    onTap: () {
                      Get.offAll(BottomNavbar());
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
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
