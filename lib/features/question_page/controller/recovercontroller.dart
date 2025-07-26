import 'dart:async';

import 'package:get/get.dart';

import 'package:lustless_hichim890/features/question_page/screen/scoreboard.dart';

class RecoveryController extends GetxController {
  RxDouble progress = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    simulateLoadingProgress();
  }

  void simulateLoadingProgress() {
    Timer.periodic(Duration(milliseconds: 20), (timer) {
      if (progress.value >= 1.0) {
        timer.cancel();
        navigateToNextPage();
      } else {
        progress.value += 0.01;
      }
    });
  }

  void navigateToNextPage() {
    Get.to(Scoreboard());
  }
}
