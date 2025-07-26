import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/common/widgets/custom_color.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/core/utils/constants/icon_path.dart';
import 'package:lustless_hichim890/features/community/controller/community_controller.dart';
import 'package:lustless_hichim890/features/community/widget/custom_community_widget.dart';
import 'package:lustless_hichim890/features/community/widget/custom_single_comment_widget.dart';

class CommunityReplySinglepage extends StatelessWidget {
  final int commentIndex;

  const CommunityReplySinglepage({super.key, required this.commentIndex});

  @override
  Widget build(BuildContext context) {
    final CommunityController communityController = Get.find();

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
                Obx(() {
                  if (commentIndex < 0 ||
                      commentIndex >=
                          communityController.communityData.length) {
                    return Center(
                      child: Text(
                        'No comment selected',
                        style: getTextStyle(
                          color: AppColors.textWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }
                  var comment = communityController.communityData[commentIndex];
                  return CustomCommunityWidget(
                    name: comment['name'] ?? 'No name',
                    time: comment['time'] ?? 'No time',
                    descriptionText:
                        comment['descriptionText'] ?? 'No description',
                    likeCount: comment['likeCount'] ?? 0,
                    index: commentIndex,
                    onTap: (index) {
                      communityController.toggleLike(index);
                    },
                    onReplyTap: (index) {
                      communityController.communityReplyBottomSheet(
                        context,
                        index,
                      );
                    },
                  );
                }),
                SizedBox(height: 20),
                Obx(() {
                  if (commentIndex < 0 ||
                      commentIndex >=
                          communityController.communityData.length) {
                    return Center(
                      child: Text(
                        'No comment selected',
                        style: getTextStyle(
                          color: AppColors.textWhite,
                          fontSize: 16,
                        ),
                      ),
                    );
                  }
                  var replies =
                      (communityController
                              .communityData[commentIndex]['replies']
                          as List<dynamic>?) ??
                      [];
                  if (replies.isEmpty) {
                    return Center(
                      child: Text(
                        'No replies yet',
                        style: getTextStyle(
                          color: AppColors.textWhite,
                          fontSize: 16,
                        ),
                      ),
                    );
                  }
                  return Expanded(
                    child: ListView.builder(
                      itemCount: replies.length,
                      itemBuilder: (context, index) {
                        var reply = replies[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CustomSingleCommentWidget(
                              name: reply['name'],
                              time: reply['time'],
                              descriptionText: reply['descriptionText'],
                              index: commentIndex,
                              onTap: (index) {
                                communityController.toggleLike(index);
                              },
                              onReplyTap: (index) {
                                communityController.communityReplyBottomSheet(
                                  context,
                                  index,
                                );
                              },
                              isReply: true,
                            ),
                            if (index < replies.length - 1)
                              SizedBox(height: 10),
                          ],
                        );
                      },
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 25, right: 20),
          child: GestureDetector(
            onTap: () {
              if (commentIndex >= 0 &&
                  commentIndex < communityController.communityData.length) {
                communityController.communityReplyBottomSheet(
                  context,
                  commentIndex,
                );
              } else {
                Get.snackbar(
                  'Error',
                  'No comment selected to reply to',
                  backgroundColor: AppColors.secondary,
                  colorText: AppColors.textWhite,
                );
              }
            },
            child: Container(
              width: 145,
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.primary,
                border: Border.all(width: 1, color: AppColors.secondary),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Row(
                  children: [
                    Image.asset(
                      IconPath.commentlogo,
                      width: 24,
                      height: 24,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 9),
                    Text(
                      "Comment",
                      style: getTextStylenunito(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textWhite,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
