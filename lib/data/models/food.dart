import 'package:delivery_app/data/models/product.dart';

class Food extends Product {
  List<String> ingredients;
  String type;

  Food({
    String name,
    String photo,
    double price,
    this.ingredients,
    this.type,
  }) : super(name: name, photo: photo, price: price);
}
