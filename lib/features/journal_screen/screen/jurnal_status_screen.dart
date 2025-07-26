import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/common/widgets/custom_alignment_widget.dart';
import 'package:lustless_hichim890/core/common/widgets/custom_button.dart';
import 'package:lustless_hichim890/core/common/widgets/custom_color.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/core/utils/constants/icon_path.dart';
import 'package:lustless_hichim890/features/journal_screen/controller/journal_status_controller.dart';

class JurnalStatusScreen extends StatelessWidget {
  JurnalStatusScreen({super.key});
  final JournalStatusController journalStatusController = Get.put(
    JournalStatusController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 70),
        decoration: BoxDecoration(gradient: getContainerGradient()),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Journal",
                      style: getTextStylenunito(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textWhite,
                      ),
                    ),
                    Spacer(),
                    SizedBox(width: 48),
                  ],
                ),
                SizedBox(height: 28),
                GestureDetector(
                  onTap: () => journalStatusController.selectDate(context),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage(IconPath.calendar),
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(width: 8),
                      Obx(() {
                        return Text(
                          journalStatusController.selectedDate.value,
                          style: getTextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffFFFFFF),
                          ),
                        );
                      }),
                      SizedBox(width: 8),
                      Image(
                        image: AssetImage(IconPath.arrowdown),
                        width: 24,
                        height: 24,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    border: Border.all(width: 1, color: AppColors.secondary),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        CustomAlignmentWidget(
                          alignment: Alignment.centerLeft,
                          text: "Mood",
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textWhite,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Obx(
                                () => Slider(
                                  value:
                                      journalStatusController
                                          .moodSliderValue
                                          .value,
                                  min: 0.0,
                                  max: 1.0,
                                  divisions: 5,
                                  activeColor: AppColors.textfieldBorderColors,
                                  inactiveColor: Colors.white,
                                  onChanged: (value) {
                                    journalStatusController.updateMood(value);
                                  },
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Obx(() {
                                  final emoji =
                                      journalStatusController
                                          .moodList[journalStatusController
                                          .moodList
                                          .indexWhere(
                                            (e) =>
                                                e['label'] ==
                                                journalStatusController
                                                    .selectedMood
                                                    .value,
                                          )]['emoji'];
                                  return Text(
                                    emoji,
                                    style: TextStyle(fontSize: 13),
                                  );
                                }),
                                SizedBox(height: 5),
                                Obx(() {
                                  return Text(
                                    journalStatusController.selectedMood.value,
                                    style: getTextStylenunito(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textWhite,
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    border: Border.all(width: 1, color: AppColors.secondary),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        CustomAlignmentWidget(
                          alignment: Alignment.centerLeft,
                          text: "Urge",
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textWhite,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Obx(
                                () => Slider(
                                  value:
                                      journalStatusController
                                          .urgeSliderValue
                                          .value,
                                  min: 0.0,
                                  max: 1.0,
                                  divisions: 5,
                                  activeColor: Colors.red,
                                  inactiveColor: Colors.white,
                                  onChanged: (value) {
                                    journalStatusController.updateUrge(value);
                                  },
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Obx(() {
                                  final emoji =
                                      journalStatusController
                                          .moodList[journalStatusController
                                          .moodList
                                          .indexWhere(
                                            (e) =>
                                                e['label'] ==
                                                journalStatusController
                                                    .selectedUrge
                                                    .value,
                                          )]['emoji'];
                                  return Text(
                                    emoji,
                                    style: TextStyle(fontSize: 13),
                                  );
                                }),
                                SizedBox(height: 5),
                                Obx(() {
                                  return Text(
                                    journalStatusController.selectedUrge.value,
                                    style: getTextStylenunito(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textWhite,
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 18),
                CustomAlignmentWidget(
                  alignment: Alignment.centerLeft,
                  text: "Note",
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textWhite,
                ),
                SizedBox(height: 12),
                TextFormField(
                  controller: journalStatusController.feelingController,
                  maxLines: 30,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'Lets start a new chapter',
                    hintStyle: getTextStyle(
                      fontSize: 14,
                      color: AppColors.textWhite,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.secondary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.secondary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: getTextStyle(fontSize: 14, color: AppColors.textWhite),
                ),
                SizedBox(height: 11),
                CustomButton(
                  title: "Save Journal",
                  onPress: () {
                    journalStatusController.createJournal(context);
                  },
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
