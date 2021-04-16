import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/ui/screens/home_screen/home_screen_controller.dart';
import 'package:delivery_app/ui/screens/home_screen/widgets/list_view_products.dart';
import 'package:delivery_app/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenSmall extends StatelessWidget {
  final HomeScreenController homeScreenController;
  HomeScreenSmall({this.homeScreenController});
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.fromLTRB(18.0, .0, 18.0, 18.0),
      color: Colors.white54,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: FractionallySizedBox(
              widthFactor: .75,
              child: AutoSizeText(
                'Comidas deliciosas para você',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 34.0),
                maxLines: 2,
              ),
            ),
          ),
          SizedBox(height: 5.0,),
          Container(
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Color(0xffEFEEEE)),
            child: FractionallySizedBox(
              widthFactor: .75,
              child: Padding(
                padding: const EdgeInsets.only(left: 1),
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Pesquisar',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none)),
                ),
              ),
            ),
          ),
          SizedBox(height: 5.0,),
          Container(
            child: Obx(() => TabBar(
                indicatorColor:
                Theme.of(context).primaryColor,
                isScrollable: true,
                onTap: (int selectedTab) {
                  homeScreenController.selectedTab.value =
                      selectedTab;
                },
                controller:
                homeScreenController.tabController,
                tabs: [
                  Tab(
                    child: Text(
                      'Pizzas',
                      style: TextStyle(
                          color: homeScreenController
                              .selectedTab.value ==
                              0
                              ? Theme.of(context).primaryColor
                              : Colors.black,
                          fontSize: 17.0,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Hambúrgueres',
                      style: TextStyle(
                          color: homeScreenController
                              .selectedTab.value ==
                              1
                              ? Theme.of(context).primaryColor
                              : Colors.black,
                          fontSize: 17.0,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Regrigerantes',
                      style: TextStyle(
                          color: homeScreenController
                              .selectedTab.value ==
                              2
                              ? Theme.of(context).primaryColor
                              : Colors.black,
                          fontSize: 17.0,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ])),
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Container(
                height: 230,
                width: MediaQuery.of(context).size.width,
                child: TabBarView(
                    controller:
                    homeScreenController.tabController,
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
          )
        ],
      ),
    );
  }
}
