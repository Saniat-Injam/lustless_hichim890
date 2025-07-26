import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/utils/constants/image_path.dart';
import 'package:lustless_hichim890/features/question_page/controller/recovercontroller.dart';

class RecoveryPlan extends StatelessWidget {
  const RecoveryPlan({super.key});

  @override
  Widget build(BuildContext context) {
    final RecoveryController recoveryController = Get.put(RecoveryController());

    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagePath.imageback),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.10),
                Center(
                  child: Container(
                    width: 98,
                    height: 98,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(ImagePath.analysis),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Text(
                  'Analysis complete',
                  style: getTextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffFFFFFF),
                  ),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 329),
                Text(
                  'Calculating Result',
                  style: getTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffFFFFFF),
                  ),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 18),

                Obx(() {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: LinearProgressIndicator(
                      value: recoveryController.progress.value,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xff4DBDFD),
                      ),
                      backgroundColor: Color(0xffFFFFFF).withValues(alpha: .20),
                      minHeight: 5,
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
