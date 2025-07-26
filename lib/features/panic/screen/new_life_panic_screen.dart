import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/core/utils/constants/image_path.dart';
import 'package:lustless_hichim890/features/panic/screen/suggestion_panic_screen.dart';

class NewLifePanicScreen extends StatelessWidget {
  const NewLifePanicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
       decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagePath.newlife),
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
                elevation: 0,
              ),
              onPressed: () {
                Get.off(()=>SuggestionPanicScreen());
           
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
    
    );
  }
}