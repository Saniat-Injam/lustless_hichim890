import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/common/widgets/custom_color.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:lustless_hichim890/core/utils/constants/image_path.dart';

class Quotes extends StatelessWidget {
  const Quotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: getContainerGradient()),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.white, size: 24),
                ),
                Spacer(),
                Text(
                  "Quotes",
                  style: getTextStylenunito(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textWhite,
                  ),
                ),
                Spacer(),
                SizedBox(width: 48),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 7,
                    ),
                    child: Container(
                      height: 106,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.secondary),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: Text(
                                'Strategies for turning obstacles into',
                                style: getTextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.primaryBackground,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: Text(
                                'opportunities...',
                                style: getTextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.primaryBackground,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 16,
                                  backgroundImage: AssetImage(
                                    ImagePath.container2,
                                  ),
                                ),
                                SizedBox(width: 12),
                                Text(
                                  'Winston Churchill',
                                  style: getTextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.subtextcolor2,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
