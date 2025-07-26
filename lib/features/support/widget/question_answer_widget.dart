import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:lustless_hichim890/features/support/controller/support_controller.dart';

class QustionAndAnswer extends StatelessWidget {
  const QustionAndAnswer({super.key, required this.supportController});

  final SupportController supportController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          itemCount: supportController.messages.length,
          itemBuilder: (context, index) {
            final msg = supportController.messages[index];
            return Align(
              alignment:
                  msg.isMe ? Alignment.centerRight : Alignment.centerLeft,
              child: Column(
                crossAxisAlignment:
                    msg.isMe
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment:
                        msg.isMe
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (!msg.isMe)
                        CircleAvatar(
                          backgroundImage: NetworkImage(msg.avatarUrl),
                          radius: 16,
                        ),
                      if (!msg.isMe) const SizedBox(width: 8),
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color:
                                msg.isMe
                                    ? AppColors.primary
                                    : AppColors.primaryBackground,
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(18),
                              topRight: const Radius.circular(18),
                              bottomLeft: Radius.circular(msg.isMe ? 18 : 0),
                              bottomRight: Radius.circular(msg.isMe ? 0 : 18),
                            ),
                          ),
                          child: Text(
                            msg.text,
                            style: getTextStyle(
                              color:
                                  msg.isMe
                                      ? AppColors.primaryBackground
                                      : AppColors.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      if (msg.isMe) const SizedBox(width: 8),
                      if (msg.isMe)
                        CircleAvatar(
                          backgroundImage: NetworkImage(msg.avatarUrl),
                          radius: 16,
                        ),
                    ],
                  ),
                  if (msg.time != null)
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 48,
                        right: 48,
                        top: 2,
                        bottom: 8,
                      ),
                      child: Text(
                        DateFormat('hh:mm a').format(msg.time!),
                        style: TextStyle(color: Colors.white54, fontSize: 12),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
