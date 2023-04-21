import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'dart:math';

import '../../models/cart_provider.dart';

class CustomOrdersUi extends StatefulWidget {
  const CustomOrdersUi({
    Key? key,
    required this.id,
    required this.price,
    required this.orders,
    required this.dateTime,
  }) : super(key: key);

  final String id;
  final double price;
  final List<CartItem> orders;
  final DateTime dateTime;

  @override
  State<CustomOrdersUi> createState() => _CustomOrdersUiState();
}

class _CustomOrdersUiState extends State<CustomOrdersUi> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.grey[700],
        child: Column(
          children: [
            ListTile(
              title: Text(
                DateFormat('E h:m').format(widget.dateTime),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text(
                DateFormat('yyyy/MM/dd').format(widget.dateTime),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 15),
              ),
              leading: Chip(
                label: Text(
                  '\$ ${widget.price.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                backgroundColor: Colors.grey[900],
              ),
              trailing: IconButton(
                icon: isExpanded
                    ? const Icon(
                        Icons.expand_less_rounded,
                        color: Colors.white,
                      )
                    : const Icon(Icons.expand_more_rounded,
                        color: Colors.white),
                onPressed: () => setState(() {
                  isExpanded = !isExpanded;
                }),
              ),
            ),
            if (isExpanded)
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(10)),
                height: min(MediaQuery.of(context).size.height * 0.15,
                    widget.orders.length * 35),
                child: ListView.builder(
                  itemCount: widget.orders.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Row(children: [
                        Text(
                          '\$ ${widget.orders[index].price}',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: 15),
                        ),
                        Text(
                          ' X${widget.orders[index].quantity}',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w100, fontSize: 15),
                        )
                      ]),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
