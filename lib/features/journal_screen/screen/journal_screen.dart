import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/common/widgets/custom_color.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/core/utils/constants/icon_path.dart';
import 'package:lustless_hichim890/features/journal_screen/controller/journal_status_controller.dart';
import 'package:lustless_hichim890/features/journal_screen/screen/jurnal_save_confirmation.dart';
import 'package:lustless_hichim890/features/journal_screen/screen/jurnal_status_screen.dart';

class JournalScreen extends StatelessWidget {
  JournalScreen({super.key});

  final JournalStatusController controller = Get.put(JournalStatusController());

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 70),
        decoration: BoxDecoration(gradient: getContainerGradient()),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.white, size: 24),
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
            SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                height: 380,
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    final entry = controller.journalEntries[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15, right: 5),
                      child: InkWell(
                        onTap: () {
                          Get.to(
                            JurnalSaveConfirmation(
                              time: entry.time,
                              message: entry.message,
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),

                            border: Border.all(
                              width: 1,
                              color: AppColors.secondary,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: screenWidth * 0.17,
                                  child: Text(
                                    "${entry.date}\n${entry.day}",
                                    style: getTextStylenunito(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textWhite,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Container(
                                  padding: EdgeInsets.all(12),

                                  width: screenWidth * 0.68,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppColors.secondary,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            entry.time,
                                            style: getTextStylenunito(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.textWhite,
                                            ),
                                          ),
                                          Spacer(),
                                          Image.asset(
                                            IconPath.happyemoji,
                                            width: 13,
                                            height: 13,
                                          ),
                                          SizedBox(width: 10),
                                          Image.asset(
                                            IconPath.sademoji,
                                            width: 13,
                                            height: 13,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        entry.message,
                                        style: getTextStylenunito(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.textWhite,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            SizedBox(height: 10),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () {
          Get.to(JurnalStatusScreen());
        },
        child: Image.asset(
          IconPath.journallogo,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
