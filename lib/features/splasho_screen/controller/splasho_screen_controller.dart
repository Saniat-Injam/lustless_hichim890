import 'dart:async';
import 'package:get/get.dart';
import 'package:lustless_hichim890/features/onboring_screen/screen/onborging_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lustless_hichim890/features/bottom_nav_ber/screen/bottom_navigation_ber.dart';

class SplashoScreenController extends GetxController {
  final RxBool showFirst = false.obs; 
  final RxBool showSecond = false.obs; 
  final RxBool showThird = false.obs; 

  @override
  void onInit() {
    startTextAnimation();
    navigateAfterDelay();
    super.onInit();
  }

  void startTextAnimation() {
    Timer(Duration(seconds: 1), () {
      showFirst.value = true;
    });
    Timer(Duration(seconds: 2), () {
      showSecond.value = true;
    });
    Timer(Duration(seconds: 3), () {
      showThird.value = true;
    });
  }

  void navigateAfterDelay() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('access_token');
    Future.delayed(Duration(seconds: 5), () {
      if (token != null) {
        Get.offAll(() => BottomNavbar());
      } else {
        Get.offAll(() => OnbordingScreen());
      }
    });
  }
}