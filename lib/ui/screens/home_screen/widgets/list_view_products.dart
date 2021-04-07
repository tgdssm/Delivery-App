import 'package:delivery_app/data/models/food.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewProducts extends StatelessWidget {
  final List<Food> foods;

  ListViewProducts({this.foods});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: foods.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          // color: Colors.black,
          width: 220,
          height: 321,
          child: Stack(
            children: [
              Positioned(
                bottom: 10,
                child: Container(
                  width: 190,
                  height: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            offset: Offset(2, 2),
                            blurRadius: 15,
                            spreadRadius: 3),
                      ],
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          padding: EdgeInsets.only(top: 30.0),
                          width: 100,
                          child: Text(
                            foods[index].name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                            // overflow: TextOverflow.ellipsis,
                          )),
                      Container(
                        padding: EdgeInsets.only(top: 10.0),
                          width: 100,
                          child: Text(
                            'R\$ ${foods[index].price}',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).primaryColor, fontSize: 17),
                            textAlign: TextAlign.center,
                          )),
                    ],
                  ),
                ),
              ),
              Positioned(
                  left: 20,
                  top: 0,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(foods[index].photo),
                    )),
                  ))
            ],
          ),
        );
      },
    );
  }
}
