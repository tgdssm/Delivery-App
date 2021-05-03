import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/ui/screens/product_info_screen/product_info_screen_controller.dart';
import 'package:delivery_app/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckBoxProductSize extends StatelessWidget {
  final ProductInfoScreenController productInfoScreenController;
  final Map<String, dynamic> sizeAndPrice;
  CheckBoxProductSize({this.productInfoScreenController, this.sizeAndPrice});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Material(
              child: GetBuilder(
            init: productInfoScreenController,
            id: 'productSize',
            builder: (controller) => Radio(
                activeColor: Theme.of(context).primaryColor,
                value: sizeAndPrice,
                groupValue: productInfoScreenController.sizeAndPrice,
                onChanged: (value) {
                  productInfoScreenController.selectProductSizeAndPrice(value);
                }),
          )),
          Container(
            child: AutoSizeText(
              '${sizeAndPrice['size']} - ${maskedMoney(sizeAndPrice['price']).toString()}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              maxLines: 1,
              minFontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
