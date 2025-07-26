import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/core/utils/constants/icon_path.dart';
import 'package:lustless_hichim890/core/utils/constants/image_path.dart';
import 'package:lustless_hichim890/features/ai_coach/screens/ai_coach_chat.dart';
import 'package:lustless_hichim890/features/auth/screen/signin_register_screen.dart';
import 'package:lustless_hichim890/features/distractiontools_screen/screen/distraction_tools_screen.dart';
import 'package:lustless_hichim890/features/home/controller/home_controller.dart';
import 'package:lustless_hichim890/features/home/controller/rotating_image_controller.dart';
import 'package:lustless_hichim890/features/home/screen/h_yes_relapsed.dart';
import 'package:lustless_hichim890/features/home/widget/icon_button_widget.dart';
import 'package:lustless_hichim890/features/home/widget/progress_section.dart';
import 'package:lustless_hichim890/features/journal_screen/screen/journal_screen.dart';
import 'package:lustless_hichim890/features/meditation/screen/meditation_screen.dart';
import 'package:lustless_hichim890/features/motivational_content/screens/learning.dart';
import 'package:lustless_hichim890/features/motivational_content/screens/quotes.dart';
import 'package:lustless_hichim890/features/panic/screen/panic_screen.dart';
import 'package:lustless_hichim890/features/privacy_first/screens/privacy_lock.dart';
import 'package:lustless_hichim890/features/sleep_tracking_mood_check/screens/mood_check.dart';
import 'package:lustless_hichim890/features/sleep_tracking_mood_check/screens/sleep_tracking.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    final RotatingImageController controller2 = Get.put(
      RotatingImageController(),
    );
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    controller.startTimer();

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          
          // gradient: getContainerGradient()
          image: DecorationImage(
            image: AssetImage(ImagePath.splashScreenbackground),
            fit: BoxFit.cover
          ), 
          
          
          ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80),
              Center(
                child: InkWell(
                  onTap: () {
                    Get.to(() => YesRelapsed());
                  },
                  child: AnimatedBuilder(
                    animation: controller2.rotationAnimation,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle:
                            controller2.rotationAnimation.value * 2 * 3.14159,
                        child: Container(
                          width: 163,
                          height: 163,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/home.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 31),
              Center(
                child: Text(
                  "You've been porn -free for:",
                  style: getTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffFFFFFF),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => Text(
                      controller.dayValue.toString(),
                      style: getTextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Text(
                    'Days',
                    style: getTextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Center(
                child: Container(
                  width: 180,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Color(0xff071123),
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: Color(0xff133663)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(
                        () => Text(
                          controller.formattedTime,
                          style: getTextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Column(
                      //   children: [
                      //     InkWell(
                      //       onTap: () {
                      //         Get.to(HomeCheckIn());
                      //       },
                      //       child: Image(
                      //         image: AssetImage(IconPath.checkin),
                      //         width: 23,
                      //         height: 23,
                      //       ),
                      //     ),
                      //     SizedBox(height: 23),
                      //     Text(
                      //       'Check - in',
                      //       style: getTextStyle(
                      //         fontSize: 18,
                      //         fontWeight: FontWeight.w500,
                      //         color: Color(0xffFFFFFF),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      IconButtonWidget(
                        image: IconPath.meditationlogo,
                        title: 'Meditation',
                        onTap: () {
                          Get.to(MeditationScreen());
                        },
                      ),
                      SizedBox(width: 10),
                      IconButtonWidget(
                        image: IconPath.journalLogo,
                        title: 'Journal',
                        onTap: () {
                          Get.to(JournalScreen());
                        },
                      ),
                      SizedBox(width: 10),
                      IconButtonWidget(
                        image: IconPath.helpNowLogo,
                        title: 'Help Now',
                        onTap: () {
                          Get.to(DistractionToolsScreen());
                        },
                      ),
                      SizedBox(width: 10),
                      IconButtonWidget(
                        image: IconPath.quotesLogo,
                        title: 'Quotes',
                        onTap: () {
                          Get.to(Quotes());
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 35),
              ProgressSection(controller: controller),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: InkWell(
                  onTap: () {
                    Get.off(() => PanicScreen());
                  },
                  child: Container(
                    width: double.infinity,
                    height: 57,
                    decoration: BoxDecoration(
                      color: Color(0xff89090B).withValues(alpha: 0.20),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xff7C003C), width: 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          IconPath.panic,
                          width: 24,
                          height: 24,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Panic Button',
                          style: getTextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(blurRadius: 20)],
                    color: Color(0xff071123),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xff133663), width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() {
                          return Image(
                            image: AssetImage(
                              controller.isMotivationSaved.value
                                  ? IconPath.cotaionlogo
                                  : IconPath.emoji,
                            ),
                            width: 35,
                            height: 35,
                          );
                        }),
                        SizedBox(width: 7),
                        Flexible(
                          flex: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "What's your motivations?",
                                style: getTextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffFFFFFF),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 15),
                              Text(
                                'tell us why you want to quit porn',
                                style: getTextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffFFFFFF),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 60),
                        Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            width: 35,
                            height: 35,
                            child: GestureDetector(
                              onTap: () {
                                controller.whatMotivatesYou(context, 0);
                              },
                              child: Obx(() {
                                return Image(
                                  image: AssetImage(
                                    controller.isMotivationSaved.value
                                        ? IconPath.motivationedit
                                        : IconPath.rightarrows,
                                  ),
                                  fit: BoxFit.contain,
                                );
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 13),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(SleepTracking());
                      },
                      child: Container(
                        width: screenWidth * 0.45,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff071123),
                          border: Border.all(
                            color: Color(0xff133663),
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage(ImagePath.sleeptracking),
                                width: 41,
                                height: 41,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: screenHeight * 0.035),
                              Text(
                                'Sleep Tracking',
                                style: getTextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xffFFFFFF),
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.022),
                              Obx(
                                () => Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  child: LinearProgressIndicator(
                                    borderRadius: BorderRadius.circular(10),
                                    value: controller.progressDecimal.value,
                                    backgroundColor: Color(0xff133663),
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Color(0xff357BE1),
                                    ),
                                    minHeight: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 9),
                    InkWell(
                      onTap: () {
                        Get.to(MoodCheck());
                      },
                      child: Container(
                        width: screenWidth * 0.45,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff071123),
                          border: Border.all(
                            color: Color(0xff133663),
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage(ImagePath.moodcheck),
                                width: 41,
                                height: 41,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: screenHeight * 0.035),
                              Text(
                                'Mode Check',
                                style: getTextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xffFFFFFF),
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.022),
                              Obx(
                                () => Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  child: LinearProgressIndicator(
                                    borderRadius: BorderRadius.circular(10),
                                    value: controller.progressDecimal.value,
                                    backgroundColor: Color(0xff133663),
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Color(0xff357BE1),
                                    ),
                                    minHeight: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff071123),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Color(0xff133663)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 17),
                        Text(
                          'Main',
                          style: getTextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffAAAAAA),
                          ),
                        ),
                        SizedBox(height: 15),
                        InkWell(
                          onTap: () {
                            Get.to(Learning());
                          },
                          child: Row(
                            children: [
                              Image(
                                image: AssetImage(IconPath.learn),
                                width: 31,
                                height: 31,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 18),
                              Text(
                                'Learn',
                                style: getTextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffFFFFFF),
                                ),
                              ),
                              Spacer(),
                              Image(
                                image: AssetImage(IconPath.arrowNext),
                                width: 24,
                                height: 32,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 7),
                        Divider(
                          color: Color(0xffFFFFFF).withValues(alpha: 0.28),
                          height: 0.5,
                          indent: 40,
                          endIndent: 15,
                        ),
                        SizedBox(height: 15),
                        InkWell(
                          onTap: () {
                            Get.to(PrivacyLock());
                          },
                          child: Row(
                            children: [
                              Image(
                                image: AssetImage(IconPath.privacylock),
                                width: 31,
                                height: 31,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 18),
                              Text(
                                'Privacy',
                                style: getTextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffFFFFFF),
                                ),
                              ),
                              Spacer(),
                              Image(
                                image: AssetImage(IconPath.arrowNext),
                                width: 24,
                                height: 32,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 7),
                        Divider(
                          color: Color(0xffFFFFFF).withValues(alpha: 0.28),
                          height: 0.5,
                          indent: 40,
                          endIndent: 15,
                        ),
                        SizedBox(height: 15),
                        InkWell(
                          onTap: () {
                            Get.to(AiCoachChat());
                          },
                          child: Row(
                            children: [
                              Image(
                                image: AssetImage(IconPath.aicoach),
                                width: 31,
                                height: 31,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 18),
                              Text(
                                'AI Coach',
                                style: getTextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffFFFFFF),
                                ),
                              ),
                              Spacer(),
                              Image(
                                image: AssetImage(IconPath.arrowNext),
                                width: 24,
                                height: 32,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 7),
                        Divider(
                          color: Color(0xffFFFFFF).withValues(alpha: 0.28),
                          height: 0.5,
                          indent: 40,
                          endIndent: 15,
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(14),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff89090B).withValues(alpha: 0.20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: BorderSide(color: Color(0xff7C003C)),

                    minimumSize: Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    Get.offAll(() => SigninRegisterScreen());
                  },
                  child: Text(
                    "Log Out",
                    style: getTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryBackground,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
