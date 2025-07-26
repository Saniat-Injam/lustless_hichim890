import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/common/widgets/custom_color.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/core/utils/constants/icon_path.dart';
import 'package:lustless_hichim890/features/distractiontools_screen/controller/distractiontools_controller.dart';
import 'package:lustless_hichim890/features/distractiontools_screen/widget/cutom_distraction_widget.dart';

class DistractionToolsScreen extends StatelessWidget {
  DistractionToolsScreen({super.key});
  final DistractiontoolsController controller = Get.put(
    DistractiontoolsController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: getContainerGradient()),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                ListTile(
                  leading: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(
                      IconPath.arrowleft,
                      width: 24,
                      height: 24,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Center(
                    child: Text(
                      "Distraction Tools",
                      style: getTextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textWhite,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Expanded(
                  child: Obx(() {
                    return ListView.builder(
                      itemCount: controller.distractions.length,
                      itemBuilder: (context, index) {
                        var distraction = controller.distractions[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: CustomDistractionWidget(
                            imagePath: distraction['imagePath'] ?? '',
                            title: distraction['title'] ?? '',
                            subtitle: distraction['subtitle'] ?? '',
                          ),
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
