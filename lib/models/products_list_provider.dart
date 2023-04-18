import 'package:flutter/material.dart';
import 'package:newshopapp/models/product_provider.dart';

class ProductsList with ChangeNotifier {
  //ignore: prefer_final_fields
  List<Product> _items = [
    Product(
      id: 'p1',
      name: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      name: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      name: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      name: 'A Pan with the best pan handle',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

  List<Product> get items => [..._items];

  Product findById(String id) {
    return items.firstWhere((element) => element.id == id);
  }

  final List<Product> _favoriteItems = [];

  List<Product> get favoriteItems => [..._favoriteItems];

  void toggleFavortie(Product product) {
    if (_favoriteItems.contains(product)) {
      product.isFavorite = false;
      _favoriteItems.remove(product);
    } else {
      product.isFavorite = true;
      _favoriteItems.add(product);
    }
    notifyListeners();
  }
}
