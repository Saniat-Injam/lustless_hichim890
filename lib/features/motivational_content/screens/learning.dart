import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/common/widgets/custom_color.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/features/motivational_content/screens/article.dart';
import 'package:lustless_hichim890/features/motivational_content/screens/quotes.dart';
import 'package:lustless_hichim890/features/motivational_content/screens/video.dart';

class Learning extends StatelessWidget {
  const Learning({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 63),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: getContainerGradient()),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 17, right: 17),
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
                    "Library",
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
              SizedBox(height: 19),
              InkWell(
                onTap: () {
                  Get.to(Article());
                },
                child: Container(
                  height: 54,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.secondary),
                  ),
                  child: Center(
                    child: Text(
                      'Articles',
                      style: getTextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryBackground,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(Video());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    height: 54,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.secondary),
                    ),
                    child: Center(
                      child: Text(
                        'Video',
                        style: getTextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryBackground,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(Quotes());
                },
                child: Container(
                  height: 54,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.secondary),
                  ),
                  child: Center(
                    child: Text(
                      'Quotes',
                      style: getTextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryBackground,
                      ),
                    ),
                  ),
                ),
              ),

              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(9),
                    ),
                    border: Border.all(width: 1, color: AppColors.secondary),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Leader Board",
                              style: getTextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primaryBackground,
                              ),
                            ),
                            Text(
                              "You Are #4.539",
                              style: getTextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryBackground,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(vertical: 0),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return ListTile(
                              minLeadingWidth: 8,
                              leading: Text(
                                '${index + 1}',
                                style: getTextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryBackground,
                                ),
                              ),
                              title: Text(
                                'User ${index + 1}',
                                style: getTextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryBackground,
                                ),
                              ),
                              trailing: Text(
                                '739.350d',
                                style: getTextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryBackground,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
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
