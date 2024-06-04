import 'package:flutter/material.dart';
import '../widgets/custom_orders.dart';
import '../../providers/order_provider.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});
  static const routeName = '/orders-screen';

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<OrdersProvider>(context).items;
    bool isEmpty = orders.isEmpty;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Order History'),
      ),
      body: isEmpty
          ? Center(
              child: Text(
              "Buy some items first.!!",
              style: Theme.of(context).textTheme.titleMedium,
            ))
          : ListView.builder(
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
