import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/utils/constants/icon_path.dart';
import 'package:lustless_hichim890/features/question_page/screen/question_page.dart';
import 'package:lustless_hichim890/features/splasho_screen/screen/splasho_screen.dart';

class OnbordingScreen extends StatelessWidget {
  final PageController pageController = PageController();
  final PageControllerController controller = Get.put(
    PageControllerController(),
  );
  OnbordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              controller.changePage(index);
              if (index == 3) {
                Future.delayed(Duration(milliseconds: 1000), () {
                  Get.to(
                    SplashoScreen(),
                    transition: Transition.rightToLeft,
                    duration: Duration(seconds: 1),
                  );
                });
              }
            },
            children: [Page1(), Page2(), Page3()],
          ),
          SizedBox(height: 40),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Get.offAll(
                            QuestionPage(),
                            transition: Transition.rightToLeft,
                          );
                        },

                        child: Container(
                          width: 60,
                          height: 27,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(width: 1, color: Colors.white),
                          ),
                          child: Center(
                            child: Text(
                              'Skip',
                              style: getTextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          Positioned(
            bottom: 32,
            left: 20,
            right: 20,
            child: Row(
              children: [
                Obx(() {
                  return Row(
                    children: List.generate(
                      3,
                      (index) => AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        height: 8,
                        width: controller.currentPage.value == index ? 40 : 8,
                        decoration: BoxDecoration(
                          color:
                              controller.currentPage.value == index
                                  ? Color(0xff5B9EE1)
                                  : Color(0xFFE5EEF7),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  );
                }),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    if (controller.currentPage.value < 2) {
                      pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Get.offAll(QuestionPage());
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    decoration: BoxDecoration(
                      color: Color(0xff133663),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text(
                        "Get started",
                        style: getTextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PageControllerController extends GetxController {
  var currentPage = 0.obs;
  var isOnLastPage = false.obs;
  void changePage(int index) {
    currentPage.value = index;
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFD9D9D9),
        image: DecorationImage(
          image: AssetImage(IconPath.onbording01),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 120.0,
                left: 20,
                right: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Every clean day',
                    style: GoogleFonts.nunito(
                      fontSize: 42,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'rewires your brain.',
                    style: GoogleFonts.nunito(
                      fontSize: 41,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 14),
                  Text(
                    'Lustless helps track your neuroplasticity',
                    style: getTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 13),
                  Text(
                    'Progress with clinically-proven methods.',
                    style: getTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFD9D9D9),
        image: DecorationImage(
          image: AssetImage(IconPath.onbording02),
          fit: BoxFit.cover,
        ),
      ),

      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 130.0,
                left: 20,
                right: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recovery isn\'t about perfection.',
                    style: GoogleFonts.nunito(
                      fontSize: 41,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'it\'s about progress. We\'ll celebrate every',
                    style: getTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 13),
                  Text(
                    'clean day together..',
                    style: getTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFD9D9D9),
        image: DecorationImage(
          image: AssetImage(IconPath.onbording03),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 130.0,
                left: 20,
                right: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Future Self\n Thanks You',
                    style: GoogleFonts.nunito(
                      fontSize: 41,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '30 days from now, you could have better',
                    style: getTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 13),
                  Text(
                    'focus, sleep, and confidence',
                    style: getTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
