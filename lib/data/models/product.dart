class Product {
  late String name;
  late String photo;
  double? price;
  late String type;

  Product({this.price, required this.photo, required this.name, required this.type});
}