import 'package:flutter/material.dart';
import 'package:newshopapp/UI/widgets/overview_grid.dart';

enum FavotiteState { allItems, onlyFavorites }

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key});

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  void toggelFavotires(bool value) {}

  bool onlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to your Shop"),
        actions: [
          PopupMenuButton(
            color: Colors.white,
            itemBuilder: (_) => [
              PopupMenuItem(
                  value: FavotiteState.allItems,
                  child: CheckboxMenuButton(
                      value: onlyFavorites,
                      onChanged: (value) => toggelFavotires,
                      child: const Text('All Items'))),
              PopupMenuItem(
                  value: FavotiteState.onlyFavorites,
                  child: CheckboxMenuButton(
                      value: onlyFavorites,
                      onChanged: (value) => toggelFavotires,
                      child: const Text('Only Favorite Items')))
            ],
            icon: const Icon(Icons.more_vert),
          )
        ],
      ),
      body: const ProcductOverviewGrid(
        isShowFavorites: false,
      ),
    );
  }
}
