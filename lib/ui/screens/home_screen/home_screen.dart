import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/ui/screens/cart_screen/cart_screen.dart';
import 'package:delivery_app/ui/screens/cart_screen/cart_screen_controller.dart';
import 'package:delivery_app/ui/screens/home_screen/home_screen_controller.dart';
import 'package:delivery_app/ui/screens/home_screen/widgets/drawer_item.dart';
import 'package:delivery_app/ui/screens/home_screen/widgets/list_view_products.dart';
import 'package:delivery_app/utils/globals.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final _homeScreenController = Get.put(HomeScreenController());
  final _cartScreenController = Get.put(CartScreenController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _homeScreenController.tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
          ),
          SafeArea(
            child: Container(
              width: 200.0,
              padding: EdgeInsets.only(top: 160.0, left: 30.0),
              color: Theme.of(context).primaryColor,
              child: ListView(
                children: [
                  DrawerItem(
                    leadingIcon: Icons.account_circle,
                    title: 'Perfil',
                    onTap: () {},
                  ),
                  DrawerItem(
                      leadingIcon: Icons.add_shopping_cart_rounded,
                      title: 'Pedidos',
                      onTap: () {}),
                  DrawerItem(
                    leadingIcon: Icons.logout,
                    title: 'Sair',
                  )
                ],
              ),
            ),
          ),
          Obx(() => TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: _homeScreenController.tweenEndValue),
              duration: Duration(milliseconds: 300),
              builder: (BuildContext _, double value, Widget __) {
                return (Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..setEntry(0, 3, 200 * value)
                    ..rotateY((pi / 6) * value),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return ScaffoldMessenger(
                        child: Scaffold(
                          appBar: AppBar(
                              backgroundColor: Colors.white54,
                              elevation: 0.0,
                              leading: IconButton(
                                icon: Icon(Icons.menu_rounded),
                                color: Colors.black,
                                iconSize: 30.0,
                                onPressed: () {
                                  _homeScreenController.tweenEndValue =
                                      _homeScreenController.tweenEndValue == 0
                                          ? 1
                                          : 0;
                                },
                              ),
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Obx(() {
                                    return _cartScreenController
                                                .products.length <=
                                            0
                                        ? IconButton(
                                            icon: Icon(
                                                Icons.shopping_cart_outlined),
                                            color: Colors.black,
                                            iconSize: 30.0,
                                            onPressed: () {
                                              Get.to(CartScreen());
                                            },
                                          )
                                        : Container(
                                            child: Stack(
                                              children: [
                                                IconButton(
                                                  icon: Icon(Icons
                                                      .shopping_cart_outlined),
                                                  color: Colors.black,
                                                  iconSize: 30.0,
                                                  onPressed: () {
                                                    Get.to(CartScreen());
                                                  },
                                                ),
                                                Positioned(
                                                  bottom: 28.0,
                                                  left: 17.0,
                                                  child: Container(
                                                    width: 15.0,
                                                    height: 15.0,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        shape: BoxShape.circle),
                                                    child: Text(
                                                      '${_cartScreenController.products.length}',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.bold,
                                                          color: Theme.of(context)
                                                              .primaryColor),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                  }),
                                ],
                              )),
                          body: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: maxWidthScreen,
                            ),
                            child: SafeArea(
                                child: Container(
                              padding: EdgeInsets.all(18.0),
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
                                        minFontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30.0),
                                        color: Color(0xffEFEEEE)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 25.0),
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
                                  Container(
                                    child: Center(
                                      child: Obx(() => TabBar(
                                              indicatorColor:
                                                  Theme.of(context).primaryColor,
                                              isScrollable: true,
                                              onTap: (int selectedTab) {
                                                _homeScreenController.selectedTab
                                                    .value = selectedTab;
                                              },
                                              controller: _homeScreenController
                                                  .tabController,
                                              tabs: [
                                                Tab(
                                                  child: Text(
                                                    'Pizzas',
                                                    style: TextStyle(
                                                        color: _homeScreenController
                                                                    .selectedTab
                                                                    .value ==
                                                                0
                                                            ? Theme.of(context)
                                                                .primaryColor
                                                            : Colors.black,
                                                        fontSize: 17.0,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                ),
                                                Tab(
                                                  child: Text(
                                                    'Hambúrgueres',
                                                    style: TextStyle(
                                                        color: _homeScreenController
                                                                    .selectedTab
                                                                    .value ==
                                                                1
                                                            ? Theme.of(context)
                                                                .primaryColor
                                                            : Colors.black,
                                                        fontSize: 17.0,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                ),
                                                Tab(
                                                  child: Text(
                                                    'Refrigerantes',
                                                    style: TextStyle(
                                                        color: _homeScreenController
                                                                    .selectedTab
                                                                    .value ==
                                                                2
                                                            ? Theme.of(context)
                                                                .primaryColor
                                                            : Colors.black,
                                                        fontSize: 17.0,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                ),
                                              ])),
                                    ),
                                  ),
                                  Flexible(
                                    child: SingleChildScrollView(
                                      child: ConstrainedBox(
                                        constraints: BoxConstraints(
                                          maxHeight: constraints.maxHeight,
                                        ),
                                        child: LayoutBuilder(
                                          builder: (context, constraints) {
                                            print(constraints.maxHeight);
                                            if (constraints.maxHeight <=
                                                mobileBreakPointSmallHeight) {
                                              return Container(
                                                height: 200,
                                                width: constraints.maxWidth,
                                                child: TabBarView(
                                                    controller:
                                                        _homeScreenController
                                                            .tabController,
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
                                              );
                                            }
                                            if (constraints.maxHeight <=
                                                mobileBreakPointMediumHeight) {
                                              return Container(
                                                height: 320,
                                                width: constraints.maxWidth,
                                                child: TabBarView(
                                                    controller:
                                                        _homeScreenController
                                                            .tabController,
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
                                              );
                                            }
                                            return Container(
                                              child: Text('deu ruim'),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  )

                                  // Flexible(
                                  //   child: SingleChildScrollView(
                                  //     child: Container(
                                  //       height: 320,
                                  //       width: double.infinity,
                                  //       child: TabBarView(
                                  //           controller:
                                  //               _homeScreenController.tabController,
                                  //           children: [
                                  //             ListViewProducts(
                                  //               foods: pizzas,
                                  //             ),
                                  //             ListViewProducts(
                                  //               foods: hamburgers,
                                  //             ),
                                  //             ListViewProducts(
                                  //               drinks: softDrinks,
                                  //             )
                                  //           ]),
                                  //     ),
                                  //   ),
                                  // )
                                ],
                              ),
                            )),
                          ),
                          bottomNavigationBar: BottomNavigationBar(
                            elevation: 0,
                            backgroundColor: Colors.white54,
                            items: [
                              BottomNavigationBarItem(
                                  icon: Icon(
                                    Icons.home_rounded,
                                    size: 35,
                                  ),
                                  label: ''),
                              BottomNavigationBarItem(
                                  icon: Icon(
                                    Icons.favorite_border_rounded,
                                    size: 35,
                                  ),
                                  label: ''),
                              BottomNavigationBarItem(
                                  icon: Icon(
                                    Icons.person_outline_rounded,
                                    size: 35,
                                  ),
                                  label: ''),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ));
              })),
          // GestureDetector(
          //   onHorizontalDragUpdate: (DragUpdateDetails dragUpdateDetails) {
          //     if (dragUpdateDetails.delta.dx > 0) {
          //       setState(() {
          //         _homeScreenController.value = 1;
          //       });
          //     } else {
          //       setState(() {
          //         _homeScreenController.value = 0;
          //       });
          //     }
          //   },
          // )
        ],
      ),
    );
  }
}
