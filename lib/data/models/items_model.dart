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

  Task(
      {required this.name,
      required this.id,
      required this.icon,
      required this.description,
      required this.offline,
      required this.script});

  factory Task.fromJson(Map<String, dynamic> json) => Task(
      offline: json['offline'],
      name: json['name'],
      id: json['id'],
      icon: json['icon'],
      description: json['description'],
      script: json['script']);
}
