import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/core/utils/constants/image_path.dart';
import 'package:lustless_hichim890/features/scoreboard_and_symtoms/controller/scoreboard_controller.dart';
import 'package:lustless_hichim890/features/scoreboard_and_symtoms/screen/avoid_setbacks.dart';
import 'package:lustless_hichim890/features/scoreboard_and_symtoms/screen/rewire_your_brain.dart';
import 'package:lustless_hichim890/features/scoreboard_and_symtoms/screen/stay_motivated.dart';

class WelcomeToLustless extends StatelessWidget {
  WelcomeToLustless({super.key});
  final ScoreboardController scoreboardController = Get.put(
    ScoreboardController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: scoreboardController.controllerTwo,
            onPageChanged: scoreboardController.onPageChangedTwo,
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImagePath.scoreboard6),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBackground,
                        minimumSize: Size(142, 55),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        side: BorderSide.none,
                      ),
                      onPressed: () {
                        scoreboardController.goToNextPageTwo();
                      },
                      child: Text(
                        'Next',
                        style: getTextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.backgroundDark,
                        ),
                      ),
                    ),
                    SizedBox(height: 60),
                  ],
                ),
              ),
              RewireYourBrain(),
              StayMotivated(),
              AvoidSetbacks(),
            ],
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height <= 640 ? 140 : 150,
            left:
                MediaQuery.of(context).size.height <= 640
                    ? 143
                    : MediaQuery.of(context).size.height <= 875
                    ? 160
                    : 183,
            child: Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  4,
                  (index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      color:
                          scoreboardController.currentPageTwo.value == index
                              ? Colors.white
                              : Colors.white.withValues(alpha: 0.3),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
