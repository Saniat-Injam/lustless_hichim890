import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';

class HRelapsedController extends GetxController {
  // RxString for reactive date management
  var selectedDate = "Select Date".obs;
  var sliderValue = 0.0.obs;
  var sliderValues = 0.0.obs;
  RxBool isBoredomSelected = false.obs;
  RxBool isStressSelected = false.obs;
  RxBool isLonelinessSelected = false.obs;
  RxBool isMoodSelected = false.obs;
  RxBool isFeelSelected = false.obs;
  RxBool isHurtSelected = false.obs;
  RxBool isBitternessSelected = false.obs;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
     
      String formattedDate = DateFormat('MM/dd/yyyy').format(picked);
      selectedDate.value = formattedDate; 
    }
  }
}
