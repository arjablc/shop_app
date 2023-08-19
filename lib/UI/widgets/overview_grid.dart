import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/product_provider.dart';
import 'custom_grid_tile.dart';

class ProcductOverviewGrid extends StatelessWidget {
  const ProcductOverviewGrid({
    Key? key,
    required this.isShowFavorites,
  }) : super(key: key);
  final bool isShowFavorites;

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    final products = isShowFavorites
        ? productData.favoriteItems
        : productData.finalListOfItems;
    return GridView.builder(
      padding: const EdgeInsets.all(5),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 8 / 10,
        crossAxisCount: 2,
      ),
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return CustomGridTile(id: products[index].id);
      },
    );
  }
}
