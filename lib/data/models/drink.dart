import 'package:delivery_app/data/models/product.dart';

class Drink extends Product {
  int? liter;

  Drink({
    required String name,
    required String photo,
    double? price,
    required String type,
    this.liter,
  }) : super(name: name, photo: photo, price: price, type: type);
}
