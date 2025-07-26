import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/features/scoreboard_and_symtoms/controller/field_controller.dart';
import 'package:lustless_hichim890/features/scoreboard_and_symtoms/controller/scoreboard_controller.dart';
import 'package:lustless_hichim890/features/scoreboard_and_symtoms/screen/porn_drug.dart';
import 'package:lustless_hichim890/features/scoreboard_and_symtoms/widget/mental_section.dart';
import 'package:lustless_hichim890/features/scoreboard_and_symtoms/widget/physical_section.dart';
import 'package:lustless_hichim890/features/scoreboard_and_symtoms/widget/social_section.dart';
import 'package:lustless_hichim890/features/scoreboard_and_symtoms/widget/faith_section.dart';

class ScoreboardSymtomScreen extends StatelessWidget {
  ScoreboardSymtomScreen({super.key});
  final ScoreboardController scoreboardController = Get.put(ScoreboardController());
  final FieldController fieldController = Get.put(FieldController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final fontSize = screenWidth < 390 ? 17.0 : 18.0;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [AppColors.backgroundlinear1, AppColors.backgroundlinear2],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Symptoms',
                    style: getTextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryBackground,
                    ),
                  ),
                  Container(
                    height: 78,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.secondary),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Excessive porn use can have negative',
                            style: getTextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primaryBackground,
                            ),
                          ),
                          Text(
                            'impacts psychologically.',
                            style: getTextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primaryBackground,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Select any symptoms below:',
                    style: getTextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryBackground,
                    ),
                  ),
                  SizedBox(height: 23),
                  MentalSection(fontSize: fontSize),
                  SizedBox(height: 25),
                  PhysicalSection(fontSize: fontSize),
                  SizedBox(height: 25),
                  SocialSection(fontSize: fontSize),
                  SizedBox(height: 25),
                  FaithSection(fontSize: fontSize),
                  SizedBox(height: 35),
                  Obx(
                    () => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        backgroundColor: AppColors.primaryBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        side: BorderSide.none,
                      ),
                      onPressed: fieldController.canNavigate()
                          ? () {
                              Get.to(() => PornDrug());
                            }
                          : null,
                      child: Text(
                        'Reboot my brain',
                        style: getTextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: fieldController.canNavigate()
                              ? AppColors.buttontext
                              // ignore: deprecated_member_use
                              : AppColors.buttontext.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}