import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/core/utils/constants/icon_path.dart';
import 'package:lustless_hichim890/features/community/controller/community_controller.dart';

class CustomCommunityWidget extends StatelessWidget {
  final String name;
  final String time;
  final String descriptionText;
  final int likeCount;
  final int index;
  final Function(int) onTap;
  final Function(int) onReplyTap;
  final bool isReply;

  CustomCommunityWidget({
    super.key,
    required this.name,
    required this.time,
    required this.descriptionText,
    required this.likeCount,
    required this.index,
    required this.onTap,
    required this.onReplyTap,
    this.isReply = false,
  });

  final CommunityController controller = Get.find<CommunityController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 11),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.communityback.withValues(alpha: .24),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      name.isNotEmpty ? name[0] : "S",
                      style: getTextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textWhite,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: getTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textWhite,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    time,
                    style: getTextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textWhite,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Container(
                height: 25,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  color: AppColors.communityback.withValues(alpha: .24),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      IconPath.communitylike,
                      width: 14,
                      height: 14,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 8),
                    Obx(() => Text(
                          "${controller.communityData[index]['likeCount']}",
                          style: getTextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textWhite,
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Text(
            descriptionText,
            style: getTextStyle(
              color: AppColors.textWhite,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.toggleLike(index);
                    },
                    child: Obx(
                      () => Image.asset(
                        controller.communityData[index]['isLiked'] ?? false
                            ? IconPath.lovelogo2
                            : IconPath.lovelogo,
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  GestureDetector(
                    onTap: () => onReplyTap(index),
                    child: Image.asset(
                      IconPath.commentlogo,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}