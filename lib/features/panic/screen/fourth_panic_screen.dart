import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/utils/constants/icon_path.dart';
import 'package:lustless_hichim890/features/panic/screen/new_life_panic_screen.dart';

class FourthPanicScreen extends StatelessWidget {
  const FourthPanicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 90,),
         Image.asset(IconPath.watch,width:37 ,height: 37,
         fit: BoxFit.cover,),
         SizedBox(height: 25,),
         Text('The 90-Day Reset',style: getTextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: Color(0xffFFFFFF)
         ),),
         SizedBox(height: 25,),
         Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           Text('Research Shows It Takes About 90',style: getTextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xffFFFFFF)
           ),),
           SizedBox(height: 20,),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 16),
             child: Text('Days For Your Brain Chemistry to Significantly',style: getTextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color(0xffFFFFFF)
             ),),
           ),
             SizedBox(height: 20,),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 16),
             child: Text('Rebalance After Stopping Addictive Behavior',style: getTextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color(0xffFFFFFF)
             ),),
           ),
           
         
          ],
         ),
         SizedBox(height: 25,),
         Padding(
           padding: EdgeInsets.symmetric(horizontal: 45),
           child: InkWell(
            onTap:(){
              Get.off(()=>NewLifePanicScreen());
            },
             child: Container(
              width:double.infinity ,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xff071123),
                border: Border.all(color: Color(0xff133663),width: 1)
              ),
              child: Center(
                child: Text('Motivations',style: getTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffFFFFFF)
                ),),
              ),
             ),
           ),
         )
 
      ],
    );
  }
}