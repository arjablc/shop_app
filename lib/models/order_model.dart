import 'package:flutter/material.dart';

import 'package:newshopapp/models/cart_model.dart';

class OrderItems {
  final String id;
  final DateTime datetime;
  final List<CartItemModel> orderedItems;
  final double price;

  OrderItems({
    required this.id,
    required this.datetime,
    required this.orderedItems,
    required this.price,
  });
}
