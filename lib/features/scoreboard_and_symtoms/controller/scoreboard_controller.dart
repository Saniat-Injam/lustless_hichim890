import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScoreboardController extends GetxController {
  RxInt selectedMentalSection = 0.obs;

  void toggleMental(int? value) {
    if (value != null) {
      if (selectedMentalSection.value == value) {
        selectedMentalSection.value = -1;
      } else {
        selectedMentalSection.value = value;
      }
      return;
    }
  }

  RxInt selectedPhysicalSection = 0.obs;

  void togglePhysical(int? value) {
    if (value != null) {
      if (selectedPhysicalSection.value == value) {
        selectedPhysicalSection.value = -1;
      } else {
        selectedPhysicalSection.value = value;
      }
      return;
    }
  }

  RxInt selectedSocialSection = 0.obs;

  void toggleSocial(int? value) {
    if (value != null) {
      if (selectedSocialSection.value == value) {
        selectedSocialSection.value = -1;
      } else {
        selectedSocialSection.value = value;
      }
      return;
    }
  }

  RxInt selectedFaithSection = 0.obs;

  void toggleFaith(int? value) {
    if (value != null) {
      if (selectedFaithSection.value == value) {
        selectedFaithSection.value = -1;
      } else {
        selectedFaithSection.value = value;
      }
      return;
    }
  }

  RxBool selectedValue = false.obs;
  void checkFaith() {
    selectedValue.value = !selectedValue.value;
  }

  RxInt selectedGoal = 0.obs;

  void toggleButton(int? value) {
    if (value != null) {
      selectedGoal.value = value;
    }
  }

  final PageController controller = PageController();

  var currentPage = 0.obs;
  void goToNextPage() {
    controller.nextPage(
      duration: Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  final PageController controllerTwo = PageController();

  var currentPageTwo = 0.obs;
  void goToNextPageTwo() {
    controllerTwo.nextPage(
      duration: Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
  }

  void onPageChangedTwo(int index) {
    currentPageTwo.value = index;
  }
}
