import 'dart:async';

import 'package:get/get.dart';

class PanicController extends GetxController {
  var currentPage = 0.obs;

  void changePage(int index) {
    currentPage.value = index;
  }
  RxDouble imageSize = 160.0.obs;
  bool growing = true;

  @override
  void onInit() {
    super.onInit();
    _startBreathing();
  }

  void _startBreathing() {
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      if (growing) {
        imageSize.value += 1;
        if (imageSize.value >= 180) growing = false;
      } else {
        imageSize.value -= 1;
        if (imageSize.value <= 140) growing = true;
      }
    });
  }
}