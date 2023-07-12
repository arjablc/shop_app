import 'package:flutter/material.dart';

import 'product_provider.dart';

class UserProductsList with ChangeNotifier {
  final List<Product> _userProductList = [
    Product(
        id: 'u1',
        name: "Dummy User Product",
        description: "Just a product made to check the logic of the app",
        imageUrl:
            'https://img.freepik.com/free-photo/book-composition-with-open-book_23-2147690555.jpg',
        price: 100.00)
  ];

  List<Product> get userProductList => [..._userProductList];

  void addUserProduct(Product userProduct) {
    _userProductList.add(userProduct);
  }

  Product getUserProductById(String id) {
    return _userProductList.firstWhere((element) => element.id == id);
  }
}
