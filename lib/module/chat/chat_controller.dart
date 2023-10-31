import 'package:flutter/cupertino.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:gpt/data/models/conversation_model.dart';
import 'package:gpt/provider/api_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatController extends GetxController {
  var message = ''.obs;
  var gptModel = 'GPT-turbo'.obs;
  var isSpeaking = false.obs;
  var isCropping = false.obs;
  TextEditingController textEditingController = TextEditingController();
  RxString textValue = ''.obs;
  int conversationId = 0;

  var isMessageLoading = false.obs;
  var isScreenLoading = false.obs;
  var isVisualizeLoading = false.obs;
  FlutterTts flutterTts = FlutterTts();
  var limitReached = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    textEditingController.addListener(() {
      textValue.value = textEditingController.text;
    });
    getLimit();
    // conversation = Get.arguments as Conversation;
    // getMessages();
  }


  RxList<Message> messages = <Message>[].obs;
  ScrollController scrollController = ScrollController();

  addUserMessage() async {
    isMessageLoading.value = true;
    String content = textValue.value;
    messages.add(Message(
      role: 'user',
      id: 0,
      stringContent: textValue.value,
      stringImage: '',
    ));
    messages.add(
        Message(role: 'assistant', id: 0, stringContent: '', stringImage: ''));
    scrollToLast(1);

    if (conversationId == 0) {
      conversationId =
          await ApiProvider().createConversation(gptModel.value, content);
    } else {
      saveMessageToServer(messages[messages.length - 2]);
    }
    sendMessageToGPT();
  }

  getMessages() async {
    if (conversationId != 0) {
      isScreenLoading.value = true;
      messages.value = await ApiProvider().getMessages(conversationId);
      isScreenLoading.value = false;
      scrollToLast(1);
    }
  }

  saveMessageToServer(Message message) async {
    ApiProvider().addMessage(conversationId, message);
  }

  sendMessageToGPT() {
    String model = gptModel.value == 'GPT-turbo' ? 'gpt-3.5-turbo' : 'gpt-4';
    ApiProvider().sendMessageToGPT(messages, model);
  }

  reAsk(Message pMessage) async {
    messages.add(pMessage);
    messages.add(
        Message(role: 'assistant', id: 0, stringContent: '', stringImage: ''));
    saveMessageToServer(messages[messages.length - 2]);
    sendMessageToGPT();
  }

  void scrollToLast(int seconds) async {
    await Future.delayed(Duration(seconds: seconds));
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    textEditingController.clear();
  }

  void visualize() async {
    isVisualizeLoading.value = true;
    ApiProvider().visualize(messages.last.content.value.length > 999
        ? messages.last.content.value.substring(0, 999)
        : messages.last.content.value);
  }

  void getLimit() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool expired = prefs.getBool('expired') ?? true;
    if(expired){
      limitReached.value = prefs.getBool('limit_reached') ?? false;
    }else{
      limitReached.value = false;
    }
  }
}
