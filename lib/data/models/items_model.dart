import 'package:gpt/core/urls.dart';

class Category {
  String name;
  int id;

  Category({required this.name, required this.id});
  factory Category.fromJson(Map<String, dynamic> json) =>
      Category(name: json['name'], id: json['id']);
}

class Task {
  String name;
  int id;
  String icon;
  String description;
  String script;
  bool offline;
  bool firstSend;

  Task(
      {required this.name,
      required this.id,
      required this.icon,
      required this.description,
      required this.offline,
        required this.firstSend,
      required this.script});

  factory Task.fromJson(Map<String, dynamic> json) => Task(
      offline: false,
      name: json['name'],
      id: json['id'],
      firstSend: false,
      icon: Uri(host: GlobalURL.host, scheme: GlobalURL.scheme, port: GlobalURL.port, path: json['icon']).toString(),
      description: json['description'],
      script: json['script']);
}
