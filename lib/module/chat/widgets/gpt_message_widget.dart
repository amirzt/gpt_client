
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/data/models/conversation_model.dart';
import 'package:gpt/module/chat/chat_controller.dart';

class GPTMessageWidget extends GetWidget<ChatController>{
  final Message message;

  const GPTMessageWidget(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            children: [
              Text(
                message.content,
                style: TextStyle(color: GlobalColors.whiteTextColor),
              ),

            ],
          ),
        ));
  }

}