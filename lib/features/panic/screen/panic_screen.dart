import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/widgets/custom_color.dart';
import 'package:lustless_hichim890/features/panic/controller/paincontroller.dart';
import 'package:lustless_hichim890/features/panic/screen/first_panic_screen.dart';
import 'package:lustless_hichim890/features/panic/screen/fourth_panic_screen.dart';
import 'package:lustless_hichim890/features/panic/screen/second_panic_screen.dart';
import 'package:lustless_hichim890/features/panic/screen/third_panic_screen.dart';

class PanicScreen extends StatelessWidget {
  const PanicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PanicController controller = Get.put(PanicController());

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration:  BoxDecoration(
         gradient: getContainerGradient()
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),


              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) {
                    final bool isActive = controller.currentPage.value >= index;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        width: 49,
                        height: 8,
                        decoration: BoxDecoration(
                          color: isActive
                              ? Colors.white
                              : const Color(0xff071123),
                          border: isActive
                              ? null
                              : Border.all(
                                  color: const Color(0xff133663), width: 0.5),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    );
                  }),
                ),
              ),

              const SizedBox(height: 32),

              Expanded(
                child: PageView(
                  onPageChanged: controller.changePage,
                  children: const [
                    FirstPanicScreen(),
                    SecondPanicScreen(),
                    ThirdPanicScreen(),
                    FourthPanicScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
