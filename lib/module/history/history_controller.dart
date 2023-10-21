import 'package:get/get.dart';
import 'package:gpt/data/models/conversation_model.dart';
import 'package:gpt/provider/api_provider.dart';

class HistoryController extends GetxController {
  List<Conversation> conversations = [
    Conversation(
        summary: 'this is a summary for chat',
        gptModel: 'gptModel',
        createdDate: '14:45 | 13 September',
        lastMessage: ''' You can use code below:
let x = 16;
...''',
        id: 1),
    Conversation(
        summary: 'this is a summary for chat',
        gptModel: 'gptModel',
        createdDate: '14:45 | 13 September',
        lastMessage: ''' You can use code below:
let x = 16;
...''',
        id: 1),
    Conversation(
        summary: 'this is a summary for chat',
        gptModel: 'gptModel',
        createdDate: '14:45 | 13 September',
        lastMessage: ''' You can use code below:
let x = 16;
...''',
        id: 1),
    Conversation(
        summary: 'this is a summary for chat',
        gptModel: 'gptModel',
        createdDate: '14:45 | 13 September',
        lastMessage: ''' You can use code below:
let x = 16;
...''',
        id: 1),
  ];
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
