import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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

  List<Product> fetchedProductList = [];
  Future<void> fetchProducts() async {
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

  Future<void> addUserProduct(Product product) async {
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

  void removeUserProduct(String id) async {
    try {
      http.Response response =
          await http.delete(Uri.parse("$baseProductUrl/$id.json"));
      if (response.statusCode != 200) {
        return;
      }
    } catch (error) {
      debugPrint(error.toString());
    }
    final currentProduct = findById(id);
    if (_products.contains(currentProduct)) {
      _products.remove(currentProduct);
      notifyListeners();
    }
    return;
  }

  List<Product> get favoriteProducts =>
      _products.where((element) => element.isFavorite == true).toList();

  void toggleFavorite() {
    //TODO implement the toggle favorites method
  }

  Future<void> updateProduct(Product product) async {
    try {
      http.Response response = await http.patch(
          Uri.parse("$baseProductUrl/${product.id}.json"),
          body: product.toJson());
      if (response.statusCode != 200) {
        return;
      }
    } catch (error) {
      debugPrint(error.toString());
    }

    notifyListeners();
  }
}
