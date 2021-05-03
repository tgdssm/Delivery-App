import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/ui/screens/cart_screen/cart_screen_controller.dart';
import 'package:delivery_app/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  final _cartScreenController = Get.put(CartScreenController());
  @override
  Widget build(BuildContext context) {
    _cartScreenController.products.forEach((element) {
      print(element['product'].name);
      print(element['size']);
      print(element['quantity']);
    });
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white54,
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              'Carrinho',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded),
              color: Colors.black,
              iconSize: 30.0,
              onPressed: () => Get.back(result: true),
            ),
          ),
          body: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidthScreen),
            child: SafeArea(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.swap_horiz_outlined,
                            size: 30.0,
                          ),
                          SizedBox(
                            width: 2.0,
                          ),
                          Text(
                            'Deslize o item para excluí-lo',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: ListView.builder(
                          itemCount: _cartScreenController.products.length,
                          itemBuilder: (context, index) {
                            final item = _cartScreenController.products[index];
                            return Dismissible(
                                key: Key(item.toString()),
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                      maxWidth: constraints.maxWidth),
                                  child: LayoutBuilder(
                                    builder: (context, constraints) {
                                      if (constraints.maxWidth <=
                                          mobileBreakPointSmallWidth) {
                                        return Card(
                                          margin: EdgeInsets.only(top: 5.0),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          child: Container(
                                            padding: EdgeInsets.all(15.0),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 80.0,
                                                  height: 80.0,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            item['product']
                                                                .photo),
                                                        fit: BoxFit.cover,
                                                      )),
                                                ),
                                                SizedBox(
                                                  width: 15.0,
                                                ),
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                    width: 100,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Container(
                                                              child: AutoSizeText(
                                                                '${item['product'].name} - ${item['size']}',
                                                                style: TextStyle(
                                                                    fontSize: 15.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                                maxLines: 2,
                                                                minFontSize: 13,
                                                                textAlign: TextAlign.center,
                                                                overflow: TextOverflow.ellipsis,
                                                              ),
                                                            ),

                                                            SizedBox(
                                                              height: 5.0,
                                                            ),
                                                            Container(
                                                              child: Text(
                                                                maskedMoney(
                                                                    item['product']
                                                                        .price),
                                                                style: TextStyle(
                                                                    fontSize: 13.0,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                    color: Theme.of(
                                                                        context)
                                                                        .primaryColor),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(height: 5.0,),
                                                        Container(
                                                          child: Align(
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            child: Container(
                                                              height: 30.0,
                                                              width: 100,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Theme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30.0),
                                                              ),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Container(
                                                                    child: IconButton(
                                                                        icon: Icon(
                                                                          Icons
                                                                              .remove,
                                                                          size:
                                                                              15,
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                        onPressed: () {}),
                                                                  ),
                                                                  Container(
                                                                    child: Text(
                                                                      '${item['quantity']}',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          fontSize:
                                                                              15.0),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    child:
                                                                        IconButton(
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .add,
                                                                        size:
                                                                            15,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                      onPressed:
                                                                          () {},
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }
                                      return Card(
                                        margin: EdgeInsets.only(top: 5.0),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0)),
                                        child: Container(
                                          padding: EdgeInsets.all(15.0),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 115.0,
                                                height: 115.0,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          item['product']
                                                              .photo),
                                                      fit: BoxFit.cover,
                                                    )),
                                              ),
                                              SizedBox(
                                                width: 15.0,
                                              ),
                                              Align(
                                                alignment: Alignment.center,
                                                child: Container(
                                                  width: 150,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Container(
                                                            child: AutoSizeText(
                                                              '${item['product'].name} - ${item['size']}',
                                                              style: TextStyle(
                                                                  fontSize: 20.0,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                              maxLines: 2,
                                                              minFontSize: 16.0,
                                                              textAlign: TextAlign.center,
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 5.0,
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              maskedMoney(
                                                                  item['product']
                                                                      .price),
                                                              style: TextStyle(
                                                                  fontSize: 18.0,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                                  color: Theme.of(
                                                                      context)
                                                                      .primaryColor),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 5.0,),
                                                      Container(
                                                        child: Align(
                                                          alignment:
                                                          Alignment.bottomCenter,
                                                          child: Container(
                                                            width: 110,
                                                            decoration: BoxDecoration(
                                                              color: Theme.of(context)
                                                                  .primaryColor,
                                                              borderRadius:
                                                              BorderRadius.circular(
                                                                  30.0),
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                              children: [
                                                                Container(
                                                                  child: IconButton(
                                                                      icon: Icon(
                                                                        Icons.remove,
                                                                        size: 20,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                      onPressed: () {}),
                                                                ),
                                                                Container(
                                                                  child: Text(
                                                                    '${item['quantity']}',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                        fontSize: 16.0),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  child: IconButton(
                                                                    icon: Icon(
                                                                      Icons.add,
                                                                      size: 20,
                                                                      color:
                                                                      Colors.white,
                                                                    ),
                                                                    onPressed: () {},
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              // Container(
                                              //   height: 75,
                                              //   width: 130,
                                              //   child: Align(
                                              //     alignment:
                                              //         Alignment.bottomCenter,
                                              //     child: Container(
                                              //       height: 35.0,
                                              //       width: 120.0,
                                              //       decoration: BoxDecoration(
                                              //         color: Theme.of(context)
                                              //             .primaryColor,
                                              //         borderRadius:
                                              //             BorderRadius.circular(
                                              //                 30.0),
                                              //       ),
                                              //       child: Row(
                                              //         mainAxisAlignment:
                                              //             MainAxisAlignment
                                              //                 .center,
                                              //         children: [
                                              //           Container(
                                              //             child: IconButton(
                                              //                 icon: Icon(
                                              //                   Icons.remove,
                                              //                   size: 20,
                                              //                   color: Colors
                                              //                       .white,
                                              //                 ),
                                              //                 onPressed: () {}),
                                              //           ),
                                              //           Container(
                                              //             child: Text(
                                              //               '${item['quantity']}',
                                              //               style: TextStyle(
                                              //                   color: Colors
                                              //                       .white,
                                              //                   fontWeight:
                                              //                       FontWeight
                                              //                           .w500,
                                              //                   fontSize: 16.0),
                                              //             ),
                                              //           ),
                                              //           Container(
                                              //             child: IconButton(
                                              //               icon: Icon(
                                              //                 Icons.add,
                                              //                 size: 20,
                                              //                 color:
                                              //                     Colors.white,
                                              //               ),
                                              //               onPressed: () {},
                                              //             ),
                                              //           ),
                                              //         ],
                                              //       ),
                                              //     ),
                                              //   ),
                                              // )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              onDismissed: (direction){
                                  if(direction == DismissDirection.endToStart){
                                    final snackBar = _cartScreenController.deleteDismissedItem(index);
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  }
                              },
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
