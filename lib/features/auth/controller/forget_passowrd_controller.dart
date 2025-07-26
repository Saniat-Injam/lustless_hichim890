import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

class ForgetPasswordController extends GetxController {
  TextEditingController pinController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  var isFormValid2 = false.obs;
  var timerSeconds = 300.obs; 
  var timerText = '5:00'.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    timerSeconds.value = 300; 
    updateTimerText();
    _timer?.cancel(); 
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timerSeconds.value > 0) {
        timerSeconds.value--;
        updateTimerText();
      } else {
        timer.cancel();
      }
    });
  }

  void restartTimer() {
    startTimer();
  }

  void updateTimerText() {
    int minutes = timerSeconds.value ~/ 60;
    int seconds = timerSeconds.value % 60;
    timerText.value = '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  void validateForm2() {
    isFormValid2.value = pinController.text.length == 4; 
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}