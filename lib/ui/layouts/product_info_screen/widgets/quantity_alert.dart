import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/data/models/drink.dart';
import 'package:delivery_app/data/models/food.dart';
import 'package:delivery_app/ui/layouts/product_info_screen/widgets/product_size.dart';
import 'package:delivery_app/ui/screens/product_info_screen/product_info_screen_controller.dart';
import 'package:delivery_app/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuantityAlert extends StatefulWidget {
  final ProductInfoScreenController productInfoScreenController;
  final Food food;
  final Drink drink;
  QuantityAlert({this.productInfoScreenController, this.food, this.drink});

  @override
  _QuantityAlertState createState() => _QuantityAlertState();
}

class _QuantityAlertState extends State<QuantityAlert>
    with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.productInfoScreenController.animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    widget.productInfoScreenController.scaleAnimation = CurvedAnimation(
        parent: widget.productInfoScreenController.animationController,
        curve: Curves.easeInOutSine);

    // Executa a animação do início
    widget.productInfoScreenController.animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ScaleTransition(
          scale: widget.productInfoScreenController.scaleAnimation,
          child: FractionallySizedBox(
            widthFactor: .75,
            // Verifica se drink != null para que se for falso, a tela possa se
            // adaptar ao tamanho necessario para comportar o menu de tamanhos se
            // food for do tipo Pizza,
            heightFactor: ((widget.drink != null)
                ? constraints.maxHeight <= mobileBreakPointSmallHeight
                    ? .63
                    : .53
                : (widget.food.type == 'Pizza')
                    ? (constraints.maxHeight <= mobileBreakPointSmallHeight
                        ? .47
                        : .40)
                    : (constraints.maxHeight <= mobileBreakPointSmallHeight
                        ? .35
                        : .25)),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0)),
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Se drink for nulo verifica o tipo de food
                  // Se for Pizza, abre o menu de tamanhos, se não, mostra a tela padrão
                  // Se drink for diferente de nulo,  abre o menu de tamanhos
                  widget.drink == null
                      ? (widget.food.type == 'Pizza')
                          ? Container(
                              child: Column(
                                children: [
                                  Container(
                                    child: AutoSizeText(
                                      'Escolha o tamanho',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                      maxLines: 1,
                                      minFontSize: 18,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        CheckBoxProductSize(
                                          productInfoScreenController: widget
                                              .productInfoScreenController,
                                          size: 'P',
                                        ),
                                        CheckBoxProductSize(
                                          productInfoScreenController: widget
                                              .productInfoScreenController,
                                          size: 'M',
                                        ),
                                        CheckBoxProductSize(
                                          productInfoScreenController: widget
                                              .productInfoScreenController,
                                          size: 'G',
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Divider(
                                      color: Colors.black,
                                      height: 2.0,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container()
                      : Container(
                          child: Column(
                            children: [
                              Container(
                                child: AutoSizeText(
                                  'Escolha o tamanho',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                  maxLines: 1,
                                  minFontSize: 18,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CheckBoxProductSize(
                                      productInfoScreenController:
                                          widget.productInfoScreenController,
                                      size: '350ml',
                                    ),
                                    CheckBoxProductSize(
                                      productInfoScreenController:
                                          widget.productInfoScreenController,
                                      size: '1L',
                                    ),
                                    CheckBoxProductSize(
                                      productInfoScreenController:
                                          widget.productInfoScreenController,
                                      size: '2L',
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Divider(
                                  color: Colors.black,
                                  height: 2.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                  Container(
                    child: AutoSizeText(
                      'Escolha a quantidade',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                      maxLines: 1,
                      minFontSize: 18,
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ConstrainedBox(
                          constraints:
                              BoxConstraints(maxWidth: constraints.maxWidth),
                          child: FractionallySizedBox(
                            widthFactor: .2,
                            child: Container(
                                child: MaterialButton(
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              color: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              onPressed: widget
                                  .productInfoScreenController.subtractQuantity,
                            )),
                          ),
                        ),
                        Obx(() => Container(
                              alignment: Alignment.center,
                              width: 60,
                              child: Text(
                                '${widget.productInfoScreenController.quantity.value}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                            )),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints(maxWidth: constraints.maxWidth),
                          child: FractionallySizedBox(
                            widthFactor: .2,
                            child: Container(
                                child: MaterialButton(
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              color: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              onPressed: widget
                                  .productInfoScreenController.addQuantity,
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Divider(
                      color: Colors.black,
                      height: 2.0,
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ConstrainedBox(
                          constraints:
                              BoxConstraints(maxWidth: constraints.maxWidth),
                          child: FractionallySizedBox(
                            widthFactor: .2,
                            child: Container(
                                child: MaterialButton(
                              child: Icon(
                                Icons.cancel,
                                color: Colors.white,
                              ),
                              color: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              onPressed: () {
                                // Executa a animação de modo reverso(do final para o início)
                                widget.productInfoScreenController
                                    .animationController
                                    .reverse();
                                widget.productInfoScreenController
                                    .animationController
                                    .dispose();
                                Get.back(result: true);
                              },
                            )),
                          ),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints(maxWidth: constraints.maxWidth),
                          child: FractionallySizedBox(
                            widthFactor: .2,
                            child: Container(
                                child: MaterialButton(
                              child: Icon(
                                Icons.done,
                                color: Colors.white,
                              ),
                              color: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              onPressed: () async {
                                if (widget.food != null) {
                                  final snackBar = widget
                                      .productInfoScreenController
                                      .addProductToCart(food: widget.food);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                } else {
                                  final snackBar = widget
                                      .productInfoScreenController
                                      .addProductToCart(drink: widget.drink);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              },
                            )),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
