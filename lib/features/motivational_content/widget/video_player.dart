import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/common/widgets/custom_color.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/features/motivational_content/controller/video_controller.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatelessWidget {
  VideoPlayerScreen({super.key}) {
    Get.put(VideoController());
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<VideoController>();
    return Obx(
      () => Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 62),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(gradient: getContainerGradient()),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Video Player",
                      style: getTextStylenunito(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textWhite,
                      ),
                    ),
                    Spacer(),
                    SizedBox(width: 48),
                  ],
                ),
                Spacer(),
                controller.isInitialized.value
                    ? GestureDetector(
                      onTap: () {
                        controller.togglePlayPause();
                      },
                      child: AspectRatio(
                        aspectRatio:
                            controller.videoPlayerController.value.aspectRatio,
                        child: VideoPlayer(controller.videoPlayerController),
                      ),
                    )
                    : CircularProgressIndicator(),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: controller.togglePlayPause,
                        icon: Icon(
                          controller.isPlaying.value
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: AppColors.primaryBackground,
                          size: 32,
                        ),
                      ),
                      Expanded(
                        child: VideoProgressIndicator(
                          controller.videoPlayerController,
                          allowScrubbing: true,
                          colors: VideoProgressColors(
                            playedColor: AppColors.secondary,
                            bufferedColor: Colors.grey,
                            backgroundColor: Colors.white.withValues(
                              alpha: 0.3,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        controller.currentPosition.value,
                        style: TextStyle(
                          color: AppColors.primaryBackground,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        " / ",
                        style: TextStyle(
                          color: AppColors.primaryBackground,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        controller.totalDuration.value,
                        style: TextStyle(
                          color: AppColors.primaryBackground,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
