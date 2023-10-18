
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/module/chat/chat_controller.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ChatController());
    controller.sendMessage();
    return Scaffold(
      body: Center(
        child: Obx(() => Text(controller.message.value,
        style: TextStyle(color: GlobalColors.whiteTextColor,
        fontSize: 18),)),
      ),
    );
  }
}