
class Plan{
  String title;
  String price;
  int id;
  bool checked;
  String description;
  Plan({required this.title, required this.price, required this.id, required this.checked, this.description = ''});

  factory Plan.fromJson(Map json){
    return Plan(
        title: json['title'],
        price: json['price'].toString(),
        id: json['id'],
      description: json['description'],
      checked: false
    );
  }
}