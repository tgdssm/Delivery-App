import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/data/models/drink.dart';
import 'package:delivery_app/data/models/food.dart';
import 'package:delivery_app/ui/screens/product_info_screen/product_info_screen_controller.dart';
import 'package:delivery_app/ui/screens/product_info_screen/widgets/product_size.dart';
import 'package:delivery_app/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuantityAlert extends StatefulWidget {
  final Food? food;
  final Drink? drink;
  QuantityAlert({this.food, this.drink});

  @override
  _QuantityAlertState createState() => _QuantityAlertState();
}

class _QuantityAlertState extends State<QuantityAlert>
    with TickerProviderStateMixin {

  final _controller = Get.find<ProductInfoScreenController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _controller.scaleAnimation = CurvedAnimation(
        parent: _controller.animationController,
        curve: Curves.easeInOutSine);

    // Executa a animação do início
    _controller.animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ScaleTransition(
          scale: _controller.scaleAnimation,
          child: FractionallySizedBox(
            widthFactor: .75,
            // Verifica se drink != null para que se for falso, a tela possa se
            // adaptar ao tamanho necessario para comportar o menu de tamanhos se
            // food for do tipo Pizza,
            heightFactor: ((widget.drink != null || widget.food!.type != 'Hambúrguer')
                ? constraints.maxHeight <= mobileBreakPointSmallHeight
                    ? .63
                    : .53
                : (constraints.maxHeight <= mobileBreakPointSmallHeight
                    ? .40
                    : .35)),
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
                      ? (widget.food!.type == 'Pizza')
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
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        CheckBoxProductSize(
                                          sizeAndPrice: {
                                            'size': 'P',
                                            'price': 25.0
                                          },
                                        ),
                                        CheckBoxProductSize(
                                          sizeAndPrice: {
                                            'size': 'M',
                                            'price': 35.0
                                          },
                                        ),
                                        CheckBoxProductSize(
                                          sizeAndPrice: {
                                            'size': 'G',
                                            'price': 45.0
                                          },
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
                          : Container(
                    child: Column(
                      children: [
                        Container(
                          child: AutoSizeText(
                            'Preço',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                            maxLines: 1,
                            minFontSize: 18,
                          ),
                        ),
                        SizedBox(height: 5.0,),
                        Container(
                          alignment: Alignment.center,
                          child: AutoSizeText(
                            maskedMoney(widget.food!.price!),
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 20),
                            maxLines: 1,
                            minFontSize: 18,
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        Container(
                          child: Divider(
                            color: Colors.black,
                            height: 2.0,
                          ),
                        ),
                      ],
                    ),
                  )
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
                                      sizeAndPrice: {
                                        'size': '350ml',
                                        'price': 2.0
                                      },
                                    ),
                                    CheckBoxProductSize(
                                      sizeAndPrice: {
                                        'size': '1L',
                                        'price': 7.0
                                      },
                                    ),
                                    CheckBoxProductSize(
                                      sizeAndPrice: {
                                        'size': '2L',
                                        'price': 10.0
                                      },
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
                              onPressed: _controller.subtractQuantity,
                            )),
                          ),
                        ),
                        Obx(() => Container(
                              alignment: Alignment.center,
                              width: 60,
                              child: Text(
                                '${_controller.quantity.value}',
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
                              onPressed: _controller.addQuantity,
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
                                _controller
                                    .animationController
                                    .reverse();
                                _controller
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
                                  final snackBar = _controller
                                      .addProductToCart(food: widget.food!);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                } else {
                                  final snackBar = _controller
                                      .addProductToCart(drink: widget.drink!);
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
