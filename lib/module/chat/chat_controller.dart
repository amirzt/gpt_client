
import 'package:get/get.dart';
import 'package:gpt/data/models/conversation_model.dart';
import 'package:gpt/provider/api_provider.dart';

class ChatController extends GetxController{
  late Conversation conversation;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    conversation = Get.arguments as Conversation;
    getMessages();
  }

  List<Message> messages = [];
  var isMessageLoading = false.obs;

  getMessages() async{
    isMessageLoading.value = true;
    messages = await ApiProvider().getMessages(conversation.id);
    isMessageLoading.value = false;
  }

  saveMessageToServer(Message message) async{
    await ApiProvider().addMessage(conversation.id, message);
  }

  sendMessageToGPT(Message message){
    messages.add(message);
    update();
    ApiProvider().sendMessageToGPT(message);
  }
}