import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/common/widgets/custom_color.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/core/utils/constants/icon_path.dart';
import 'package:lustless_hichim890/features/community/controller/community_controller.dart';
import 'package:lustless_hichim890/features/community/screen/community_reply_singlepage.dart';
import 'package:lustless_hichim890/features/community/widget/custom_community_widget.dart';

class CommunityScreen extends StatelessWidget {
  CommunityScreen({super.key});
  final CommunityController communityController = Get.put(
    CommunityController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(gradient: getContainerGradient()),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SizedBox(height: 40),
                Center(
                  child: Text(
                    "Community",
                    style: getTextStyle(
                      color: AppColors.textWhite,
                      fontSize: 28,
                    ),
                  ),
                ),
                SizedBox(height: 35),
                Expanded(
                  child: Obx(() {
                    if (communityController.isLoading.value) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.textWhite,
                        ),
                      );
                    }
                    if (communityController.errorMessage.isNotEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              communityController.errorMessage.value,
                              style: getTextStyle(
                                color: AppColors.textWhite,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                if (communityController.errorMessage.value
                                    .contains('log in')) {
                                  Get.offNamed('/login');
                                } else {
                                  communityController.fetchComments();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                              ),
                              child: Text(
                                communityController.errorMessage.value
                                        .contains('log in')
                                    ? 'Log In'
                                    : 'Retry',
                                style: getTextStyle(
                                  color: AppColors.textWhite,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return communityController.communityData.isEmpty
                        ? Center(
                            child: Text(
                              'No comments available',
                              style: getTextStyle(
                                color: AppColors.textWhite,
                                fontSize: 16,
                              ),
                            ),
                          )
                        : ListView.builder(
                            itemCount: communityController.communityData.length,
                            itemBuilder: (context, index) {
                              final data = communityController.communityData[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomCommunityWidget(
                                    name: data['name'],
                                    time: data['time'],
                                    descriptionText: data['descriptionText'],
                                    likeCount: data['likeCount'],
                                    index: index,
                                    onTap: (index) {
                                      communityController.toggleLike(index);
                                    },
                                    onReplyTap: (index) {
                                      communityController.selectComment(index);
                                      Get.to(() => CommunityReplySinglepage(commentIndex: index));
                                    },
                                  ),
                                  SizedBox(height: 10),
                                ],
                              );
                            },
                          );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100, right: 20),
          child: GestureDetector(
            onTap: () {
              communityController.communityCommentBottomSheet(context, 0);
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.primary,
                border: Border.all(width: 1, color: AppColors.secondary),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Image.asset(
                  IconPath.commentedit,
                  width: 24,
                  height: 24,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}