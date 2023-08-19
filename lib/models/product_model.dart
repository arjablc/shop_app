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
}
