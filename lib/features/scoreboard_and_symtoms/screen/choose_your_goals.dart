import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/common/widgets/custom_color.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/core/utils/constants/image_path.dart';
import 'package:lustless_hichim890/features/question_page/screen/final_question.dart';
import 'package:lustless_hichim890/features/scoreboard_and_symtoms/controller/scoreboard_controller.dart';
import 'package:lustless_hichim890/features/scoreboard_and_symtoms/widget/coustom_container.dart';

class ChooseYourGoals extends StatelessWidget {
  ChooseYourGoals({super.key});
  final ScoreboardController scoreboardController = Get.put(
    ScoreboardController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: getContainerGradient()),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
              child: Column(
                children: [
                  Text(
                    'Choose Your Goals',
                    style: getTextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryBackground,
                    ),
                  ),
                  SizedBox(height: 14),
                  Text(
                    'Select the goals you wish to track during',
                    style: getTextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryBackground,
                    ),
                    maxLines: 1,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'your reboot.',
                    style: getTextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryBackground,
                    ),
                  ),
                  SizedBox(height: 25),
                  Obx(
                    () => Column(
                      children: [
                        CoustomContainer(
                          image: ImagePath.love,
                          text: 'Stronger relationship',
                          color: AppColors.containerColor1,
                          groupValue: scoreboardController.selectedGoal.value,
                          value: 1,
                          onChanged: (int? value) {
                            scoreboardController.toggleButton(value);
                          },
                        ),
                        CoustomContainer(
                          image: ImagePath.container2,
                          text: 'Improved self-confidence',
                          color: AppColors.containerColor2,
                          groupValue: scoreboardController.selectedGoal.value,
                          value: 2,
                          onChanged: (int? value) {
                            scoreboardController.toggleButton(value);
                          },
                        ),
                        CoustomContainer(
                          image: ImagePath.container3,
                          text: 'Improved mood and happiness',
                          color: AppColors.containerColor3,
                          groupValue: scoreboardController.selectedGoal.value,
                          value: 3,
                          onChanged: (int? value) {
                            scoreboardController.toggleButton(value);
                          },
                        ),
                        CoustomContainer(
                          image: ImagePath.container4,
                          text: 'More energy and motivation',
                          color: AppColors.containerColor4,
                          groupValue: scoreboardController.selectedGoal.value,
                          value: 4,
                          onChanged: (int? value) {
                            scoreboardController.toggleButton(value);
                          },
                        ),
                        CoustomContainer(
                          image: ImagePath.container5,
                          text: 'Improved libido and sex life',
                          color: AppColors.containerColor5,
                          groupValue: scoreboardController.selectedGoal.value,
                          value: 5,
                          onChanged: (int? value) {
                            scoreboardController.toggleButton(value);
                          },
                        ),
                        CoustomContainer(
                          image: ImagePath.container6,
                          text: 'Improved self-control',
                          color: AppColors.containerColor6,
                          groupValue: scoreboardController.selectedGoal.value,
                          value: 6,
                          onChanged: (int? value) {
                            scoreboardController.toggleButton(value);
                          },
                        ),
                        SizedBox(height: 25),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 50),
                            backgroundColor: AppColors.primaryBackground,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            side: BorderSide.none,
                          ),
                          onPressed: scoreboardController.selectedGoal.value != 0
                              ? () {
                                  Get.offAll(() => FinalQuestion());
                                }
                              : null,
                          child: Text(
                            'Next',
                            style: getTextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: AppColors.buttontext,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}