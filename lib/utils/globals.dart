import 'package:delivery_app/data/models/drink.dart';
import 'package:delivery_app/data/models/food.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

final pizzas = [
  Food(
      photo: 'assets/images/pizzas_screen/calabresa.png',
      name: 'Pizza de Calabresa',
      type: 'Pizza',
      price: 44.99,
      ingredients: ['Molho de tomate', 'Oregano', 'Calabresa', 'Mussarela', 'Molho de tomate', 'Oregano', 'Calabresa', 'Mussarela', ]),
  Food(
      photo: 'assets/images/pizzas_screen/cogumelo.png',
      name: 'Pizza de Cogumelo',
      type: 'Pizza',
      price: 44.99,
      ingredients: ['Molho de tomate', 'Oregano', 'Calabresa', 'Mussarela']),
  Food(
      photo: 'assets/images/pizzas_screen/cogumelo_linguica_tomate.png',
      name: 'Pizza de Cogumelo & Linguiça',
      type: 'Pizza',
      price: 44.99,
      ingredients: ['Molho de tomate', 'Oregano', 'Calabresa', 'Mussarela']),
  Food(
      photo: 'assets/images/pizzas_screen/frango_catupiry.png',
      name: 'Pizza de Frango & Catupiry',
      type: 'Pizza',
      price: 44.99,
      ingredients: ['Molho de tomate', 'Oregano', 'Calabresa', 'Mussarela']),
  Food(
      photo: 'assets/images/pizzas_screen/lombo_canadense.png',
      name: 'Pizza de Lombo Canadense',
      type: 'Pizza',
      price: 44.99,
      ingredients: ['Molho de tomate', 'Oregano', 'Calabresa', 'Mussarela']),
];

final hamburgers = [
  Food(
      photo: 'assets/images/hamburger_screen/black_bread.png',
      name: 'Dark Bread Burger',
      type: 'Hambúrguer',
      price: 44.99,
      ingredients: ['Molho de tomate', 'Oregano', 'Calabresa', 'Mussarela']),
  Food(
      photo: 'assets/images/hamburger_screen/red_bread.png',
      name: 'Red Bread Burger',
      type: 'Hambúrguer',
      price: 44.99,
      ingredients: ['Molho de tomate', 'Oregano', 'Calabresa', 'Mussarela']),
  Food(
      photo: 'assets/images/hamburger_screen/red_bread_bacon.png',
      name: 'Red Bread Bacon',
      type: 'Hambúrguer',
      price: 44.99,
      ingredients: ['Molho de tomate', 'Oregano', 'Calabresa', 'Mussarela']),
  Food(
      photo: 'assets/images/hamburger_screen/meat_cheddar.png',
      name: 'Meat & Cheddar',
      type: 'Hambúrguer',
      price: 44.99,
      ingredients: ['Molho de tomate', 'Oregano', 'Calabresa', 'Mussarela']),
  Food(
      photo: 'assets/images/hamburger_screen/vegan_burger.png',
      name: 'Vegan Burger',
      type: 'Hambúrguer',
      price: 44.99,
      ingredients: ['Molho de tomate', 'Oregano', 'Calabresa', 'Mussarela']),
];

final softDrinks = [
  Drink(
    photo: 'assets/images/soda_screen/logo_coca_cola.png',
    name: 'Coca Cola',
    price: 44.99,
    type: 'Refrigerante',
  ),
  Drink(
    photo: 'assets/images/soda_screen/logo_fanta.png',
    name: 'Fanta',
    price: 44.99,
    type: 'Refrigerante',
  ),
  Drink(
    photo: 'assets/images/soda_screen/logo_guarana_antarctica.png',
    name: 'Guaraná Antarctica',
    price: 44.99,
    type: 'Refrigerante',
  ),
  Drink(
    photo: 'assets/images/soda_screen/logo_kuat.png',
    name: 'Kuat',
    price: 44.99,
    type: 'Refrigerante',
  ),
  Drink(
    photo: 'assets/images/soda_screen/logo_sprite.png',
    name: 'Sprite',
    price: 44.99,
    type: 'Refrigerante',
  ),
];

String maskedMoney(double money) {
  final maskedController = MoneyMaskedTextController(
      precision: 2, decimalSeparator: ',', leftSymbol: 'R\$ ');
  maskedController.updateValue(money);
  return maskedController.text;
}

// Sizes
const mainButtonHeight = 70.0;

// Constraints Screen
const maxWidthScreen = 1024.0;

// BreakPoints
const mobileBreakPointSmallHeight = 570.0;
const mobileBreakPointMediumHeight = 900.0;

const mobileBreakPointSmallWidth = 300;
const mobileBreakPointMediumWidth = 400;
