import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/ui/screens/product_info_screen/product_info_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckBoxProductSize extends StatelessWidget {
  final ProductInfoScreenController productInfoScreenController;
  final String size;
  CheckBoxProductSize({this.productInfoScreenController, this.size});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Material(
              child: GetBuilder(
            init: productInfoScreenController,
            id: 'productSize',
            builder: (controller) => Radio(
                activeColor: Theme.of(context).primaryColor,
                value: size,
                groupValue: productInfoScreenController.productSize,
                onChanged: (value) {
                  productInfoScreenController.selectProductSize(value);
                }),
          )),
          Container(
            child: AutoSizeText(
              size,
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
