import 'dart:convert';

class Product {
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

  void toggleFavorite() {
    isFavorite = !isFavorite;
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
      'isFavorite': isFavorite,
    };
  }

  static List<Product> productsFromJson(String source) {
    List<Product> list = [];
    final decodedData = json.decode(source) as Map<String, dynamic>;
    decodedData.forEach((key, value) {
      list.add(Product.fromMap(key, value));
    });
    return list;
  }

  factory Product.fromMap(String id, Map<String, dynamic> map) {
    return Product(
        id: id,
        name: map["name"],
        price: map["price"],
        imageUrl: map["imageUrl"],
        description: map["description"],
        isFavorite: map["isFavorite"]);
  }

  String toJson() => json.encode(toMap());
}
