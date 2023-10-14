class Category {
  String name;
  int id;

  Category({required this.name, required this.id});
  factory Category.fromJson(Map<String, dynamic> json) =>
      Category(name: json['name'], id: json['id']);
}

class Item {
  String name;
  int id;
  String icon;
  String description;
  String script;

  Item(
      {required this.name,
      required this.id,
      required this.icon,
      required this.description,
      required this.script});

  factory Item.fromJson(Map<String, dynamic> json) => Item(
      name: json['name'],
      id: json['id'],
      icon: json['icon'],
      description: json['description'],
      script: json['script']);
}
