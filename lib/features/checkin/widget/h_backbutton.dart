import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/utils/constants/icon_path.dart';
import 'package:lustless_hichim890/features/bottom_nav_ber/controller/bottom_nav_ber_controller.dart';
import 'package:lustless_hichim890/features/bottom_nav_ber/screen/bottom_navigation_ber.dart';
import 'package:lustless_hichim890/features/checkin/controller/h_checkincontroller.dart';

class HbackButtonSLiderRow extends StatelessWidget {
  final double sliderValue;
  final ValueChanged<double> onSliderChanged;
  final HCheckincontroller hCheckincontroller;
  const HbackButtonSLiderRow({
    super.key,
    required this.sliderValue,
    required this.onSliderChanged,
    required this.hCheckincontroller,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              if (hCheckincontroller.questionNumber > 1) {
                hCheckincontroller.questionNumber.value -= 1;
                hCheckincontroller.sliderValue.value =
                    hCheckincontroller.questionNumber.value.toDouble();
              }
              else{
       final BottomNavBerController controller = Get.put(BottomNavBerController());
  controller.changeIndex(0);
  Get.offAll(() => BottomNavbar());
              }
            },
            child: Image(
              image: AssetImage(IconPath.back),
              height: 15,
              width: 18,
            ),
          ),
          SizedBox(width: screenWidth * 0.1),
          Expanded(
            child: Slider(
              value: sliderValue,
              onChanged: onSliderChanged,
              min: 0.0,
              max: hCheckincontroller.question.length.toDouble() - 1,
              activeColor: Color(0xffFFFFFF),
              inactiveColor: Color(0xff1C1C1E),
              thumbColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
