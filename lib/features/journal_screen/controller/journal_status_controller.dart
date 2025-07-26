import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lustless_hichim890/core/common/widgets/custom_button.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/core/utils/constants/icon_path.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/features/bottom_nav_ber/controller/bottom_nav_ber_controller.dart';
import 'package:lustless_hichim890/features/bottom_nav_ber/screen/bottom_navigation_ber.dart';
import 'package:lustless_hichim890/features/journal_screen/api_service/journal_create_service.dart';
import 'package:lustless_hichim890/features/journal_screen/widget/journelentry.dart';

import '../model/journal_post_model.dart';

class JournalStatusController extends GetxController {
  TextEditingController feelingController = TextEditingController();

  // UI states
  RxBool isMoodSelected = false.obs;
  RxBool isUrgueSelected = false.obs;
  RxBool isEditing = false.obs;
  late FocusNode focusNode;
  late TextEditingController textController;
  @override
  void onInit() {
    textController = TextEditingController(text: currentMessage.value);
    textController.addListener(() {
      currentMessage.value = textController.text;
    });
    super.onInit();
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }

  RxString selectedDate = "Select Date".obs;

  RxDouble moodSliderValue = 0.5.obs;
  RxString selectedMood = "Happy".obs;
  RxString moodEmoji = "😊".obs;

  RxDouble urgeSliderValue = 0.5.obs;
  RxString selectedUrge = "Happy".obs;
  RxString urgeEmoji = "😊".obs;

  RxString currentMessage = ''.obs;

  // Mood List
  final List<Map<String, dynamic>> moodList = [
    {'emoji': '😞', 'label': 'Sad'},
    {'emoji': '😐', 'label': 'Neutral'},
    {'emoji': '🙂', 'label': 'Content'},
    {'emoji': '😊', 'label': 'Happy'},
    {'emoji': '😁', 'label': 'Excited'},
  ];

  /// Mood slider update (Left to Right)
  void updateMood(double value) {
    moodSliderValue.value = value;
    if (value <= 0.2) {
      selectedMood.value = moodList[0]['label'];
      moodEmoji.value = moodList[0]['emoji'];
    } else if (value <= 0.4) {
      selectedMood.value = moodList[1]['label'];
      moodEmoji.value = moodList[1]['emoji'];
    } else if (value <= 0.6) {
      selectedMood.value = moodList[2]['label'];
      moodEmoji.value = moodList[2]['emoji'];
    } else if (value <= 0.8) {
      selectedMood.value = moodList[3]['label'];
      moodEmoji.value = moodList[3]['emoji'];
    } else {
      selectedMood.value = moodList[4]['label'];
      moodEmoji.value = moodList[4]['emoji'];
    }
  }

  /// Urge slider update (Right to Left)
  void updateUrge(double value) {
    urgeSliderValue.value = value;
    if (value >= 0.8) {
      selectedUrge.value = moodList[0]['label'];
      urgeEmoji.value = moodList[0]['emoji'];
    } else if (value >= 0.6) {
      selectedUrge.value = moodList[1]['label'];
      urgeEmoji.value = moodList[1]['emoji'];
    } else if (value >= 0.4) {
      selectedUrge.value = moodList[2]['label'];
      urgeEmoji.value = moodList[2]['emoji'];
    } else if (value >= 0.2) {
      selectedUrge.value = moodList[3]['label'];
      urgeEmoji.value = moodList[3]['emoji'];
    } else {
      selectedUrge.value = moodList[4]['label'];
      urgeEmoji.value = moodList[4]['emoji'];
    }
  }

  /// Toggle mood selected
  void toggleMood() {
    if (isMoodSelected.value) {
      isMoodSelected.value = false;
    } else {
      isMoodSelected.value = true;
      isUrgueSelected.value = false;
    }
  }

  /// Toggle urge selected
  void toggleUrge() {
    if (isUrgueSelected.value) {
      isUrgueSelected.value = false;
    } else {
      isUrgueSelected.value = true;
      isMoodSelected.value = false;
    }
  }

  /// Toggle editing state
  void toggleEditing() {
    isEditing.value = !isEditing.value;
  }

  /// Update message for edit
  void updateMessage(String message) {
    currentMessage.value = message;
  }

  /// Select a date
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      selectedDate.value = DateFormat('d MMM yy').format(picked);
    }
  }

  /// Sample Journal Entries
  var journalEntries = <JournalEntry>[
    JournalEntry(
      date: "28",
      day: "MON",
      time: "10:10 AM",
      message: "Feeling hopeful today and excited to start a new journey.",
    ),
    JournalEntry(
      date: "29",
      day: "TUE",
      time: "11:30 AM",
      message: "Challenging day, but learned something new at work!",
    ),
  ];

  Future<void> createJournal(BuildContext context) async {
    final journalEntry = JournalEntryModel(
      note: textController.text,
      date: selectedDate.value,
      mode: int.tryParse(selectedMood.value) ?? 0,
      urge: int.tryParse(selectedUrge.value) ?? 0,
    );

    final service = JournalService();

    try {
      final response = await service.createJournalEntry(journalEntry);
      print('successful journal created:  $response');
      showCongratulationsDialog(context);
    } catch (e) {
      print('Server Error: $e');
    }
  }

  /// Congrats Dialog
  void showCongratulationsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: EdgeInsets.all(20),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Image.asset(IconPath.closelogo, width: 24, height: 24),
                ),
              ),
              Image.asset(
                IconPath.congratulationslogo,
                width: 100,
                height: 100,
              ),
              SizedBox(height: 20),
              Text(
                "Congratulations!",
                style: getTextStylenunito(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Journaling helps track your progress",
                style: getTextStylenunito(fontSize: 16, color: Colors.white70),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              CustomButton(
                title: "Continue",
                onPress: () {
                  final BottomNavBerController controller = Get.put(
                    BottomNavBerController(),
                  );
                  controller.changeIndex(0);
                  Get.offAll(() => BottomNavbar());
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
