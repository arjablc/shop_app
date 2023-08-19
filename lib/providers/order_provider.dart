import 'package:flutter/cupertino.dart';

import '../models/cart_model.dart';
import '../models/order_model.dart';

class OrdersProvider with ChangeNotifier {
  final List<OrderItems> _items = [];
  List<OrderItems> get items => [..._items];
  void ordersPlaced(List<CartItemModel> cartItems, double price) {
    _items.insert(
        0,
        OrderItems(
            id: DateTime.now.toString(),
            datetime: DateTime.now(),
            orderedItems: cartItems,
            price: price));
  }
}
