import 'package:delivery_app/ui/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'SF Pro Rounded',
      primaryColor: Color(0xffFA4A0C),
    ),
    title: 'Food Delivery',
    home: HomeScreen(),
  ));
}

