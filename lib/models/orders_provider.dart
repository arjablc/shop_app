import 'package:flutter/material.dart';

import 'package:newshopapp/models/cart_provider.dart';

class OrderItems {
  final String id;
  final DateTime datetime;
  final List<CartItem> orderedItems;
  final double price;

  OrderItems({
    required this.id,
    required this.datetime,
    required this.orderedItems,
    required this.price,
  });
}

class Orders with ChangeNotifier {
  final List<OrderItems> _items = [];
  List<OrderItems> get items => [..._items];
  void ordersPlaced(List<CartItem> cartItems, double price) {
    _items.insert(
        0,
        OrderItems(
            id: DateTime.now.toString(),
            datetime: DateTime.now(),
            orderedItems: cartItems,
            price: price));
  }
}
