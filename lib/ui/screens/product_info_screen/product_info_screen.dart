import 'package:delivery_app/data/models/drink.dart';
import 'package:delivery_app/data/models/food.dart';
import 'package:delivery_app/ui/screens/product_info_screen/product_info_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductInfoScreen extends StatelessWidget {
  final productInfoScreenController = ProductInfoScreenController();
  final Food food;
  final Drink drink;
  ProductInfoScreen({this.food, this.drink});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          ? SafeArea(
              child: Container(
                padding: EdgeInsets.all(18.0,),
                color: Colors.white54,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Hero(
                      tag: food.photo,
                      child: Container(
                        width: 251,
                        height: 251,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(food.photo)
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            )
                          ],
                          shape: BoxShape.circle
                        ),
                      ),
                    )
                  ],
                ),
            ))
          : Container(),
    );
  }
}
