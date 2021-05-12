import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/data/models/drink.dart';
import 'package:delivery_app/data/models/food.dart';
import 'package:delivery_app/ui/screens/cart_screen/cart_screen_controller.dart';
import 'package:delivery_app/ui/screens/home_screen/home_screen.dart';
import 'package:delivery_app/ui/screens/home_screen/home_screen_controller.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductInfoScreenController extends GetxController {
  final _cartScreenController = Get.put(CartScreenController());
  final _homeScreenController = Get.put(HomeScreenController());
  RxInt quantity = 1.obs;

  Map<String, dynamic> sizeAndPrice;

  AnimationController animationController;
  Animation<double> scaleAnimation;

  void selectProductSizeAndPrice(Map<String, dynamic> sizeAndPrice) {
    this.sizeAndPrice = sizeAndPrice;
    update(['productSize']);
  }

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

  SnackBar addProductToCart({Food food, Drink drink}) {
    Map<String, dynamic> productItem = {};

    productItem['product'] = food ?? drink;
    productItem['quantity'] = quantity.value;

    if (drink != null && sizeAndPrice != null) {

      productItem['unit_price'] = sizeAndPrice['price'] ?? drink.price;

      productItem['price'] = (drink.price == null)
          ? (sizeAndPrice['price'] * productItem['quantity'])
          : (drink.price * productItem['quantity']);

      productItem['size'] = sizeAndPrice['size'];

    } else if (food != null) {

      productItem['unit_price'] =
          (sizeAndPrice != null) ? sizeAndPrice['price'] : food.price;

      if (food.type != 'Hambúrguer' && sizeAndPrice != null) {

        productItem['size'] = sizeAndPrice['size'];
        productItem['price'] = sizeAndPrice['price'] * productItem['quantity'];

      } else if (food.type == 'Hambúrguer') {
        productItem['price'] = food.price * productItem['quantity'];
      }
    }
    // Verifica se o usuario escolheu o tamanho do produto
    if ((productItem['size'] == null && productItem['price'] == null) &&
        productItem['product'].type != 'Hambúrguer') {
      final snackBar = SnackBar(
        content: AutoSizeText(
          'Selecione um tamanho',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          textAlign: TextAlign.center,
          maxLines: 1,
          minFontSize: 15,
        ),
        backgroundColor: Colors.deepOrange,
        duration: Duration(milliseconds: 600),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
        ),
      );
      return snackBar;
    }
    // ProductItem sera adicionado ao carrinho
    if (!checkInCart(productItem)) {
      quantity.value = 1;
      sizeAndPrice = null;
      _cartScreenController.products.add(productItem);
      _cartScreenController.products.forEach((element) {
        print('preco: ${element['product'].price}');
      });
      _homeScreenController.selectedTab.value = 0;
      Get.offAll(HomeScreen());
      final snackBar = SnackBar(
        content: AutoSizeText(
          'Produto adicionado ao carrinho',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          textAlign: TextAlign.center,
          maxLines: 1,
          minFontSize: 15,
        ),
        backgroundColor: Colors.green,
        duration: Duration(milliseconds: 600),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
        ),
      );
      return snackBar;
    } else {
      quantity.value = 1;
      sizeAndPrice = null;
      Get.back(result: true);
      final snackBar = SnackBar(
        content: AutoSizeText(
          'Este produto já está no carrinho',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          textAlign: TextAlign.center,
          maxLines: 1,
          minFontSize: 15,
        ),
        backgroundColor: Colors.red,
        duration: Duration(milliseconds: 600),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
        ),
      );
      return snackBar;
    }
  }

  // Verifica se o produto ja existe dentro do carrinho
  bool checkInCart(Map<String, dynamic> productItem) {
    for (Map element in _cartScreenController.products) {
      if ((element['product'].name == productItem['product'].name) &&
          (element['size']   == productItem['size'])) {
        return true;
      }
    }
    return false;
  }
}
