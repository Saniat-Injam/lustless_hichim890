import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/common/widgets/custom_color.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/features/support/controller/support_controller.dart';
import 'package:lustless_hichim890/features/support/widget/question_answer_widget.dart';

class SupportScreen extends StatelessWidget {
  SupportScreen({super.key});

  final SupportController supportController = Get.put(SupportController());
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(gradient: getContainerGradient()),
        child: SafeArea(
          child: Column(
            children: [
              Text(
                'Support',
                style: getTextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryBackground,
                ),
              ),
              const SizedBox(height: 18),
              QustionAndAnswer(supportController: supportController),
              Divider(color: AppColors.secondary),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: textController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Type your message",
                          hintStyle: getTextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.hintColor,
                          ),
                          filled: true,
                          fillColor: AppColors.primary,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(80),
                            borderSide: BorderSide(color: AppColors.secondary),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(80),
                            borderSide: BorderSide(color: AppColors.secondary),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(80),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.send, color: Colors.white),
                      onPressed: () {
                        if (textController.text.trim().isNotEmpty) {
                          supportController.sendMessage(
                            textController.text.trim(),
                          );
                          textController.clear();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
