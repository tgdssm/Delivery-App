import 'package:delivery_app/data/models/product.dart';
import 'package:get/get.dart';

class CartScreenController extends GetxController {
  RxList<Map<String, dynamic>> products = <Map<String, dynamic>>[].obs;
}
