import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  RxDouble _value = 0.0.obs;
  RxInt selectedTab = 0.obs;
  late TabController tabController;

  double get tweenEndValue => this._value.value;
  set tweenEndValue(double value) => this._value.value = value;
}
