
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gpt/data/models/conversation_model.dart';
import 'package:gpt/provider/api_provider.dart';

class ChatController extends GetxController{
  Conversation conversation = Conversation(summary: 'summary', gptModel: 'gptModel', createdDate: 'createdDate', lastMessage: 'lastMessage', id: 1);
  var message = ''.obs;
  var gptModel = 'GPT-turbo'.obs;
  TextEditingController textEditingController = TextEditingController();
  RxString textValue = ''.obs;

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

  addUserMessage(){
    messages.insert(0,
        Message(
            role: 'user',
            id: 0,
            stringContent: textValue.value,
            image: '',
        ));
    textEditingController.clear();
    sendMessageToGPT();
  }

  Future<void> sendMessage() async {
    // messages.add();
    // late Message message;
    await ApiProvider().sendMessageToGPT([]);
  }

  getMessages() async{
    isMessageLoading.value = true;
    messages.value = await ApiProvider().getMessages(conversation.id);
    isMessageLoading.value = false;
  }

  saveMessageToServer(Message message) async{
    await ApiProvider().addMessage(conversation.id, message);
  }

  sendMessageToGPT(){
    ApiProvider().sendMessageToGPT(messages);
  }
}