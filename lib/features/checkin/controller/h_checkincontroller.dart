import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/utils/constants/icon_path.dart';
import 'package:lustless_hichim890/features/bottom_nav_ber/screen/bottom_navigation_ber.dart';
import 'package:lustless_hichim890/features/checkin/widget/h_question.dart';

import '../../../core/common/styles/global_text_style.dart';

class HCheckincontroller extends GetxController {
  final BuildContext context;
  HCheckincontroller(this.context);
  RxDouble sliderValue = 0.5.obs;
  RxInt questionNumber = 1.obs;
  List<HQuestions> question = [
    HQuestions(
      questionText: 'At what age did you start watching porn regularly?',
      options: ['Before 13', '13-17', '18 or older'],
    ),
    HQuestions(
      questionText: 'How often do you typically view pornography?',
      options: ['Always Daily', 'Weekly', 'Rarely'],
    ),
    HQuestions(
      questionText:
          'How has your frequency of viewing explicit content changed over time?',
      options: ['Increased', 'Stayed the same', 'Decreased'],
    ),
  ];
  RxList<int> selectedOptions = RxList<int>(List.generate(3, (_) => -1));

  void selectOption(int optionIndex) {
    selectedOptions[questionNumber.value - 1] = optionIndex;

    if (questionNumber.value < question.length) {
      questionNumber.value += 1;
      sliderValue.value = (questionNumber.value - 1).toDouble();
    } else {
      _showCompletionDialog(context);
    }
  }

  void _showCompletionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            height: 280,

            decoration: BoxDecoration(
              color: Color(0xff071123),
              // color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 48),
                      child: Image(
                        image: AssetImage(IconPath.redFlag),
                        width: 41,
                        height: 41,
                      ),
                    ),
                    SizedBox(width: 70),
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.close, color: Colors.white),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Did You Relapse?',
                  style: getTextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffFFFFFF),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    children: [
                      Text(
                        'Honesty is the first step to progress is you',
                        style: getTextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'relapsed you can log it now amd keep your',
                        style: getTextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '        journey authentic',
                        style: getTextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 18),
                InkWell(
                  onTap: () {
                    Get.to(BottomNavbar());
                  },
                  child: Container(
                    height: 49,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Color(0xff133663),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text(
                        'Done',
                        style: getTextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
