import 'package:delivery_app/data/models/drink.dart';
import 'package:delivery_app/data/models/food.dart';

class ProductInfoScreenController {
  double minWidth = 320.0;
  double minFontSize = 15;
  double widthFactor = .85;
  String ingredients(List<String> ingredients) {
    return ingredients.reduce((value, element) => value + ', ' + element);
  }
}