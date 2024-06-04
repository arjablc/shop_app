import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//find by id
//fetchedProductList
//addUserProduct
//remove user product
//updateProduct
//favoriteProduct
const String baseUrl = "http://localhost:5173";

class ProductProvider extends ChangeNotifier {
  final baseUri = Uri.parse(baseUrl);
  //get all products
  void fetchProducts() async {
    final response = await http.get(baseUri);
    if (response.statusCode == 200) {}
  }
}
