import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  late VideoPlayerController videoPlayerController;
  var isPlaying = false.obs;
  var isInitialized = false.obs;
  var currentPosition = "00:00".obs;
  var totalDuration = "00:00".obs;

  @override
  void onInit() {
    super.onInit();
    videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(
          'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
        ),
      )
      ..initialize().then((_) {
        isInitialized.value = true;
        update();
        _updateDuration();
        videoPlayerController.addListener(_updatePosition);
      });
  }

  void togglePlayPause() {
    if (isPlaying.value) {
      videoPlayerController.pause();
    } else {
      videoPlayerController.play();
    }
    isPlaying.value = !isPlaying.value;
  }

  void _updatePosition() {
    final position = videoPlayerController.value.position;
    currentPosition.value = _formatDuration(position);
    update();
  }

  void _updateDuration() {
    final duration = videoPlayerController.value.duration;
    totalDuration.value = _formatDuration(duration);
    update();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  void onClose() {
    videoPlayerController.removeListener(_updatePosition);
    videoPlayerController.dispose();
    super.onClose();
  }
}
