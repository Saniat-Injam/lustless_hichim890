import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/widgets/custom_color.dart';
import 'package:lustless_hichim890/features/bottom_nav_ber/screen/bottom_navigation_ber.dart';
import 'package:lustless_hichim890/features/meditation/controller/meditation_controller.dart';

class MeditationScreen extends StatelessWidget {
  const MeditationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MeditationController controller = Get.put(MeditationController());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.startSequence();
    });

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 40, left: 18, right: 18, bottom: 96),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(gradient: getContainerGradient()),
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(controller.logoPath.value, height: 102, width: 102),
                SizedBox(height: 32),
                Text(
                  controller.title.value,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 25),
                Text(
                  controller.subtitle.value,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    Get.to(() => BottomNavbar());
                  },
                  child: Text(
                    'Skip Test',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xFFCECECE),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
