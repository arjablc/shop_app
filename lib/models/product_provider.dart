import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  String id;
  String name;
  String description;
  String imageUrl;
  double price;
  bool isFavorite;

  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.imageUrl,
      required this.price,
      this.isFavorite = false});
}
