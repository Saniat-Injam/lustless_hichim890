import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/core/utils/constants/image_path.dart';
import 'package:lustless_hichim890/features/ai_coach/controller/ai_coach_controller.dart';
import 'package:lustless_hichim890/features/ai_coach/widget/ai_coach_textfield.dart';

class AiCoachChat extends StatelessWidget {
  AiCoachChat({super.key});

  final CoachController controller = Get.put(CoachController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: size.height * 0.06, bottom: size.height * 0.08),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: AppColors.bodyColor),
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
                  "AI Coach",
                  style: getTextStyle(
                    color: Color(0xFFF1F2F6),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                SizedBox(width: 48),
              ],
            ),
            Expanded(
              child: Obx(
                () =>
                    controller.messages.isEmpty
                        ? Center(
                          child: Text(
                            "Hey, How can\nI help you defeat porn?",
                            style: getTextStyle(
                              color: AppColors.primaryBackground.withValues(
                                alpha: 58,
                              ),
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                        : ListView.builder(
                          padding: EdgeInsets.all(20),
                          itemCount: controller.messages.length,
                          itemBuilder: (context, index) {
                            final message = controller.messages[index];
                            return Row(
                              mainAxisAlignment:
                                  message.isUser
                                      ? MainAxisAlignment.end
                                      : MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ConstrainedBox(
                                  constraints: BoxConstraints(maxWidth: 250),
                                  child: Container(
                                    padding: EdgeInsets.all(12),
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    decoration: BoxDecoration(
                                      color:
                                          message.isUser
                                              ? AppColors.primary
                                              : Color(0xFF333E51),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft:
                                            message.isUser
                                                ? Radius.circular(10)
                                                : Radius.zero,
                                        bottomRight:
                                            message.isUser
                                                ? Radius.zero
                                                : Radius.circular(10),
                                      ),
                                    ),
                                    child: Text(
                                      message.text,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                if (message.isUser)
                                  CircleAvatar(
                                    radius: 12,
                                    backgroundImage: AssetImage(
                                      ImagePath.elipse,
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 25),
              child: AICoachTextField(
                controller: controller.messageController,
                suffix: Padding(
                  padding: EdgeInsets.only(right: 2),
                  child: IconButton(
                    onPressed: () {
                      controller.sendMessage();
                    },
                    icon: Icon(Icons.send, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
