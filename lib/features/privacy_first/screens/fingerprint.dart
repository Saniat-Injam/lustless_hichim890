import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/common/widgets/custom_color.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/core/utils/constants/image_path.dart';
import 'package:lustless_hichim890/features/privacy_first/controller/fingerprint_controller.dart';

class Fingerprint extends StatelessWidget {
  const Fingerprint({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: getContainerGradient()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColors.primaryBackground,
                  size: 26,
                ),
              ),
            ),
            SizedBox(height: 100),
            Image.asset(
              ImagePath.privacylock,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 19),
              child: Text(
                'Fingerprint',
                style: getTextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryBackground,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: IconButton(
                onPressed: () {
                  authController.authenticateWithBiometrics();
                },
                icon: Icon(
                  Icons.fingerprint,
                  size: 80,
                  color: AppColors.primaryBackground,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
