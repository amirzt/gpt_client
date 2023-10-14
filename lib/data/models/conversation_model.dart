class Conversation {
  String summary;
  String gptModel;
  String createdDate;
  int id;

  Conversation(
      {required this.summary,
      required this.gptModel,
      required this.createdDate,
      required this.id});

  factory Conversation.fromJson(Map<String, dynamic> json) {
    return Conversation(
      summary: json['summary'] ?? '',
      gptModel: json['gpt_model'],
      createdDate: json['created_at'],
      id: json['id'],
    );
  }
}

class Message{
  String role;
  int id;
  String content;
  String image;
  String createdAt;

  Message({
    required this.role,
    required this.id,
    required this.content,
    required this.image,
    required this.createdAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      role: json['role'],
      id: json['id'],
      content: json['content'] ?? '',
      image: json['image'] ?? '',
      createdAt: json['created_at'],
    );
  }
}
