import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String name;
  final int quantity;
  final double totalPrice;

  CartItem(
      {required this.id,
      required this.name,
      required this.quantity,
      this.totalPrice = 0});
}

class Cart with ChangeNotifier {}
