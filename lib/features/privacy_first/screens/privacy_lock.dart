import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/common/widgets/custom_color.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/core/utils/constants/image_path.dart';
import 'package:lustless_hichim890/features/privacy_first/screens/enter_new_pin.dart';
import 'package:lustless_hichim890/features/privacy_first/screens/fingerprint.dart';

class PrivacyLock extends StatelessWidget {
  const PrivacyLock({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: getContainerGradient()),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 31),
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
              SizedBox(height: 40),
              CircleAvatar(
                backgroundImage: AssetImage(ImagePath.privacylock),
                radius: 28,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Privacy Lock',
                  style: getTextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryBackground,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Choose your unlock method',
                  style: getTextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Container(
                  height: 58,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: AppColors.secondary),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 6),
                    child: Row(
                      children: [
                        Text(
                          'Use PIN',
                          style: getTextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryBackground,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            Get.to(EnterNewPin());
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 18,
                            color: AppColors.primaryBackground,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 58,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AppColors.secondary),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 17),
                  child: Row(
                    children: [
                      Text(
                        'Use Biometric',
                        style: getTextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryBackground,
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Get.to(Fingerprint());
                        },
                        child: CircleAvatar(
                          radius: 13,
                          backgroundColor: AppColors.primary,
                          backgroundImage: AssetImage(ImagePath.biometric),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
