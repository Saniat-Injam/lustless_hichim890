import 'package:get/get.dart';
import 'package:lustless_hichim890/core/utils/constants/image_path.dart';

class MeditationController extends GetxController {
  var logoPath = ImagePath.thoughtsLogo.obs;
  var title = 'Cleanse Your Thoughts'.obs;
  var subtitle =
      'Reclaim your focus, clarity, and control through guided meditation and mindful habits.'
          .obs;

  void resetState() {
    logoPath.value = ImagePath.thoughtsLogo;
    title.value = 'Cleanse Your Thoughts';
    subtitle.value =
        'Reclaim your focus, clarity, and control through guided meditation and mindful habits.';
  }

  void startSequence() {
    resetState();
    Future.delayed(Duration(seconds: 5), () {
      logoPath.value = ImagePath.higherLogo;
      title.value = 'Break Free, Rise\nHigher';
      subtitle.value =
          'Leave destructive habits behind. Step into a calmer, stronger version of yourself.';
    });
    Future.delayed(Duration(seconds: 10), () {
      logoPath.value = ImagePath.illuminateLogo;
      title.value = 'Illuminate Your Path\nWithin';
      subtitle.value =
          'Escape digital distractions. Discover peace and purpose through daily meditation.';
    });
  }

  @override
  void onInit() {
    super.onInit();
    startSequence();
  }
}
