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
  // ignore: prefer_final_fields
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => {..._items};

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
  }
}
