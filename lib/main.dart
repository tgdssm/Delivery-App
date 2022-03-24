import 'package:delivery_app/ui/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'SF Pro Rounded',
        primaryColor: Color(0xffFA4A0C),
      ),
      title: 'Food Delivery',
      home: HomeScreen(),
    );
  }
}
