import 'dart:async';
import 'package:get/get.dart';

class DistractionSinglePageController extends GetxController {
  late Timer _timer;
  final RxInt _timeRemaining = 30.obs;
  final RxBool _isRunning = false.obs;

  void startStopTimer() {
    if (_isRunning.value) {
      _timer.cancel();
      _isRunning.value = false;
    } else {
      // Reset timer to 30 seconds if it has reached 0
      if (_timeRemaining.value == 0) {
        _timeRemaining.value = 30;
      }
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (_timeRemaining.value > 0) {
          _timeRemaining.value--;
        } else {
          _timer.cancel();
          _isRunning.value = false;
        }
      });
      _isRunning.value = true;
    }
    update(); // Force UI update
  }

  @override
  void onClose() {
    if (_isRunning.value) {
      _timer.cancel();
    }
    super.onClose();
  }

  int get timeRemaining => _timeRemaining.value;
  bool get isRunning => _isRunning.value;
}
