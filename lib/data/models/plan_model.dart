
class Plan{
  String title;
  String price;
  int id;
  bool checked;
  String description;
  String myket;

  Plan({required this.title, required this.price,
    required this.myket,
    required this.id, required this.checked, this.description = ''});

  factory Plan.fromJson(Map json){
    return Plan(
        title: json['title'],
        price: json['price'].toString(),
        id: json['id'],
        myket: json['bazar_myket'],

        description: json['description'],
      checked: false
    );
  }
}