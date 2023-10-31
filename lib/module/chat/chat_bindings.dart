
import 'package:get/get.dart';
import 'package:gpt/module/chat/chat_controller.dart';

class ChatBinding extends Bindings{

  @override
  void dependencies() {
    Get.put(ChatController());
  }

}