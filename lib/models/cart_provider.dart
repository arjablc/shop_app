import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String name;
  final int quantity;
  final double price;

  CartItem(
      {required this.id,
      required this.name,
      required this.quantity,
      required this.price});
}

class Cart with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => {..._items};

  int get cartItemCount => _items.length;

  bool isOnCart(String prodID) {
    return _items.containsKey(prodID);
  }

  double get totalPrice {
    double helperTotalPrice = 0.0;
    _items.forEach((key, value) {
      helperTotalPrice += value.price * value.quantity;
    });
    return helperTotalPrice;
  }

  void addItem(String prodId, double price, String name) {
    if (items.containsKey(prodId)) {
      _items.update(
          prodId,
          (oldItem) => CartItem(
              id: oldItem.id,
              name: oldItem.name,
              quantity: oldItem.quantity + 1,
              price: oldItem.price));
    } else {
      _items.putIfAbsent(prodId,
          () => CartItem(id: prodId, name: name, price: price, quantity: 1));
    }
    notifyListeners();
  }

  void removeItems(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void clearItems() {
    _items.clear();
    notifyListeners();
  }

  void removeSingleItem(String id) {
    if (!_items.containsKey(id)) {
      return;
    } else if (_items[id]!.quantity == 1) {
      _items.remove(id);
    } else if (_items[id]!.quantity > 1) {
      _items.update(
          id,
          (value) => CartItem(
              id: value.id,
              name: value.name,
              quantity: value.quantity - 1,
              price: value.price));
    }
  }
}
