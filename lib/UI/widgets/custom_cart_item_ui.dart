import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './../../models/cart_provider.dart';

class CartItemUi extends StatelessWidget {
  const CartItemUi({
    Key? key,
    required this.cartId,
    required this.name,
    required this.quantity,
    required this.price,
  }) : super(key: key);
  final String cartId;
  final String name;
  final int quantity;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 0, 5, 10),
      child: Dismissible(
        dismissThresholds: const {DismissDirection.endToStart: 0.9},
        confirmDismiss: (direction) {
          return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    backgroundColor: Colors.grey[700],
                    title: const Text('Are you sure about that??'),
                    titleTextStyle: Theme.of(context).textTheme.titleMedium,
                    actionsAlignment: MainAxisAlignment.spaceEvenly,
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text(
                            'No',
                            style: TextStyle(color: Colors.white),
                          )),
                      TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: const Text(
                            'Yes',
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ));
        },
        key: ValueKey(cartId),
        direction: DismissDirection.endToStart,
        background: Container(
          alignment: Alignment.centerRight,
          color: Colors.red,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: const Icon(
            color: Colors.white,
            Icons.delete,
            size: 40,
          ),
        ),
        onDismissed: (direction) =>
            Provider.of<Cart>(context, listen: false).removeItems(cartId),
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.grey[700],
          child: ListTile(
              title: Text(
                name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text(
                '\$ $price',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 15),
              ),
              leading: CircleAvatar(
                  backgroundColor: Colors.grey, child: Text('x$quantity')),
              trailing: const Icon(
                Icons.swipe_left_alt,
                size: 40,
              )),
        ),
      ),
    );
  }
}
