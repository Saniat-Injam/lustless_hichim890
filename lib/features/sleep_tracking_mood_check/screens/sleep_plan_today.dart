import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/features/bottom_nav_ber/screen/bottom_navigation_ber.dart';

class SleepPlanToday extends StatelessWidget {
  const SleepPlanToday({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primaryBackground,
            size: 26,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.darkBackground,
      ),
      backgroundColor: AppColors.darkBackground,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'What Do plan to do today ?',
                    style: getTextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryBackground,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 22),
              Container(
                width: double.infinity,
                height: 280,
                decoration: BoxDecoration(
                  color: AppColors.textFieldColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                    hintText: 'Start writing',
                    hintStyle: TextStyle(
                      color: AppColors.primaryBackground.withValues(
                        alpha: 0.22,
                      ),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    contentPadding: const EdgeInsets.all(16),
                    border: InputBorder.none,
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(
                    color: AppColors.primaryBackground,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 100),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(300, 50),
                  backgroundColor: AppColors.primaryBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  side: BorderSide.none,
                ),
                onPressed: () {
                  Get.to(() => BottomNavbar());
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
            ],
          ),
        ),
      ),
    );
  }
}
