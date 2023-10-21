import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:gpt/core/colors.dart';
import 'package:gpt/module/chat/chat_controller.dart';
import 'package:gpt/module/chat/widgets/gpt_message_widget.dart';
import 'package:gpt/module/chat/widgets/input_widget.dart';
import 'package:gpt/module/chat/widgets/model_choice_widget.dart';
import 'package:gpt/module/chat/widgets/user_message_widget.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ChatController());
    // controller.sendMessage();
    return SafeArea(
        child: Scaffold
          (body: Column(
          children: [
            const ModelChoiceWidget(),
            Obx(() => Expanded(
              child: ListView.builder(
                  reverse: true,
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    if(controller.messages[index].role == 'user'){
                      return UserMessageWidget(controller.messages[index]);
                    }else{
                      return GPTMessageWidget(controller.messages[index]);
                    }
                  }),
            )),
            const SizedBox(height: 10,),
            const InputWidget()
          ],
        )
        )
    );
  }
}
