import 'package:flutter/material.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/utils/constants/icon_path.dart';

class SecondPanicScreen extends StatelessWidget {
  const SecondPanicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(

    
      children: [
       SizedBox(height: 150,),
        Center(
          child: Image.asset(IconPath.quotation,width:25 ,height: 25,fit: BoxFit.cover,),
        ),
        SizedBox(height: 30,),
        Padding(padding: EdgeInsets.symmetric(horizontal: 19),
        child: Text('Choose The Path of Discipline\n  Its The Bridge That Connects\n      your Dreams to Reality',style: getTextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: Color(0xffFFFFFF)
        ),),
        ),
        SizedBox(height: 26,),
        Center(
          child: Text('wisdom foe your journey',style: getTextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xffFFFFFF),
          ),),
        )


      ],
    );
  }
}