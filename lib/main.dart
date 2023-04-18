import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:newshopapp/UI/screen/cart_screen.dart';
import 'package:provider/provider.dart';

import 'UI/screen/bottom_nav_bar.dart';
import 'constants/custom_theme.dart';
import 'models/cart_provider.dart';
import 'models/products_list_provider.dart';
import 'UI/screen/product_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final customTheme = CustomTheme();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductsList()),
        ChangeNotifierProvider(create: (_) => Cart())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: customTheme.customThemeData,
          home: const BottomNavBar(),
          routes: {
            ProductDetailScreen.routeName: (_) => const ProductDetailScreen(),
            CartScreen.routeName: (_) => const CartScreen()
          }),
    );
  }
}
