import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/data/models/conversation_model.dart';
import 'package:gpt/data/models/items_model.dart';
import 'package:gpt/global/widgets/progress_indicator.dart';

// import 'package:gpt/core/colors.dart';
import 'package:gpt/module/chat/chat_controller.dart';
import 'package:gpt/module/chat/widgets/gpt_message_widget.dart';
import 'package:gpt/module/chat/widgets/input_widget.dart';
import 'package:gpt/module/chat/widgets/model_choice_widget.dart';
import 'package:gpt/module/chat/widgets/user_message_widget.dart';
import 'package:gpt/provider/api_provider.dart';

class ChatPage extends StatelessWidget {
  final int id;
  final String? script;
  final bool firstSend;
  ChatPage(this.id, this.firstSend,  {Key? key, this.script}) : super(key: key);

  final ChatController controller = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    // Get.put(ChatController());
    // ScrollController scrollController = ScrollController(initialScrollOffset: double.infinity);
    // Get.lazyPut(() => ChatController());
    controller.messages.clear();
    controller.conversationId = id;
    controller.getMessages();
    addTaskMessage();
    // controller.sendMessage();
    return GetBuilder<ChatController>(
      builder: (controller){
        return WillPopScope(
            onWillPop: () async{
              controller.flutterTts.stop();
              controller.onInit();
              // Get.put(ChatController());
              return true;
            },
            child: SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: true,
                body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const ModelChoiceWidget(),
                Obx(() => Expanded(

                    child: controller.isScreenLoading.value ?
                    MyProgressIndicator(GlobalColors.whiteTextColor,
                    size: 40,)
                        : ListView.builder(
                      // reverse: true,
                        controller: controller.scrollController,
                        // controller: scrollController,
                        itemCount: controller.messages.length,
                        itemBuilder: (context, index) {
                          if(controller.messages[index].role == 'user'){
                            return UserMessageWidget(controller.messages[index]);
                          }else{
                            return GPTMessageWidget(controller.messages[index], index);
                          }
                        })
                )),
                const SizedBox(height: 10,),
                const InputWidget()
              ],
            )
            )
        ));
      },
    );
  }

  void addTaskMessage() async{
    if(script != null){
      controller.messages.add(
        Message(
            role: 'user',
            id: 0,
            stringContent: script!,
            stringImage: '')
      );
      controller.tempContent = script!;
      if(firstSend){
        controller.messages.add(
            Message(role: 'assistant', id: 0, stringContent: '', stringImage: '')
        );
        controller.sendMessageToGPT();
      }
    }
  }
}
