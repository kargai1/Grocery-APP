import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    ["apple", "20.0", "assets/images/apple.jpeg", Colors.red],
    ["banana", "25.0", "assets/images/banana.jpeg", Colors.yellow],
    ["grapgefruit", "30.0", "assets/images/grapefruit.webp", Colors.orange],
    ["pineapple", "50.0", "assets/images/pineapple.jpeg", Colors.green],
  ];
  List _cartItems = [];
  get shopItems => _shopItems;

  get cartItems => _cartItems;

  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String calculateTotal() {
    double totalprice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalprice += double.parse(_cartItems[i][1]);
    }
    return totalprice.toStringAsFixed(2);
  }
}
