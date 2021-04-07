import 'package:delivery_app/data/models/food.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewProducts extends StatelessWidget {
  List<Food> foods;

  ListViewProducts({this.foods});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: foods.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          width: 220,
          height: 321,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  width: 220,
                  height: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(foods[index].name),
                      Text('R\$ ${foods[index].price}'),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 30,
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
