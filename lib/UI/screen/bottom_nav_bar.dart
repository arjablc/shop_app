import 'package:flutter/material.dart';
import 'package:newshopapp/UI/screen/new_product_screen.dart';
import 'package:newshopapp/UI/screen/orders_screen.dart';

import 'overview_screen.dart';
import 'favorite_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final List _screensList = const [
    OverviewScreen(),
    NewProductScreen(),
    FavotireScreen(),
    OrderScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.grey[800],
              tooltip: 'Home Screen'),
          BottomNavigationBarItem(
              icon: const Icon(
                Icons.add,
              ),
              label: 'Add Items',
              backgroundColor: Colors.grey[800],
              tooltip: 'Home Screen'),
          BottomNavigationBarItem(
              icon: const Icon(Icons.favorite),
              label: 'Favorites',
              backgroundColor: Colors.grey[800],
              tooltip: 'Favorite Items'),
          BottomNavigationBarItem(
              icon: const Icon(
                Icons.history_rounded,
              ),
              label: 'History',
              backgroundColor: Colors.grey[800],
              tooltip: 'Home Screen'),
        ],
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
      body: _screensList[_currentIndex],
    );
  }
}
