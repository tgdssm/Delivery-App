import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/data/models/food.dart';
import 'package:delivery_app/ui/screens/product_info_screen/product_info_screen_controller.dart';
import 'package:delivery_app/ui/screens/product_info_screen/widgets/quantity_alert.dart';
import 'package:delivery_app/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app/data/models/drink.dart';

class ProductInfoScreenContent extends StatefulWidget {
  const ProductInfoScreenContent({
    Key? key,
    this.food,
    this.drink,
  }) : super(key: key);

  final Food? food;
  final Drink? drink;

  @override
  State<ProductInfoScreenContent> createState() => _ProductInfoScreenContentState();
}

class _ProductInfoScreenContentState extends State<ProductInfoScreenContent> {
  final _controller = Get.find<ProductInfoScreenController>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxHeight <= mobileBreakPointSmallHeight) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white54,
                elevation: 0.0,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                  ),
                  onPressed: () => Get.back(),
                  color: Colors.black,
                  iconSize: 30.0,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.favorite_border_rounded),
                      onPressed: () {},
                      color: Colors.black,
                      iconSize: 30.0,
                    ),
                  ],
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                widget.food != null
                    ? Container(
                        padding: EdgeInsets.all(
                          18.0,
                        ),
                        color: Colors.white54,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Hero(
                              tag: widget.food!.photo,
                              child: Container(
                                width: 240,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(widget.food!.photo),
                                      fit: BoxFit.scaleDown),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Column(
                              children: [
                                Container(
                                  width: constraints.maxWidth,
                                  padding: EdgeInsets.symmetric(horizontal: 25),
                                  alignment: Alignment.center,
                                  child: AutoSizeText(
                                    widget.food!.name,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 25),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    minFontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                              ],
                            ),
                            Container(
                                child: FractionallySizedBox(
                              widthFactor: .85,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                elevation: 1,
                                shadowColor: Colors.grey.withOpacity(0.5),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.food_bank_rounded,
                                              size: 30,
                                            ),
                                            SizedBox(
                                              width: 5.0,
                                            ),
                                            Text(
                                              'Ingredientes',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.only(left: 35.0),
                                        child: AutoSizeText(
                                          '${_controller.ingredients(widget.food!.ingredients)}.',
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 17),
                                          maxLines: 2,
                                          minFontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                            Container(
                                child: FractionallySizedBox(
                              widthFactor: .85,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                elevation: 1,
                                shadowColor: Colors.grey.withOpacity(0.5),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.timer_rounded,
                                              size: 30.0,
                                            ),
                                            SizedBox(
                                              width: 5.0,
                                            ),
                                            Text(
                                              'Tempo de entrega',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.only(left: 35.0),
                                        child: AutoSizeText(
                                          '50 - 60 minutos.',
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 17),
                                          maxLines: 1,
                                          minFontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              height: mainButtonHeight,
                              child: FractionallySizedBox(
                                widthFactor: .85,
                                child: MaterialButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return QuantityAlert(
                                            food: widget.food);
                                      },
                                    );
                                  },
                                  child: Text(
                                    'Adicionar ao carrinho',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  textColor: Colors.white,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    : Container(
                        padding: EdgeInsets.all(
                          18.0,
                        ),
                        color: Colors.white54,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Hero(
                              tag: widget.drink!.photo,
                              child: Container(
                                width: 240,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(widget.drink!.photo),
                                      fit: BoxFit.scaleDown),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Column(
                              children: [
                                Container(
                                  width: constraints.maxWidth,
                                  padding: EdgeInsets.symmetric(horizontal: 25),
                                  alignment: Alignment.center,
                                  child: AutoSizeText(
                                    widget.drink!.name,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 25),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    minFontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                              ],
                            ),
                            Container(
                                child: FractionallySizedBox(
                              widthFactor: .85,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                elevation: 1,
                                shadowColor: Colors.grey.withOpacity(0.5),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.food_bank_rounded,
                                              size: 30,
                                            ),
                                            SizedBox(
                                              width: 5.0,
                                            ),
                                            Text(
                                              'Ingredientes',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                            Container(
                                child: FractionallySizedBox(
                              widthFactor: .85,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                elevation: 1,
                                shadowColor: Colors.grey.withOpacity(0.5),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.timer_rounded,
                                              size: 30.0,
                                            ),
                                            SizedBox(
                                              width: 5.0,
                                            ),
                                            Text(
                                              'Tempo de entrega',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.only(left: 35.0),
                                        child: AutoSizeText(
                                          '50 - 60 minutos.',
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 17),
                                          maxLines: 1,
                                          minFontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              height: mainButtonHeight,
                              child: FractionallySizedBox(
                                widthFactor: .85,
                                child: MaterialButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return QuantityAlert(
                                            drink: widget.drink);
                                      },
                                    );
                                  },
                                  child: Text(
                                    'Adicionar ao carrinho',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  textColor: Colors.white,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
              ]))
            ],
          );
        }
        if (constraints.maxHeight <= mobileBreakPointMediumHeight) {
          return widget.food != null
              ? Container(
                  padding: EdgeInsets.all(
                    15.0,
                  ),
                  color: Colors.white54,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Hero(
                        tag: widget.food!.photo,
                        child: Container(
                          width: 235,
                          height: 235,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(widget.food!.photo),
                                fit: BoxFit.scaleDown),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            alignment: Alignment.center,
                            child: AutoSizeText(
                              widget.food!.name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 25),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              minFontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                        ],
                      ),
                      Container(
                          child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        elevation: 1,
                        shadowColor: Colors.grey.withOpacity(0.5),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.food_bank_rounded,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      'Ingredientes',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 35.0),
                                child: AutoSizeText(
                                  '${_controller.ingredients(widget.food!.ingredients)}.',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 17),
                                  maxLines: 3,
                                  minFontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                      Container(
                          child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        elevation: 1,
                        shadowColor: Colors.grey.withOpacity(0.5),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.timer_rounded,
                                      size: 30.0,
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      'Tempo de entrega',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 35.0),
                                child: Text(
                                  '50 - 60 minutos.',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        height: mainButtonHeight,
                        child: MaterialButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return QuantityAlert(
                                    food: widget.food);
                              },
                            );
                          },
                          child: Text(
                            'Adicionar ao carrinho',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          textColor: Colors.white,
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    ],
                  ),
                )
              : Container(
                  padding: EdgeInsets.all(
                    15.0,
                  ),
                  color: Colors.white54,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Hero(
                        tag: widget.drink!.photo,
                        child: Container(
                          width: 235,
                          height: 235,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(widget.drink!.photo),
                                fit: BoxFit.scaleDown),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            alignment: Alignment.center,
                            child: AutoSizeText(
                              widget.drink!.name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 25),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              minFontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                        ],
                      ),
                      Container(
                          child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        elevation: 1,
                        shadowColor: Colors.grey.withOpacity(0.5),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.timer_rounded,
                                      size: 30.0,
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      'Tempo de entrega',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 35.0),
                                child: Text(
                                  '50 - 60 minutos.',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        height: mainButtonHeight,
                        child: MaterialButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return QuantityAlert(
                                    drink: widget.drink);
                              },
                            );
                          },
                          child: Text(
                            'Adicionar ao carrinho',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          textColor: Colors.white,
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    ],
                  ),
                );
        }
        return ListView(
          children: [
            Container(
              padding: EdgeInsets.all(
                18.0,
              ),
              color: Colors.white54,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Hero(
                    tag: widget.food!.photo,
                    child: Container(
                      width: 240,
                      height: 240,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.food!.photo),
                            fit: BoxFit.scaleDown),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        alignment: Alignment.center,
                        child: Text(
                          widget.food!.type != 'Hambúrguer'
                              ? '${widget.food!.type} de ${widget.food!.name}'
                              : widget.food!.name,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 25),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        alignment: Alignment.center,
                        child: Text(
                          maskedMoney(widget.food!.price!),
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  Container(
                      child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    elevation: 1,
                    shadowColor: Colors.grey.withOpacity(0.5),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.food_bank_rounded,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  'Ingredientes',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 35.0),
                            child: Text(
                              '${_controller.ingredients(widget.food!.ingredients)}.',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
                  Container(
                      child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    elevation: 1,
                    shadowColor: Colors.grey.withOpacity(0.5),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.timer_rounded,
                                  size: 30.0,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  'Tempo de entrega',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 35.0),
                            child: Text(
                              '50 - 60 minutos.',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    height: 70.0,
                    child: MaterialButton(
                      onPressed: () {
                        _controller.addProductToCart(
                            food: widget.food);
                      },
                      child: Text(
                        'Adicionar ao carrinho',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      textColor: Colors.white,
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
