import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  RxDouble _value = 0.0.obs;
  TabController tabController;
  int selectedTab = 0;

  double get tweenEndValue => this._value.value;
  set tweenEndValue(double value) => this._value.value = value;
}
