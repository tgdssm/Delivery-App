import 'package:delivery_app/data/models/drink.dart';
import 'package:delivery_app/data/models/food.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

final pizzas = [
  Food(
      photo: 'assets/images/pizzas_screen/calabresa.png',
      name: 'Calabresa',
      price: 44.99,
      ingredients: ['Molho de tomate', 'Oregano', 'Calabresa', 'Mussarela']),
  Food(
      photo: 'assets/images/pizzas_screen/cogumelo.png',
      name: 'Cogumelo',
      price: 44.99,
      ingredients: ['Molho de tomate', 'Oregano', 'Calabresa', 'Mussarela']),
  Food(
      photo: 'assets/images/pizzas_screen/cogumelo_linguica_tomate.png',
      name: 'Cogumelo & Linguiça',
      price: 44.99,
      ingredients: ['Molho de tomate', 'Oregano', 'Calabresa', 'Mussarela']),
  Food(
      photo: 'assets/images/pizzas_screen/frango_catupiry.png',
      name: 'Frango & Catupiry',
      price: 44.99,
      ingredients: ['Molho de tomate', 'Oregano', 'Calabresa', 'Mussarela']),
  Food(
      photo: 'assets/images/pizzas_screen/lombo_canadense.png',
      name: 'Lombo Canadense',
      price: 44.99,
      ingredients: ['Molho de tomate', 'Oregano', 'Calabresa', 'Mussarela']),
];

final hamburgers = [
  Food(
      photo: 'assets/images/hamburger_screen/black_bread.png',
      name: 'Dark Bread Burger',
      price: 44.99,
      ingredients: ['Molho de tomate', 'Oregano', 'Calabresa', 'Mussarela']),
  Food(
      photo: 'assets/images/hamburger_screen/red_bread.png',
      name: 'Red Bread Burger',
      price: 44.99,
      ingredients: ['Molho de tomate', 'Oregano', 'Calabresa', 'Mussarela']),
  Food(
      photo: 'assets/images/hamburger_screen/red_bread_bacon.png',
      name: 'Red Bread Bacon',
      price: 44.99,
      ingredients: ['Molho de tomate', 'Oregano', 'Calabresa', 'Mussarela']),
  Food(
      photo: 'assets/images/hamburger_screen/meat_cheddar.png',
      name: 'Meat & Cheddar',
      price: 44.99,
      ingredients: ['Molho de tomate', 'Oregano', 'Calabresa', 'Mussarela']),
  Food(
      photo: 'assets/images/hamburger_screen/vegan_burger.png',
      name: 'Vegan Burger',
      price: 44.99,
      ingredients: ['Molho de tomate', 'Oregano', 'Calabresa', 'Mussarela']),
];

final softDrinks = [
  Drink(
    photo: 'assets/images/soda_screen/coca_cola_2_litros.png',
    name: 'Coca Cola',
    price: 44.99,
  ),
  Drink(
    photo: 'assets/images/soda_screen/fanta_uva_2_litros.png',
    name: 'Fanta Uva',
    price: 44.99,
  ),
  Drink(
    photo: 'assets/images/soda_screen/guarana_antartica_2_litros.png',
    name: 'Guaraná Antarctica',
    price: 44.99,
  ),
  Drink(
    photo: 'assets/images/soda_screen/kuat_2_litros.png',
    name: 'Kuat',
    price: 44.99,
  ),
  Drink(
    photo: 'assets/images/soda_screen/sukita_laranja_2_litros.png',
    name: 'Sukita Laranja',
    price: 44.99,
  ),
];

String maskedMoney(double money) {
  final maskedController = MoneyMaskedTextController(
      precision: 2, decimalSeparator: ',', leftSymbol: 'R\$ ');
  maskedController.updateValue(money);
  return maskedController.text;
}
