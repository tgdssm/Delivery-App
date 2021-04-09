import 'package:delivery_app/data/models/drink.dart';
import 'package:delivery_app/data/models/food.dart';

class ProductInfoScreenController {
  String ingredients(List<String> ingredients) {
    return ingredients.reduce((value, element) => value + ', ' + element);
  }
}