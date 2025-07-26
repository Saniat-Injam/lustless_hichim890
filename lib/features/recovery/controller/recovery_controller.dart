import 'package:get/get.dart';

class RecoveryController extends GetxController {
  // Observable progress percentage (0.0 to 1.0)
  var progress = 0.21.obs;
  var date = 10.obs;
  var targetDate = 'July 10,2025'.obs;
  RxDouble improvedconfidence = 0.50.obs;
  RxDouble mentalclarity = 0.50.obs;
  RxDouble labido = 0.50.obs;

  // Method to update the progress dynamically
  void updateProgress(double newProgress) {
    progress.value = newProgress;
  }

  void updateDate(int newDate) {
    date.value = newDate;
  }

  void updateTargetDate(String newTargetDate) {
    targetDate.value = newTargetDate;
  }
}
