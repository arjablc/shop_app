import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductProvider with ChangeNotifier {
  String baseProductUrl =
      "https://shop-app-68146-default-rtdb.asia-southeast1.firebasedatabase.app/products";
  //ignore: prefer_final_fields
  List<Product> _products = [];

  List<Product> get productList => [..._products];

//!For when there are different users in our app and we need to access the products of the current user
//*Or this can be done in the backend ??
  // List<Product> userProducts (String userId) {
  //   return _products.where((element) => element.userId = userId);
  // };

  Product findById(String id) {
    return _products.firstWhere((element) => element.id == id);
  }

  List<Product> fetchProductList = [];
  Future<void> fetchUserProduct() async {
    try {
      http.Response response =
          await http.get(Uri.parse("$baseProductUrl.json"));
      if (response.statusCode != 200 || response.body == "Null") {
        return;
      }

      _products = Product.productsFromJson(response.body);
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  void addUserProduct(Product product) async {
    try {
      http.Response response = await http
          .post(Uri.parse("$baseProductUrl.json"), body: product.toJson());
      product.id = json.decode(response.body)["name"];
    } catch (error) {
      debugPrint(error.toString());
    }

    _products.add(product);
    notifyListeners();
  }

  void removeUserProduct(String id) {
    final currentProduct = findById(id);
    if (_products.contains(currentProduct)) {
      _products.remove(currentProduct);
      notifyListeners();
    }
    return;
  }

  final List<Product> _favoriteItems = [];

  List<Product> get favoriteItems => [..._favoriteItems];

  void toggleFavortie(Product product) {
    if (_favoriteItems.contains(product)) {
      _favoriteItems.remove(product);
    } else {
      _favoriteItems.add(product);
    }
    product.toggleFavorite();
    notifyListeners();
  }

  void updateUi() {
    notifyListeners();
  }
}
