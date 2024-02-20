import 'package:bubble_tea_tutorial/models/drink.dart';
import 'package:flutter/material.dart';

class BubbleTeaShop extends ChangeNotifier {
  // list of drinks for sale
  final List<Drink> _shop = [
    // pearl milk tea
    Drink(
      imapePath: 'assets/images/bubble_tea.png',
      name: "Pearl Tea",
      price: "16.5",
    ),
    Drink(
      imapePath: 'assets/images/chocolate_tea.png',
      name: "Choco Tea",
      price: "25.8",
    ),
    Drink(
      imapePath: 'assets/images/cream_tea.png',
      name: "Cream Tea",
      price: "19.3",
    ),
    Drink(
      imapePath: 'assets/images/green_tea.png',
      name: "Green Tea",
      price: "11.0",
    ),
    Drink(
      imapePath: 'assets/images/taro_tea.png',
      name: "Taro Tea",
      price: "41.25",
    ),
  ];

  // list of drinks in user's cart
  List<Drink> _userCart = [];

  // get drinks for sale
  List<Drink> get shop => _shop;

  // get user cart
  List<Drink> get cart => _userCart;

  // add drink to cart
  void addToCart(Drink drink) {
    cart.add(drink);
    notifyListeners();
  }

  // remove drink from cart
  void removeFromCart(Drink drink) {
    cart.remove(drink);
    notifyListeners();
  }
}
