import 'package:get/get.dart';

class Conversation {
  String summary;
  String gptModel;
  String createdDate;
  int id;
  String lastMessage = '...';

  Conversation(
      {required this.summary,
      required this.gptModel,
      required this.createdDate,
        required this.lastMessage,
      required this.id});

  factory Conversation.fromJson(Map<String, dynamic> json) {
    return Conversation(
      summary: json['summary'] ?? '',
      gptModel: json['gpt_model'],
      createdDate: json['created_at'],
      id: json['id'],
      lastMessage: json['last_message'] ?? '...',
    );
  }
}

class Message{
  String role;
  int id;
  RxString content;
  String image;
  // String createdAt;

  Message({
    required this.role,
    required this.id,
    required String stringContent,
    required this.image,
    // required this.createdAt,
  }): content = RxString(stringContent);

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      role: json['role'],
      id: json['id'],
      stringContent: json['content'] ?? '',
      image: json['image'] ?? '',
      // createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'role': role,
      'content': content.value,
    };
  }
}
