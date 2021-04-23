import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/data/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreenController extends GetxController {
  RxList<Map<String, dynamic>> products = <Map<String, dynamic>>[].obs;
  Map<String, dynamic> backupItem;

  SnackBar deleteDismissedItem(int index) {
    backupItem = products.removeAt(index);
    final snackBar = SnackBar(
      content: Container(
        child: Row(
          children: [
          AutoSizeText(
          'Produto removido',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          textAlign: TextAlign.center,
          maxLines: 1,
          minFontSize: 15,
        ),
            FlatButton(onPressed: () {}, child:  AutoSizeText(
              'Restaurar',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.center,
              maxLines: 1,
              minFontSize: 15,
            ),)
          ],
        ),
      ),
      backgroundColor: Colors.red,
    );
    return snackBar;
  }
}
