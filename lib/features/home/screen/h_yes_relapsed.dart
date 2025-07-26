import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/utils/constants/icon_path.dart';
import 'package:lustless_hichim890/core/utils/constants/image_path.dart';
import 'package:lustless_hichim890/features/home/controller/yes_relapsed_controller.dart';
import 'package:lustless_hichim890/features/home/screen/h_relapsed.dart';
import 'package:lustless_hichim890/features/home/widget/level_badge.dart';

class YesRelapsed extends StatelessWidget {
  const YesRelapsed({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(YesRelapsedController());
    const dayLabels = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagePath.relapsed),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 35, top: 50),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(
                      IconPath.back,
                      width: 26,
                      height: 24,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 120),
              const LevelBadge(),
              const SizedBox(height: 85),
              Divider(
                color: const Color(0xffFFFFFF).withAlpha(36),
                thickness: 1,
                endIndent: 40,
                indent: 40,
              ),
              const SizedBox(height: 55),
              Obx(
                () => Center(
                  child: Text(
                    controller.daysText.value,
                    style: getTextStyle(
                      fontSize: 49,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xffFFFFFF),
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  'SINCE LAST RELAPSE',
                  style: getTextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xffFFFFFF),
                  ),
                ),
              ),
              const SizedBox(height: 64),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Obx(
                  () => Row(
                    children: List.generate(dayLabels.length, (i) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Column(
                          children: [
                            Container(
                              width: 40,
                              height: 5,
                              decoration: BoxDecoration(
                                color: controller.dayBarColors[i],
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              dayLabels[i],
                              style: getTextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff133663),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(height: 66),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: InkWell(
                  onTap: () {
                    Get.to(() => HomeRelapesd());
                  },
                  child: Container(
                    width: double.infinity,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Relapse',
                          style: getTextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff071123),
                          ),
                        ),
                        SizedBox(width: 10),
                        Image(
                          image: AssetImage(IconPath.relapsedemoji),
                          width: 24,
                          height: 24,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 55),
            ],
          ),
        ),
      ),
    );
  }
}
