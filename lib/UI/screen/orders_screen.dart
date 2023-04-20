import 'package:flutter/material.dart';
import 'package:newshopapp/UI/widgets/custom_orders.dart';
import 'package:provider/provider.dart';

import '../../models/orders_provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});
  static const routeName = '/orders-screen';

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context).items;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Order History'),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomOrdersUi(
              id: orders[index].id,
              price: orders[index].price,
              orders: orders[index].orderedItems,
              dateTime: orders[index].datetime);
        },
      ),
    );
  }
}
