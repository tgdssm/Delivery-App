import 'package:delivery_app/data/models/product.dart';

class Food extends Product {
  List<String> ingredients;

  Food({
    String name,
    String photo,
    double price,
    this.ingredients,
  }) : super(name: name, photo: photo, price: price);
}
