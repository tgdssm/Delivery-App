import 'package:delivery_app/data/models/drink.dart';
import 'package:delivery_app/data/models/food.dart';

class ProductInfoScreenController {
  Drink drink;
  Food food;

  defineType(var product) {
    if(product.runtimeType == Drink)
      drink = product;
    else food = product;
  }
}