
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/data/models/conversation_model.dart';
import 'package:gpt/module/chat/chat_controller.dart';
import 'package:gpt/module/chat/widgets/message_bottom_widget.dart';
import 'package:gpt/services/locale_services.dart';

class GPTMessageWidget extends GetWidget<ChatController>{
  final Message message;

  const GPTMessageWidget(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 60,
        left: 10,
        top: 10,
      ),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              border: Border.all(
                  width: 1,
                  color: GlobalColors.borderColor
              ),
              color: GlobalColors.divider
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Obx(() => Text(
                  message.content.value,
                  textDirection: LocaleServices()
                      .detectTextDirection(message.content.value),
                  style: TextStyle(color: GlobalColors.whiteTextColor),
                ),),
                const SizedBox(height: 10,),
                const MessageBottomWidget()
              ],
            ),
          )),
    );
  }

}