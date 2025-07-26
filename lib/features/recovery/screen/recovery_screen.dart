import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/widgets/custom_color.dart';
import 'package:lustless_hichim890/features/recovery/controller/recovery_controller.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/features/recovery/widget/recovery_progress_indicator.dart';

class RecoveryScreen extends StatelessWidget {
  const RecoveryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final RecoveryController recoveryController = Get.put(RecoveryController());
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: getContainerGradient()),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.1),
                Center(
                  child: Text(
                    'Recovery',
                    style: getTextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                RecoveryProgressIndicator(),
                SizedBox(
                  height: screenHeight * 0.07,
                  width: screenWidth * 0.04,
                ),
                Column(
                  children: [
                    Text(
                      "You've crossed the halfway point to 30 days",
                      style: getTextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'The brain is beginning to rewire itself.Embrace',
                      style: getTextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "the clarity and energy that's starting to return",
                      style: getTextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 27),
                Center(
                  child: Text(
                    "You're on track to:",
                    style: getTextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
                Center(
                  child: Container(
                    height: screenHeight * 0.07,
                    width: screenWidth * 0.80,
                    decoration: BoxDecoration(
                      color: Color(0xff071123),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Color(0xff133663), width: 1),
                    ),
                    child: Center(
                      child: Obx(() {
                        return Text(
                          'Quit porn by ${recoveryController.targetDate.value}',
                          style: getTextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffFFFFFF),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                SizedBox(height: 31),
                Container(
                  width: double.infinity,

                  decoration: BoxDecoration(
                    color: Color(0xff071123),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Color(0xff133663)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Improved Confidence',
                          style: getTextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "As you distance yourself from porn,you'll\n \n gradually notice improved confidence",
                          style: getTextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.04),
                        Obx(
                          () => LinearProgressIndicator(
                            borderRadius: BorderRadius.circular(10),
                            value: recoveryController.improvedconfidence.value,
                            backgroundColor: Color(0xff133663),
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color(0xff357BE1),
                            ),
                            minHeight: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 18),
                Container(
                  width: double.infinity,

                  decoration: BoxDecoration(
                    color: Color(0xff071123),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Color(0xff133663)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mental Clarity',
                          style: getTextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "After quiting porn, many people report a\n \n noticeable imporvement in mental clarity",
                          style: getTextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.04),
                        Obx(
                          () => LinearProgressIndicator(
                            borderRadius: BorderRadius.circular(10),
                            value: recoveryController.mentalclarity.value,
                            backgroundColor: Color(0xff133663),
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color(0xff357BE1),
                            ),
                            minHeight: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 18),
                Container(
                  width: double.infinity,

                  decoration: BoxDecoration(
                    color: Color(0xff071123),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Color(0xff133663)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Increased Libido ',
                          style: getTextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "As your body and mind recover,you may \n\n experience a healthier libido and improved\n\n sexual performance after around 30-45 days",
                          style: getTextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.04),
                        Obx(
                          () => LinearProgressIndicator(
                            borderRadius: BorderRadius.circular(10),
                            value: recoveryController.labido.value,
                            backgroundColor: Color(0xff133663),
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color(0xff357BE1),
                            ),
                            minHeight: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
