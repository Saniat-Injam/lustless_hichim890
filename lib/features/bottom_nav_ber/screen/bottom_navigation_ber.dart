import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/core/utils/constants/icon_path.dart';
import 'package:lustless_hichim890/features/ai_coach/screens/ai_coach_chat.dart' show AiCoachChat;
import 'package:lustless_hichim890/features/community/screen/community_screen.dart';
import 'package:lustless_hichim890/features/home/screen/home.dart';
import 'package:lustless_hichim890/features/recovery/screen/recovery_screen.dart';
import '../controller/bottom_nav_ber_controller.dart'
    show BottomNavBerController;

// ignore: must_be_immutable
class BottomNavbar extends StatelessWidget {
  BottomNavbar({super.key});

  String planName =
      Get.arguments != null ? Get.arguments as String : 'No plan selected';

  final BottomNavBerController controller = Get.put(BottomNavBerController());

  final List<Widget> pages = [
    Home(),
    RecoveryScreen(),
    CommunityScreen(),
    AiCoachChat(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: Obx(() => pages[controller.currentIndex.value]),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
          
              color: Colors.black.withValues(alpha: 0.2),
              spreadRadius: 2,
              blurRadius: 6,
              offset: Offset(0, -0),
            ),
          ],
          color: AppColors.primary,
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                passiveImage: IconPath.homedeactive,
                activeImage: IconPath.homeactive,
                index: 0,
                text: 'Home',
              ),
              _buildNavItem(
                passiveImage: IconPath.recoverydeactive,
                activeImage: IconPath.recoveryactive,
                index: 1,
                text: 'Recovery',
              ),
              _buildNavItem(
                passiveImage: IconPath.communitydeactive,
                activeImage: IconPath.communityactive,
                index: 2,
                text: 'Community',
              ),
              _buildNavItem(
                passiveImage: IconPath.aiCoachIcon,
                activeImage: IconPath.activeAICoach,
                index: 3,
                text: 'AI Coach',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required String activeImage,
    required String passiveImage,
    required int index,
    required String text,
  }) {
    return GestureDetector(
      onTap: () {
        controller.changeIndex(index);
      },
      child: Obx(() {
        final isSelected = controller.currentIndex.value == index;
        return SizedBox(
          height: 70,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12.0),
            child: Column(
              children: [
                Image.asset(
                  isSelected ? activeImage : passiveImage,
                  height: 24,
                  width: 24,
                  fit: BoxFit.contain,
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: AppColors.textWhite,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
