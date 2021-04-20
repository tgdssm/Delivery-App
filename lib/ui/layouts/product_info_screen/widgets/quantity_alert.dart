import 'package:delivery_app/data/models/drink.dart';
import 'package:delivery_app/data/models/food.dart';
import 'package:delivery_app/ui/screens/product_info_screen/product_info_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuantityAlert extends StatelessWidget {
  final ProductInfoScreenController productInfoScreenController;
  final Food food;
  final Drink drink;
  QuantityAlert({this.productInfoScreenController, this.food, this.drink});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        title: Column(
          children: [
            Container(
              child: Text(
                'Escolha a quantidade',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: 70.0,
                      child: MaterialButton(
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        onPressed: productInfoScreenController.subtractQuantity,
                      )),
                  Obx(() => Container(
                        alignment: Alignment.center,
                        width: 60,
                        child: Text(
                          '${productInfoScreenController.quantity.value}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      )),
                  Container(
                      width: 70.0,
                      child: MaterialButton(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        onPressed: productInfoScreenController.addQuantity,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(child: Divider( color: Colors.black, height: 2.0,),),
            SizedBox(
              height: 10.0,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      width: 70.0,
                      child: MaterialButton(
                        child: Icon(
                          Icons.cancel,
                          color: Colors.white,
                        ),
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        onPressed: () => Get.back(result: true),
                      )),
                  SizedBox(
                    width: 10.0,
                  ),
                  Container(
                      width: 70.0,
                      child: MaterialButton(
                        child: Icon(
                          Icons.done,
                          color: Colors.white,
                        ),
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        onPressed: () {
                          if (food != null) {
                            productInfoScreenController.addProductToCart(food: food);
                          }else{
                            productInfoScreenController.addProductToCart(drink: drink);
                          }
                        },
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
