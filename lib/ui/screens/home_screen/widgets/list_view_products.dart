import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/data/models/drink.dart';
import 'package:delivery_app/data/models/food.dart';
import 'package:delivery_app/ui/screens/product_info_screen/product_info_screen.dart';
import 'package:delivery_app/utils/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListViewProducts extends StatelessWidget {
  final List<Food> foods;
  final List<Drink> drinks;
  ListViewProducts({this.foods, this.drinks});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxHeight <= 230) {
        if (foods != null) {
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: foods.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Get.to(ProductInfoScreen(food: foods[index])),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  width: 180,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 5,
                        child: Container(
                          width: 150,
                          height: 160,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    offset: Offset(2, 2),
                                    blurRadius: 5,
                                    spreadRadius: 1),
                              ],
                              color: Colors.white),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(top: 50.0),
                                  width: 100,
                                  child: AutoSizeText(
                                    foods[index].name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    minFontSize: 18,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    // overflow: TextOverflow.ellipsis,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          left: 25,
                          top: 0,
                          child: Hero(
                            tag: foods[index].photo,
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(foods[index].photo),
                              )),
                            ),
                          ))
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: drinks.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Get.to(ProductInfoScreen(drink: drinks[index])),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  // color: Colors.black,
                  width: 180,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 5,
                        child: Container(
                          width: 150,
                          height: 160,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    offset: Offset(2, 2),
                                    blurRadius: 5,
                                    spreadRadius: 1),
                              ],
                              color: Colors.white),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(top: 30.0),
                                  width: 100,
                                  child: AutoSizeText(
                                    drinks[index].name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    minFontSize: 15,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    // overflow: TextOverflow.ellipsis,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          left: 25,
                          top: 0,
                          child: Hero(
                            tag: drinks[index].photo,
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(drinks[index].photo),
                              )),
                            ),
                          ))
                    ],
                  ),
                ),
              );
            },
          );
        }
      }
      if (constraints.maxHeight <= 320) {
        if (foods != null) {
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: foods.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Get.to(ProductInfoScreen(food: foods[index])),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  // color: Colors.black,
                  width: 220,
                  height: 321,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 10,
                        child: Container(
                          width: 190,
                          height: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    offset: Offset(2, 2),
                                    blurRadius: 5,
                                    spreadRadius: 1),
                              ],
                              color: Colors.white),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(top: 30.0),
                                  width: 150,
                                  child: Text(
                                    foods[index].name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    // overflow: TextOverflow.ellipsis,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          left: 20,
                          top: 0,
                          child: Hero(
                            tag: foods[index].photo,
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(foods[index].photo),
                                  )),
                            ),
                          ))
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: drinks.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Get.to(ProductInfoScreen(drink: drinks[index])),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  // color: Colors.black,
                  width: 220,
                  height: 321,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 10,
                        child: Container(
                          width: 190,
                          height: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    offset: Offset(2, 2),
                                    blurRadius: 5,
                                    spreadRadius: 1),
                              ],
                              color: Colors.white),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(top: 30.0),
                                  width: 150,
                                  child: Text(
                                    drinks[index].name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.center,
                                    // overflow: TextOverflow.ellipsis,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          left: 20,
                          top: 0,
                          child: Hero(
                            tag: drinks[index].photo,
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(drinks[index].photo),
                                  )),
                            ),
                          ))
                    ],
                  ),
                ),
              );
            },
          );
        }
      }
      return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: foods.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Get.to(ProductInfoScreen(food: foods[index])),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              // color: Colors.black,
              width: 220,
              height: 321,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 10,
                    child: Container(
                      width: 190,
                      height: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                offset: Offset(2, 2),
                                blurRadius: 5,
                                spreadRadius: 1),
                          ],
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 30.0),
                              width: 150,
                              child: Text(
                                foods[index].name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                                // overflow: TextOverflow.ellipsis,
                              )),
                          Container(
                              padding: EdgeInsets.only(top: 10.0),
                              width: 100,
                              child: Text(
                                '${maskedMoney(foods[index].price)}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 17),
                                textAlign: TextAlign.center,
                              )),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      left: 20,
                      top: 0,
                      child: Hero(
                        tag: foods[index].photo,
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage(foods[index].photo),
                          )),
                        ),
                      ))
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
