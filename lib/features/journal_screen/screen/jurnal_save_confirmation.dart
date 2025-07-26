import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/common/widgets/custom_color.dart';
import 'package:lustless_hichim890/core/utils/constants/icon_path.dart';
import 'package:lustless_hichim890/core/utils/constants/image_path.dart';
import 'package:lustless_hichim890/features/journal_screen/controller/journal_status_controller.dart';
import 'package:lustless_hichim890/features/journal_screen/screen/journal_screen.dart';

class JurnalSaveConfirmation extends StatelessWidget {
  final String time;
  final String message;
  final JournalStatusController journalStatusController = Get.put(
    JournalStatusController(),
  );
  JurnalSaveConfirmation({
    super.key,
    required this.time,
    required this.message,
  }) {
    journalStatusController.updateMessage(message);
  }
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: getContainerGradient()),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(height: screenHeight * 0.2),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: Image.asset(
                          IconPath.arrowleft,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.2),
                    Text(
                      'Journal',
                      style: getTextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.010),
                Text(
                  journalStatusController.selectedDate.value,
                  style: getTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffFFFFFF),
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(
                      () => InkWell(
                        onTap: () {
                          journalStatusController.toggleMood();
                        },
                        child: Container(
                          width: screenWidth * 0.44,
                          height: screenHeight * 0.20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color:
                                journalStatusController.isMoodSelected.value
                                    ? Colors.red
                                    : Color(0xff071123),
                            border: Border.all(
                              width: 1,
                              color: Color(0xff133663),
                            ),
                            boxShadow: [BoxShadow(blurRadius: 5)],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage(ImagePath.happypicture),
                                width: 39,
                                height: 39,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 15),
                              Text(
                                'MOOD',
                                style: getTextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffFFFFFF),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 9),
                    Obx(
                      () => InkWell(
                        onTap: () {
                          journalStatusController.toggleUrge();
                        },
                        child: Container(
                          width: screenWidth * 0.44,
                          height: screenHeight * 0.20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color:
                                journalStatusController.isUrgueSelected.value
                                    ? Colors.red
                                    : Color(0xff071123),
                            border: Border.all(
                              width: 1,
                              color: Color(0xff133663),
                            ),
                            boxShadow: [BoxShadow(blurRadius: 5)],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage(ImagePath.urgue),
                                width: 39,
                                height: 39,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 15),
                              Text(
                                'URGUE',
                                style: getTextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffFFFFFF),
                                ),
                              ),
                              SizedBox(height: 19),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 19),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff071123),
                    border: Border.all(width: 1, color: Color(0xff133663)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 6),
                        Text(
                          time,
                          style: getTextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffA6A6A6),
                          ),
                        ),
                        SizedBox(height: 10),
                        Obx(() {
                          return journalStatusController.isEditing.value
                              ? TextField(
                                controller:
                                    journalStatusController.textController,
                                maxLines: 6,
                                autofocus: true,
                                style: getTextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffFFFFFF),
                                ),
                                decoration: InputDecoration(
                                  hintText: "Edit your message",
                                  hintStyle: getTextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffA6A6A6),
                                  ),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                ),
                                onEditingComplete: () {
                                  journalStatusController.toggleEditing();
                                  FocusScope.of(context).unfocus();
                                },
                              )
                              : Text(
                                journalStatusController.currentMessage.value,
                                style: getTextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffFFFFFF),
                                ),
                              );
                        }),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 200),
                Obx(
                  () => InkWell(
                    onTap: () {
                      if (journalStatusController.isEditing.value) {
                        // ✅ Save edited message
                        journalStatusController.updateMessage(
                          journalStatusController.currentMessage.value,
                        );

                        // ✅ Navigate to JournalScreen directly
                        Get.to(() => JournalScreen());
                      }

                      // Toggle editing mode (Edit <-> Save)
                      journalStatusController.toggleEditing();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 49,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xff071123),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (!journalStatusController.isEditing.value) ...[
                            Image(
                              image: AssetImage(IconPath.editicon),
                              width: 24,
                              height: 24,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 8),
                          ],
                          Text(
                            journalStatusController.isEditing.value
                                ? 'Save'
                                : 'Edit',
                            style: getTextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffFFFFFF),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 11),
                InkWell(
                  onTap: () {
                    Get.to(() => JournalScreen());
                  },
                  child: Container(
                    width: double.infinity,
                    height: 49,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xffBD0000),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage(IconPath.delete),
                          width: 16,
                          height: 20,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Delete',
                          style: getTextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
