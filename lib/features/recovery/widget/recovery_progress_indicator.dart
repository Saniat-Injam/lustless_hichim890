import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/features/recovery/controller/recovery_controller.dart';

class RecoveryProgressIndicator extends StatelessWidget {
  const RecoveryProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final RecoveryController recoveryController = Get.put(RecoveryController());

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 100),
      child: Obx(() {
        double progress = recoveryController.progress.value;
        int date = recoveryController.date.value;

        Color progressColor = Color(0xff29C85F);

        return CircularPercentIndicator(
          circularStrokeCap: CircularStrokeCap.round,
          radius: 90,
          lineWidth: 10,
          backgroundColor: Color(0xff1B1C38),
          progressColor: progressColor,
          animation: true,
          percent: progress,
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'RECOVERY',
                style: getTextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w300,
                  color: Color(0xffFFFFFF).withValues(alpha: 0.9),
                ),
              ),
              SizedBox(height: 15),
              Text(
                "${(progress * 100).toInt()}%",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 15),
              Text(
                '$date DAY STREAK',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
