import 'package:flutter/material.dart';
import 'package:newshopapp/UI/widgets/edit_bottom_sheet.dart';
import 'package:newshopapp/UI/widgets/user_products.dart';
import 'package:newshopapp/models/products_list_provider.dart';
// import 'package:newshopapp/models/user_product_provider.dart';
import 'package:provider/provider.dart';

// import '../../models/products_list_provider.dart';

class UserProductScreen extends StatelessWidget {
  const UserProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductsList>(context).userProducts;
    return Scaffold(
      appBar: AppBar(title: const Text("User Products")),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 5, 10, 10),
        child: ListView.builder(
          itemCount: productData.length,
          itemBuilder: (BuildContext context, int index) {
            return UserProductItem(
              id: productData[index].id,
              name: productData[index].name,
              imageUrl: productData[index].imageUrl,
              price: productData[index].price,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          isDismissible: true,
          useSafeArea: false,
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.grey[800],
          context: context,
          builder: (context) => Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: const ProductBottomSheet(
              isNewItem: true,
            ),
          ),
        ),
        backgroundColor: Colors.grey[600],
        elevation: 0,
        child: const Icon(Icons.add),
      ),
    );
  }
}
