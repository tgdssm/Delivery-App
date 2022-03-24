import 'package:delivery_app/data/models/product.dart';

class Food extends Product {
  late List<String> ingredients;

  Food({
    required String name,
    required String photo,
    double? price,
    required String type,
    required this.ingredients,
  }) : super(name: name, photo: photo, price: price, type: type);
}
