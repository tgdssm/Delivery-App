import 'package:delivery_app/ui/screens/home_screen/home_screen_controller.dart';
import 'package:delivery_app/ui/screens/home_screen/widgets/list_view_products.dart';
import 'package:delivery_app/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabBarViewHomeScreen extends StatefulWidget {

  TabBarViewHomeScreen({Key? key});

  @override
  State<TabBarViewHomeScreen> createState() => _TabBarViewHomeScreenState();
}

class _TabBarViewHomeScreenState extends State<TabBarViewHomeScreen> {
  final _controller = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        print(constraints.maxHeight);
        if (constraints.maxHeight <= 570){
          return Column(
            children: [
              Flexible(
              child: SingleChildScrollView(
                child: Container(
                  height: 230,
                  width: constraints.maxWidth,
                  child: TabBarView(
                      controller: _controller.tabController,
                      children: [
                        ListViewProducts(
                          foods: pizzas,
                        ),
                        ListViewProducts(
                          foods: hamburgers,
                        ),
                        ListViewProducts(
                          drinks: softDrinks,
                        )
                      ]),
                ),
              ),
        ),
            ],
          );
        }
        return Container(child: Text('deu ruim'),);
      },
    );
  }
}
