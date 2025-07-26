import 'package:get/get.dart';
import 'package:lustless_hichim890/core/utils/constants/image_path.dart';

class SleepTrackingController extends GetxController {
  RxDouble moodValue = 0.0.obs;
  RxDouble sleepValue = 0.0.obs;
  RxList<int> selectedValue = <int>[].obs;

  final List<Map<String, String>> priorities = [
    {'text': 'Travel', 'image': ImagePath.priority1},
    {'text': 'Relax', 'image': ImagePath.priority2},
    {'text': 'Family', 'image': ImagePath.priority3},
    {'text': 'Friend', 'image': ImagePath.priority4},
    {'text': 'Partner', 'image': ImagePath.priority5},
    {'text': 'Learning', 'image': ImagePath.priority6},
    {'text': 'Travel', 'image': ImagePath.priority1},
    {'text': 'Relax', 'image': ImagePath.priority2},
    {'text': 'Family', 'image': ImagePath.priority3},
    {'text': 'Friend', 'image': ImagePath.priority4},
    {'text': 'Partner', 'image': ImagePath.priority5},
    {'text': 'Learning', 'image': ImagePath.priority6},
  ];

  void togglePriority(int index) {
    if (selectedValue.contains(index)) {
      selectedValue.remove(index);
    } else if (selectedValue.length < 3) {
      selectedValue.add(index);
    }
  }

  updateMoodValue(double value) {
    moodValue.value = value;
  }

  updateSleepValue(double value) {
    sleepValue.value = value;
  }

  String getMoodLabel() {
    if (moodValue.value <= 0.5) {
      return 'I Feel\n pretty good';
    } else {
      return 'I Feel\n Super Great';
    }
  }

  String getSleptLabel() {
    if (sleepValue.value <= 0.5) {
      return "Last night's slept\n pretty well";
    } else if (moodValue.value <= 0.8) {
      return "Last night's i had a\n Very good night";
    } else {
      return '';
    }
  }
}
