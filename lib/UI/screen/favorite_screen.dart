import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/products_list_provider.dart';
import '../widgets/overview_grid.dart';

class FavotireScreen extends StatelessWidget {
  const FavotireScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductsList>(context);
    final bool isAnyFavorite = productData.favoriteItems.isEmpty ? false : true;
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: isAnyFavorite
          ? const ProcductOverviewGrid(
              isShowFavorites: true,
            )
          : Center(
              child: Text(
                "There are no Favorite Items",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
    );
  }
}
