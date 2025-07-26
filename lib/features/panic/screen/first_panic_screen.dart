import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/utils/constants/image_path.dart';
import 'package:lustless_hichim890/features/panic/controller/paincontroller.dart';

class FirstPanicScreen extends StatelessWidget {
  const FirstPanicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PanicController());
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 20,),
       Text('Take a moment to breath',style: getTextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: Color(0xffFFFFFF),
       ),),
       SizedBox(height: 50,),
         Center(
          child: Obx(() => Image.asset(
                ImagePath.breath,
                width: controller.imageSize.value,
                height: controller.imageSize.value,
                fit: BoxFit.cover,
              )),
        ),
       SizedBox(height: 28,),
       Center(
        child: Text('Breath Out',style: getTextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: Color(0xffFFFFFF),
        ),),
       ),
       SizedBox(height: 26,),
       Padding(padding: EdgeInsets.symmetric(horizontal: 16),
       child: Text('Following your breath helps calm your mind',style: getTextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Color(0xffFFFFFF)
       ),),
       ),
        SizedBox(height: 26,),
        

      ],
    );
  }
}