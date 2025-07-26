import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/utils/constants/icon_path.dart';
import 'package:lustless_hichim890/core/utils/constants/image_path.dart';
import 'package:lustless_hichim890/features/splasho_screen/controller/splasho_screen_controller.dart';

class SplashoScreen extends StatelessWidget {
  const SplashoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashoScreenController controller = Get.put(
      SplashoScreenController(),
    );

    return CupertinoPageScaffold(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImagePath.splashScreenbackground),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(IconPath.lustlesslogo, width: 160),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => AnimatedOpacity(
                        opacity: controller.showFirst.value ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 500),
                        child: Row(
                          children: [
                            Text(
                              'Destructive',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width < 320
                                        ? 13
                                        : 15,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.circle, color: Colors.white, size: 10),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Obx(
                      () => AnimatedOpacity(
                        opacity: controller.showSecond.value ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 500),
                        child: Row(
                          children: [
                            Text(
                              'Enslaving',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width < 320
                                        ? 13
                                        : 15,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.circle, color: Colors.white, size: 10),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Obx(
                      () => AnimatedOpacity(
                        opacity: controller.showThird.value ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 500),
                        child: Row(
                          children: [
                            Text(
                              'Corrosive',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width < 320
                                        ? 13
                                        : 15,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
