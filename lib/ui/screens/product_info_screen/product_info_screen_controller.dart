import 'package:delivery_app/data/models/drink.dart';
import 'package:delivery_app/data/models/food.dart';
import 'package:delivery_app/data/models/product.dart';
import 'package:delivery_app/ui/screens/cart_screen/cart_screen.dart';
import 'package:delivery_app/ui/screens/cart_screen/cart_screen_controller.dart';
import 'package:delivery_app/ui/screens/home_screen/home_screen.dart';
import 'package:get/get.dart';

class ProductInfoScreenController extends GetxController {
  RxInt quantity = 1.obs;

  String ingredients(List<String> ingredients) {
    return ingredients.reduce((value, element) => value + ', ' + element);
  }

  void addQuantity() {
    quantity.value += 1;
  }

  void subtractQuantity() {
    if (quantity.value > 1) {
      quantity.value -= 1;
    }
  }

  void addProductToCart({Food food, Drink drink}) {
    final _cartScreenController = Get.put(CartScreenController());
    Map<String, dynamic> productItem = {};
    productItem['product'] = food ?? drink;
    productItem['quantity'] = quantity.value;
    _cartScreenController.products.add(productItem);
    quantity.value = 1;
    Get.offAll(HomeScreen());
  }
}
