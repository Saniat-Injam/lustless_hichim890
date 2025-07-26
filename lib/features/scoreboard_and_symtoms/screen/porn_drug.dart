import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/core/utils/constants/image_path.dart';
import 'package:lustless_hichim890/features/scoreboard_and_symtoms/controller/scoreboard_controller.dart';
import 'package:lustless_hichim890/features/scoreboard_and_symtoms/screen/feeling_unhappy.dart';
import 'package:lustless_hichim890/features/scoreboard_and_symtoms/screen/path_to_recovery.dart';
import 'package:lustless_hichim890/features/scoreboard_and_symtoms/screen/porn_destory.dart';
import 'package:lustless_hichim890/features/scoreboard_and_symtoms/screen/porn_shatters.dart';

class PornDrug extends StatelessWidget {
  PornDrug({super.key});
  final ScoreboardController scoreboardController = Get.put(
    ScoreboardController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: scoreboardController.controller,
            onPageChanged: scoreboardController.onPageChanged,
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImagePath.scoreboard1),
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
                        scoreboardController.goToNextPage();
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
              PornDestory(),
              PornShatters(),
              FeelingUnhappy(),
              PathToRecovery(),
            ],
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height <= 640 ? 140 : 150,
            left:
                MediaQuery.of(context).size.height <= 640
                    ? 135
                    : MediaQuery.of(context).size.height <= 875
                    ? 153
                    : 178,
            child: Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      color:
                          scoreboardController.currentPage.value == index
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
