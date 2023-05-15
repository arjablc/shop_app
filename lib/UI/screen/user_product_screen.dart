import 'package:flutter/material.dart';
import 'package:newshopapp/UI/widgets/user_products.dart';
import 'package:provider/provider.dart';

import '../../models/products_list_provider.dart';

class UserProductScreen extends StatelessWidget {
  const UserProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductsList>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("User Products")),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 5, 10, 10),
        child: ListView.builder(
          itemCount: productData.items.length,
          itemBuilder: (BuildContext context, int index) {
            return UserProductItem(
              name: productData.items[index].name,
              imageUrl: productData.items[index].imageUrl,
              price: productData.items[index].price,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.grey[600],
        elevation: 0,
        child: const Icon(Icons.add),
      ),
    );
  }
}
