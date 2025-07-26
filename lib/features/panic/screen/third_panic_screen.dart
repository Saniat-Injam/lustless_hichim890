import 'package:flutter/material.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/utils/constants/icon_path.dart';

class ThirdPanicScreen extends StatelessWidget {
  const ThirdPanicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(height: 90,),
        Center(
          child: Image.asset(IconPath.trophy,width: 50,height: 50,fit: BoxFit.cover,),
        ),
        SizedBox(height: 11,),
        Text('Remember Your Why',style: getTextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: Color(0xffFFFFFF)
        ),),
        SizedBox(height: 29,),
        Center(
          child: Container(
            width: 60,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Color(0xffFFFFFF).withValues(alpha: 0.20)
            ),
            child: Center(child: Text('Hh',style: getTextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0xffFFFFFF)
            ),),),
          ),
          
        ),
        SizedBox(height: 23,),
        Text('Keep This Close To Your Heard When\n\n               Urge Strike',style:getTextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xffFFFFFF)
        ),)
      ],

    );
  }
}