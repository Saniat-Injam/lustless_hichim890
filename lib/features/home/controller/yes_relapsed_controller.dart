import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YesRelapsedController extends GetxController {
  var levelText = 'Level 1'.obs;
  var daysText  = '0 DAYS'.obs;

  /// প্রত্যেক সপ্তাহের বার-এর রঙ ধরে রাখতে RxList
  /// সূচী: 0=Mon,1=Tue,...6=Sun
  var dayBarColors = <Color>[
    const Color(0xffFFFFFF),
    const Color(0xffFFFFFF),
    const Color(0xff133663),
    const Color(0xff133663),
    const Color(0xff133663),
    const Color(0xff133663),
    const Color(0xff133663),
  ].obs;

  /// নির্দিষ্ট দিন (index)-এর রঙ বদলাও
  void setDayColor(int index, Color color) {
    if (index >= 0 && index < dayBarColors.length) {
      dayBarColors[index] = color;
      dayBarColors.refresh();           // লিস্ট আপডেট টিগার করতে
    }
  }
}
