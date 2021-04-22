import 'package:delivery_app/ui/screens/cart_screen/cart_screen_controller.dart';
import 'package:delivery_app/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  final _cartScreenController = Get.put(CartScreenController());
  @override
  Widget build(BuildContext context) {
    _cartScreenController.products.forEach((element) {
      print(element['product'].name);
      print(element['size']);
      print(element['quantity']);
    });
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: maxWidthScreen
            ),
          ),
        );
      },
    );
  }
}
