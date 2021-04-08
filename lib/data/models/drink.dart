import 'package:delivery_app/data/models/product.dart';

class Drink extends Product {
  int liter;

  Drink({
    String name,
    String photo,
    double price,
    this.liter,
  }) : super(name: name, photo: photo, price: price);
}
