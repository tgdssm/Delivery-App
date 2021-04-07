import 'package:delivery_app/ui/screens/home_screen/home_screen_controller.dart';
import 'package:delivery_app/ui/screens/home_screen/widgets/drawer_item.dart';
import 'package:delivery_app/ui/screens/home_screen/widgets/list_view_products.dart';
import 'package:delivery_app/utils/test_providers.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final _homeScreenController = HomeScreenController();

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
          TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: _homeScreenController.value),
              duration: Duration(milliseconds: 300),
              builder: (BuildContext _, double value, Widget __) {
                return (Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..setEntry(0, 3, 200 * value)
                    ..rotateY((pi / 6) * value),
                  child: Scaffold(
                    appBar: AppBar(
                        backgroundColor: Colors.grey[100],
                        elevation: 0.0,
                        leading: IconButton(
                          icon: Icon(Icons.menu_rounded),
                          color: Colors.black,
                          iconSize: 30.0,
                          onPressed: () {
                            setState(() {
                              _homeScreenController.value =
                                  _homeScreenController.value == 0 ? 1 : 0;
                            });
                          },
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: Icon(Icons.shopping_cart_outlined),
                              color: Colors.black,
                              iconSize: 30.0,
                              onPressed: () {},
                            ),
                          ],
                        )),
                    body: SafeArea(
                      child: Container(
                        padding: EdgeInsets.all(18.0),
                        color: Colors.white54,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              width: 185,
                              height: 82,
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Comidas deliciosas para você',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 34.0),
                              ),
                            ),
                            Container(
                              height: 60,
                              width: 314,
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
                              child: TabBar(
                                  indicatorColor:
                                      Theme.of(context).primaryColor,
                                  isScrollable: true,
                                  onTap: (int selectedTab) {
                                    setState(() {
                                      _homeScreenController.selectedTab =
                                          selectedTab;
                                    });
                                  },
                                  controller:
                                      _homeScreenController.tabController,
                                  tabs: [
                                    Tab(
                                      child: Text(
                                        'Pizzas',
                                        style: TextStyle(
                                            color: _homeScreenController
                                                        .selectedTab ==
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
                                            color: _homeScreenController
                                                        .selectedTab ==
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
                                            color: _homeScreenController
                                                        .selectedTab ==
                                                    2
                                                ? Theme.of(context).primaryColor
                                                : Colors.black,
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ]),
                            ),
                            Flexible(
                              child: SingleChildScrollView(
                                child: Container(
                                  height: 321,
                                  width: MediaQuery.of(context).size.width,
                                  child: TabBarView(
                                      controller:
                                          _homeScreenController.tabController,
                                      children: [
                                        ListViewProducts(foods: pizzas,),
                                        Text('Hambúrgueres'),
                                        Text('Regrigerantes'),
                                      ]),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    bottomNavigationBar: BottomNavigationBar(
                      items: [
                        BottomNavigationBarItem(icon: Icon(Icons.home_rounded, size: 35,), label: ''),
                        BottomNavigationBarItem(icon: Icon(Icons.favorite_border_rounded, size: 35,), label: ''),
                        BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded, size: 35,), label: ''),
                      ],
                    ),
                  ),
                ));
              }),
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
