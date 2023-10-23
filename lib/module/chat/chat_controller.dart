
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gpt/data/models/conversation_model.dart';
import 'package:gpt/provider/api_provider.dart';

class ChatController extends GetxController{
  var message = ''.obs;
  var gptModel = 'GPT-turbo'.obs;
  TextEditingController textEditingController = TextEditingController();
  RxString textValue = ''.obs;
  int conversationId = 0 ;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    textEditingController.addListener(() {
      textValue.value = textEditingController.text;
    });
    // conversation = Get.arguments as Conversation;
    // getMessages();
  }

  RxList<Message> messages = <Message>[].obs;
  var isMessageLoading = false.obs;

  addUserMessage() async{
    String content = textValue.value;
    messages.add(
        Message(
            role: 'user',
            id: 0,
            stringContent: textValue.value,
            image: '',
        ));
    messages.add(
        Message(role: 'assistant', id: 0, stringContent: '', image: '')
    );
    textEditingController.clear();

    if(conversationId == 0 ){
      conversationId = await ApiProvider().createConversation(gptModel.value, content);
    }else{
      saveMessageToServer(messages[messages.length-2]);
    }
    sendMessageToGPT();
  }

  getMessages() async{
    isMessageLoading.value = true;
    messages.value = await ApiProvider().getMessages(conversationId);
    isMessageLoading.value = false;
  }

  saveMessageToServer(Message message) async{
    ApiProvider().addMessage(conversationId, message);
  }

  sendMessageToGPT(){
    ApiProvider().sendMessageToGPT(messages);
  }
}