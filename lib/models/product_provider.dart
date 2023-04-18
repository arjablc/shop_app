import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  bool isFavorite;

  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.imageUrl,
      required this.price,
      this.isFavorite = false});
}
