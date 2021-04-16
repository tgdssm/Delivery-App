import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/data/models/drink.dart';
import 'package:delivery_app/data/models/food.dart';
import 'package:delivery_app/ui/layouts/small/product_info_screen/product_info_screen_small.dart';
import 'package:delivery_app/ui/screens/product_info_screen/product_info_screen_controller.dart';
import 'package:delivery_app/utils/globals.dart';
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
      appBar: MediaQuery.of(context).size.width <= productInfoScreenController.minWidth?null :AppBar(
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
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if(constraints.maxHeight <= 570 && constraints.maxWidth <= 320){
                    return productInfoScreenSmall(food: food, productInfoScreenController: productInfoScreenController);
                  }
                  return ListView(
                    children: [
                      Container(
                        padding: EdgeInsets.all(
                          18.0,
                        ),
                        color: Colors.white54,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Hero(
                              tag: food.photo,
                              child: Container(
                                width: 240,
                                height: 240,
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage(food.photo), fit: BoxFit.scaleDown),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(horizontal: 25),
                                  alignment: Alignment.center,
                                  child: Text(
                                    food.type != 'Hambúrguer'
                                        ? '${food.type} de ${food.name}'
                                        : food.name,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 25),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(horizontal: 25),
                                  alignment: Alignment.center,
                                  child: Text(
                                    maskedMoney(food.price),
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0)),
                                  elevation: 1,
                                  shadowColor: Colors.grey.withOpacity(0.5),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child: Row(
                                            children: [
                                              Icon(Icons.food_bank_rounded, size: 30,),
                                              SizedBox(width: 5.0,),
                                              Text(
                                                'Ingredientes',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          padding: EdgeInsets.only(left: 35.0),
                                          child: Text(
                                            '${productInfoScreenController.ingredients(food.ingredients)}.',
                                            style: TextStyle(
                                                color: Theme.of(context).primaryColor,
                                                fontWeight: FontWeight.w300,
                                                fontSize: 17),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                            Container(
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0)),
                                  elevation: 1,
                                  shadowColor: Colors.grey.withOpacity(0.5),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child: Row(
                                            children: [
                                              Icon(Icons.timer_rounded, size: 30.0,),
                                              SizedBox(width: 5.0,),
                                              Text(
                                                'Tempo de entrega',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          padding: EdgeInsets.only(left: 35.0),
                                          child: Text(
                                            '50 - 60 minutos.',
                                            style: TextStyle(
                                                color: Theme.of(context).primaryColor,
                                                fontWeight: FontWeight.w300,
                                                fontSize: 17),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                            SizedBox(
                              height: 5.0,
                            ),
                            Container(
                              height: 70.0,
                              child: MaterialButton(
                                onPressed: () {
                                  print(MediaQuery.of(context).size.width);
                                  print(MediaQuery.of(context).size.height);
                                },
                                child: Text(
                                  'Adicionar ao carrinho',
                                  style: TextStyle(
                                      fontSize: 17, fontWeight: FontWeight.w600),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                textColor: Colors.white,
                                color: Theme.of(context).primaryColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ))
          : Container(),
    );
  }
}


