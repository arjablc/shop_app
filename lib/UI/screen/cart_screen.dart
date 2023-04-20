import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:newshopapp/models/cart_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_cart_item_ui.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static const routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final double totalPrice = cart.totalPrice;
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
                  '\$ $totalPrice',
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
    );
  }
}
