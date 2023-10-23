
import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:gpt/data/models/app_version.dart';
import 'package:gpt/data/models/conversation_model.dart';
import 'package:gpt/data/models/items_model.dart';
import 'package:gpt/module/chat/chat_controller.dart';
import 'package:gpt/provider/token.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:platform_device_id_v3/platform_device_id.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/urls.dart';
import '../data/models/plan_model.dart';
import '../services/global_services.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  void splash() async{
    String token = await TokenService().getToken();
    Map response = await GlobalService().postRequestMapReturn(
        token,
        GlobalURL.splashUri,
        {});
    if(response.containsKey('expired')){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('expired', response['expired']);
      prefs.setString('username', response['username']);
    }else{
      login();
    }
  }

  Future<bool> login() async {
    String? deviceId = await PlatformDeviceId.getDeviceId;

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String packageName = packageInfo.packageName;

    // String deviceId = '';
    Map response = await GlobalService()
        .login(GlobalURL.loginUri, {
          'device_id': deviceId.toString(),
          'package_name': packageName
        });
    if(response.containsKey('token')){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('Token', response['token']);
      prefs.setBool('expired', response['expired']);
      prefs.setString('username', response['username']);
      prefs.setBool('yearly', response['yearly']);
      // prefs.setString('api_key', response['api_key']);
      List admob = response['admob'];
      for(var i=0 ; i<admob.length ; i++){
        prefs.setString(admob[i]['type'], admob[i]['code']);
      }
      return true;
    }else{
      return false;
    }
  }

  Future<Map> getString(Uri uri) async{
    String token = await TokenService().getToken();
    Map response = await GlobalService().getRequestMapReturn(token, uri);
    return response;
  }

  Future<List<Plan>> getPlans(Uri uri, Map body) async{
    List<Plan> plans = [];
    String token = await TokenService().getToken();
    List response = await GlobalService().postRequestListReturn(token, uri, body);
    for(var i=0 ; i<response.length ; i++){
      plans.add(Plan.fromJson(response[i]));
    }
    return plans;
  }

  Future<String> getZarinpalUrl(int plan) async{
    String token = await TokenService().getToken();
    Map response = await GlobalService().postRequestMapReturnAuth(
        token,
        GlobalURL.getZarinpalUrl,
        {'plan': plan.toString()});
    return response['purchase_url'];
  }

  Future<String> getInstagram() async{
    String token = await TokenService().getToken();
    Map response = await GlobalService().getRequestMapReturn(
        token,
        GlobalURL.getInstagram);
    return response['url'];
  }

  Future<String> getEmail() async{
    String token = await TokenService().getToken();
    Map response = await GlobalService().getRequestMapReturn(
        token,
        GlobalURL.getEmail);
    return response['email'];
  }

  Future<List<Category>> getCategories() async{
    List<Category> categories = [];
    String token = await TokenService().getToken();
    List response = await GlobalService().getRequestListReturn(
        token,
        GlobalURL.getCategories);
    for(var i=0 ; i<response.length ; i++){
      categories.add(Category.fromJson(response[i]));
    }
    return categories;
  }

  Future<List<Task>> getItems(int category) async{
    List<Task> items = [];
    String token = await TokenService().getToken();
    List response = await GlobalService().postRequestListReturn(
        token,
        GlobalURL.getItems,
        {'category': category.toString()});
    for(var i=0 ; i<response.length ; i++){
      items.add(Task.fromJson(response[i]));
    }
    return items;
  }

  Future<List<Conversation>> getConversations() async{
    List<Conversation> conversations = [];
    String token = await TokenService().getToken();
    List response = await GlobalService().getRequestListReturn(
        token,
        GlobalURL.getConversation);
    for(var i=0 ; i<response.length ; i++){
      conversations.add(Conversation.fromJson(response[i]));
    }
    return conversations;
  }


  Future<List<Message>> getMessages(int conversation) async{
    List<Message> messages = [];
    String token = await TokenService().getToken();
    List response = await GlobalService().postRequestListReturn(
        token,
        GlobalURL.getMessage,
        {'conversation': conversation.toString()});
    for(var i=0 ; i<response.length ; i++){
      messages.add(Message.fromJson(response[i]));
    }
    return messages;
  }

  Future<int> createConversation(String gptModel, String firstQuestion) async{
    String token = await TokenService().getToken();
    Map response = await GlobalService().postRequestMapReturn(
        token,
        GlobalURL.createConversation,
        {'gpt_model': gptModel, 'first_question': firstQuestion});
    return response['id'];
  }

  Future<void> updateConversation(int id, String summary) async{
    String token = await TokenService().getToken();
    await GlobalService().postRequestMapReturn(
        token,
        GlobalURL.updateConversation,
        {'id': id.toString(),
          'summary': summary});
  }

  Future<void> deleteConversation(int id) async{
    String token = await TokenService().getToken();
    await GlobalService().postRequestMapReturn(
        token,
        GlobalURL.deleteConversation,
        {'id': id.toString()});
  }

  Future<void> addMessage(int conversation, Message message) async{
    String token = await TokenService().getToken();
    Map body = {
      'conversation': conversation.toString(),
      'role': message.role,
    };
    if(message.image != ''){
      body['image'] = message.image;
    }else{
      body['content'] = message.content.value;
    }
    await GlobalService().postRequestMapReturn(
        token,
        GlobalURL.addMessage,
        body);
  }

  Future<void> sendMessageToGPT(List<Message> messages) async{
    // List<Message> reversedMessage = messages.reversed.toList();
    List<Map<String, dynamic>> jsonMessages = messages.map((message) => message.toJson()).toList();
    const url = 'https://api.openai.com/v1/chat/completions';

    final headers = {
      'Authorization': 'Bearer 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',
      'Content-Type': 'application/json',
    };
    final body = json.encode({
      'messages': jsonMessages,
      "model": "gpt-3.5-turbo",
      'stream': true,
    });
    ChatController controller = Get.put(ChatController());
    // controller.messages.add(
    //     Message(role: 'assistant', id: 0, stringContent: '', image: '')
    // );
    http.Client client = http.Client();
    http.Request request = http.Request('POST', Uri.parse(url));
    request.body = body;
    request.headers.addAll(headers);
    // request.headers = [];


    StreamSubscription streamSubscription;
    streamSubscription = client.send(request).asStream().listen((response) {
      response.stream.listen((event) {
        // Handle the received event
        // The event will be of type http.StreamedResponse
        // You can extract data using event.stream or event.stream.bytesToString()
        // print('1');
        Map content = json.decode(utf8.decode(event).split('data: ')[1]);
        // print(content);
        if(content[0] != 'DONE'){
          if(content['choices'][0]['delta'].containsKey('content')) {
            controller.messages.last.content.value += content['choices'][0]['delta']['content'];
            // controller.update();
          }else{
            controller.saveMessageToServer(messages.last);
          }
        }else{
          // print('done');
        }


      }, onError: (error) {
        // Handle any error that occurs during the connection or data retrieval
      }, cancelOnError: true);
    }, onError: (error) {
      // Handle any error that occurs while establishing the connection
    });

  }

}
