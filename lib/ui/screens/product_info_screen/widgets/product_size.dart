import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/ui/screens/product_info_screen/product_info_screen_controller.dart';
import 'package:delivery_app/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckBoxProductSize extends StatefulWidget {
  final Map<String, dynamic> sizeAndPrice;
  CheckBoxProductSize({required this.sizeAndPrice});

  @override
  State<CheckBoxProductSize> createState() => _CheckBoxProductSizeState();
}

class _CheckBoxProductSizeState extends State<CheckBoxProductSize> {
  final _controller = Get.find<ProductInfoScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Material(
              child: GetBuilder(
            init: _controller,
            id: 'productSize',
            builder: (controller) => Radio<Map<String, dynamic >>(
                activeColor: Theme.of(context).primaryColor,
                value: widget.sizeAndPrice,
                groupValue: _controller.sizeAndPrice,
                onChanged: (Map<String, dynamic >? value) {
                  _controller.selectProductSizeAndPrice(value);
                }),
          )),
          Container(
            child: AutoSizeText(
              '${widget.sizeAndPrice['size']} - ${maskedMoney(widget.sizeAndPrice['price']).toString()}',
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
