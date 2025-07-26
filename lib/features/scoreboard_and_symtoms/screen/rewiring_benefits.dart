import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/common/widgets/custom_color.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/features/scoreboard_and_symtoms/screen/choose_your_goals.dart';

class RewiringBenefits extends StatelessWidget {
  const RewiringBenefits({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: getContainerGradient()),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Rewiring Benefits',
                    style: getTextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryBackground,
                    ),
                  ),
                  description(
                    title: 'Ahmed',
                    description1:
                        "I feel like a different person. I'm much more talkative and aware.",
                    description2:
                        "After only 11 days, I feel like a different person. I'm much more talkative and aware in social settings. At work, I'm on top of everything instead of forgetting things and asking people to repeat themselves.",
                  ),
                  description(
                    title: "Ahmed",
                    description1:
                        "My focus has improved dramatically after just two weeks.",
                    description2:
                        "I was skeptical at first, but the results speak for themselves. My ability to concentrate on tasks has improved dramatically, and I'm getting more done in less time.",
                  ),
                  description(
                    title: "Ahmed",
                    description1: "The improvements I've seen are incredible.",
                    description2:
                        "I've noticed significant changes in my ability to focus and retain information. My grades have improved and I'm much more confident in class discussions now.",
                  ),
                  SizedBox(height: 50),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: AppColors.primaryBackground,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      side: BorderSide.none,
                    ),
                    onPressed: () {
                      Get.to(() => ChooseYourGoals());
                    },
                    child: Text(
                      'Next',
                      style: getTextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: AppColors.buttontext,
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column description({
    required String title,
    required String description1,
    required String description2,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 7, top: 45),
          child: Text(
            title,
            style: getTextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryBackground.withValues(alpha: 0.6),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xff071123),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 8, top: 2, bottom: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description1,
                  style: TextStyle(
                    color: AppColors.primaryBackground,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  description2,
                  style: TextStyle(
                    color: AppColors.primaryBackground,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
