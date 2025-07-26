import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/common/widgets/custom_color.dart';
import 'package:lustless_hichim890/core/utils/constants/icon_path.dart';
import 'package:lustless_hichim890/features/bottom_nav_ber/controller/bottom_nav_ber_controller.dart';
import 'package:lustless_hichim890/features/bottom_nav_ber/screen/bottom_navigation_ber.dart';
import 'package:lustless_hichim890/features/home/controller/h_relapsed_controller.dart';
import 'package:lustless_hichim890/features/home/widget/mood_slider.dart';

class HomeRelapesd extends StatelessWidget {
  final HRelapsedController _controller = Get.put(HRelapsedController());
  @override
  Widget build(BuildContext context) {
    TextEditingController noteController = TextEditingController();
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: screenHeight,
        decoration: BoxDecoration(gradient: getContainerGradient()),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.059),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Image(
                        image: AssetImage(IconPath.back),
                        width: 25,
                        height: 25,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.25),
                    Text(
                      'Relapse',
                      style: getTextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 28),
                Row(
                  children: [
                    Image(
                      image: AssetImage(IconPath.calendar),
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(width: 8),

                    Obx(() {
                      return Text(
                        _controller.selectedDate.value,
                        style: getTextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffFFFFFF),
                        ),
                      );
                    }),
                    SizedBox(width: 8),
                    GestureDetector(
                      onTap: () => _controller.selectDate(context),
                      child: Image(
                        image: AssetImage(IconPath.arrowdown),
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                MoodSlider(
                  activeColor: Color(0xff133663),
                  inactiveColor: Color(0xffFFFFFF),
                  moodText: 'Happy',
                  moodImage: IconPath.happy,
                  sliderValue: _controller.sliderValue,
                  onSliderChanged: (newValue) {
                    _controller.sliderValue.value = newValue;
                  },
                  moodtitle: 'Mood',
                ),
                SizedBox(height: 10),
                MoodSlider(
                  activeColor: Color(0xffF40000),
                  inactiveColor: Color(0xffFFFFFF),
                  moodText: 'Urge',
                  moodImage: IconPath.urgue,
                  sliderValue: _controller.sliderValues,
                  onSliderChanged: (newValue) {
                    _controller.sliderValues.value = newValue;
                  },
                  moodtitle: 'Urge',
                ),
                SizedBox(height: 20),
                Text(
                  'Triggers',
                  style: getTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffFFFFFF),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Obx(
                      () => InkWell(
                        onTap: () {
                          _controller.isBoredomSelected.value =
                              !_controller.isBoredomSelected.value;
                        },
                        child: Container(
                          width: screenWidth * 0.22,
                          height: 26,
                          decoration: BoxDecoration(
                            color:
                                _controller.isBoredomSelected.value
                                    ? Color(0xffE9FBFF)
                                    : Color(0xffF7E8FF),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Text(
                              'Boredom',
                              style: getTextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color:
                                    _controller.isBoredomSelected.value
                                        ? Color(0xff00668F)
                                        : Color(0xff8910D9),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Obx(
                      () => InkWell(
                        onTap: () {
                          _controller.isStressSelected.value =
                              !_controller.isStressSelected.value;
                        },
                        child: Container(
                          width: screenWidth * 0.18,
                          height: 26,
                          decoration: BoxDecoration(
                            color:
                                _controller.isStressSelected.value
                                    ? Color(0xffE9FBFF)
                                    : Color(0xffF7E8FF),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Text(
                              'Stress',
                              style: getTextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color:
                                    _controller.isBoredomSelected.value
                                        ? Color(0xff00668F)
                                        : Color(0xff8910D9),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Obx(
                      () => InkWell(
                        onTap: () {
                          _controller.isLonelinessSelected.value =
                              !_controller.isLonelinessSelected.value;
                        },
                        child: Container(
                          width: screenWidth * 0.25,
                          height: 26,
                          decoration: BoxDecoration(
                            color:
                                _controller.isLonelinessSelected.value
                                    ? Color(0xffE9FBFF)
                                    : Color(0xffF7E8FF),

                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Text(
                              'loneliness',
                              style: getTextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color:
                                    _controller.isLonelinessSelected.value
                                        ? Color(0xff00668F)
                                        : Color(0xff8910D9),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Obx(
                      () => InkWell(
                        onTap: () {
                          _controller.isMoodSelected.value =
                              !_controller.isMoodSelected.value;
                        },
                        child: Container(
                          width: screenWidth * 0.15,
                          height: 26,
                          decoration: BoxDecoration(
                            color:
                                _controller.isMoodSelected.value
                                    ? Color(0xffE9FBFF)
                                    : Color(0xffF7E8FF),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Text(
                              'Mood',
                              style: getTextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color:
                                    _controller.isMoodSelected.value
                                        ? Color(0xff00668F)
                                        : Color(0xff8910D9),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Obx(
                      () => InkWell(
                        onTap: () {
                          _controller.isFeelSelected.value =
                              !_controller.isFeelSelected.value;
                        },
                        child: Container(
                          width: screenWidth * 0.15,
                          height: 26,
                          decoration: BoxDecoration(
                            color:
                                _controller.isFeelSelected.value
                                    ? Color(0xffE9FBFF)
                                    : Color(0xffF7E8FF),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Text(
                              'Fear',
                              style: getTextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color:
                                    _controller.isFeelSelected.value
                                        ? Color(0xff00668F)
                                        : Color(0xff8910D9),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Obx(
                      () => InkWell(
                        onTap: () {
                          _controller.isHurtSelected.value =
                              !_controller.isHurtSelected.value;
                        },
                        child: Container(
                          width: screenWidth * 0.15,
                          height: 26,
                          decoration: BoxDecoration(
                            color:
                                _controller.isHurtSelected.value
                                    ? Color(0xffE9FBFF)
                                    : Color(0xffF7E8FF),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Text(
                              'Hurt',
                              style: getTextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color:
                                    _controller.isHurtSelected.value
                                        ? Color(0xff00668F)
                                        : Color(0xff8910D9),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Obx(
                      () => InkWell(
                        onTap: () {
                          _controller.isBitternessSelected.value =
                              !_controller.isBitternessSelected.value;
                        },
                        child: Container(
                          width: screenWidth * 0.25,
                          height: 26,
                          decoration: BoxDecoration(
                            color:
                                _controller.isBitternessSelected.value
                                    ? Color(0xffE9FBFF)
                                    : Color(0xffF7E8FF),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Text(
                              'Bitterness',
                              style: getTextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color:
                                    _controller.isBitternessSelected.value
                                        ? Color(0xff00668F)
                                        : Color(0xff8910D9),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 33),
                Text(
                  'Note',
                  style: getTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffFFFFFF),
                  ),
                ),
                SizedBox(height: 14),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: noteController,
                  maxLines: 6,
                  decoration: InputDecoration(
                    hintText: "Let's start a new chapter",
                    hintStyle: getTextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Color(0xff949494),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff133663),
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff133663),
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 27),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 31),
                  child: InkWell(
                    onTap: () {
                      final BottomNavBerController controller = Get.put(
                        BottomNavBerController(),
                      );
                      controller.changeIndex(0);
                      Get.offAll(() => BottomNavbar());
                      Future.delayed(Duration(milliseconds: 300), () {
                        Get.snackbar(
                          'Success',
                          'Relapse Entry Saved Successfully ! Stay Strong ',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Color(0xff071123),
                          colorText: Colors.white,
                        );
                      });
                    },
                    child: Container(
                      height: screenHeight * 0.080,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          'Get Stronger',
                          style: getTextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 28),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
