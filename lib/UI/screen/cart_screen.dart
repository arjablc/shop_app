import 'package:flutter/material.dart';

import '../../providers/cart_provider.dart';
import '../../providers/order_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_cart_item_ui.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static const routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final double totalPrice = cart.totalPrice;
    final orders = Provider.of<OrdersProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),
      body: Column(children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.grey[700], borderRadius: BorderRadius.circular(25)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Your Total:', style: Theme.of(context).textTheme.titleMedium),
            Flexible(
              child: Chip(
                label: Text(
                  '\$ ${totalPrice.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                backgroundColor: Colors.grey[900],
              ),
            )
          ]),
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) {
            return CartItemUi(
              name: cart.items.values.toList()[index].name,
              cartId: cart.items.keys.toList()[index],
              price: cart.items.values.toList()[index].price,
              quantity: cart.items.values.toList()[index].quantity,
            );
          },
          itemCount: cart.items.values.toList().length,
        ))
      ]),
      floatingActionButton: GestureDetector(
        onTap: () {
          orders.ordersPlaced(cart.items.values.toList(), totalPrice);
          cart.clearItems();
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.075,
          width: MediaQuery.of(context).size.width * 0.35,
          padding: const EdgeInsets.all(5),
          alignment: Alignment.bottomRight,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.grey[800]),
          child: Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Icon(Icons.shopping_cart_checkout_sharp),
              Text(
                'Checkout',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 20),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
