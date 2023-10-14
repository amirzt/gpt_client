
import 'package:get/get.dart';
import 'package:gpt/data/models/conversation_model.dart';
import 'package:gpt/provider/api_provider.dart';

class HistoryController extends GetxController {
  List<Conversation> conversations = [];
  var isLoading = false.obs;

  getConversations() async {
    isLoading.value = true;
    conversations = await ApiProvider().getConversations();
    isLoading.value = false;
  }

  deleteConversation(int id) async {
    isLoading.value = true;
    await ApiProvider().deleteConversation(id);
    isLoading.value = false;
  }
}