import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/data/models/drink.dart';
import 'package:delivery_app/data/models/food.dart';
import 'package:delivery_app/ui/layouts/product_info_screen/product_info_screen_content.dart';
import 'package:delivery_app/ui/screens/product_info_screen/product_info_screen_controller.dart';
import 'package:delivery_app/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductInfoScreen extends StatelessWidget {
  final _productInfoScreenController = ProductInfoScreenController();
  final Food food;
  final Drink drink;
  ProductInfoScreen({this.food, this.drink});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: constraints.maxHeight <= mobileBreakPointSmallHeight
              ? null
              : AppBar(
                  backgroundColor: Colors.white54,
                  elevation: 0.0,
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                    ),
                    onPressed: () => Get.back(),
                    color: Colors.black,
                    iconSize: 30.0,
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(Icons.favorite_border_rounded),
                        onPressed: () {},
                        color: Colors.black,
                        iconSize: 30.0,
                      ),
                    ],
                  ),
                ),
          body: food != null
              ? ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 1024),
                  child: SafeArea(
                      child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: constraints.maxHeight,
                    ),
                    child: ProductInfoScreenContent(
                      drink: drink,
                      food: food,
                      productInfoScreenController: _productInfoScreenController,
                    ),
                  )),
                )
              : Container(),
        );
      },
    );
  }
}
