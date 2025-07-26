import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';

class MoodSlider extends StatelessWidget {
  final String moodtitle;
  final String moodText;
  final String moodImage;
  final RxDouble sliderValue;
  final Function(double) onSliderChanged;
  final Color? activeColor;
  final Color? inactiveColor;

  const MoodSlider({
    required this.moodtitle,
    required this.moodText,
    required this.moodImage,
    required this.sliderValue,
    required this.onSliderChanged,
    this.activeColor,
    this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;

    return Container(
      alignment: AlignmentDirectional.bottomStart,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xff071123),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 1, color: Color(0xff133663)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: Row(
                children: [
                  Text(
                    moodtitle,
                    style: getTextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                  Spacer(),
                  Image(
                    image: AssetImage(moodImage),
                    width: 25,
                    height: 25,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: screenWidth * 0.72,
                  alignment: Alignment.centerLeft,
                  child: Obx(() {
                    return Slider(
                      activeColor: activeColor,
                      inactiveColor: inactiveColor,
                      value: sliderValue.value,
                      min: 0.0,
                      max: 1.0,
                      onChanged: onSliderChanged,
                    );
                  }),
                ),
                Spacer(),
                Text(
                  moodText,
                  style: getTextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffFFFFFF),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
