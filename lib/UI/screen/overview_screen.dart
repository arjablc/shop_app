import 'package:flutter/material.dart';
import 'package:newshopapp/providers/cart_provider.dart';
import 'package:newshopapp/providers/product_provider.dart';
import 'package:provider/provider.dart';

import '../../UI/screen/cart_screen.dart';
import '../../UI/widgets/overview_grid.dart';

enum FavotiteState { allItems, onlyFavorites }

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key});

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  void goToCartScreen() {
    Navigator.of(context).pushNamed(CartScreen.routeName);
  }

  bool onlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    final int count = Provider.of<CartProvider>(context).cartItemCount;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to your Shop"),
        actions: [
          Center(
            child: GestureDetector(
              onTap: goToCartScreen,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Badge.count(
                  // label: Text('1'),
                  backgroundColor: Colors.black,
                  count: count,
                  largeSize: 20,
                  isLabelVisible: true,
                  child: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: FutureBuilder(
          future: Provider.of<ProductProvider>(context, listen: false)
              .fetchProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return const ProcductOverviewGrid(
                isShowFavorites: false,
              );
            }
            return const Text("Loading");
          }),
    );
  }
}
