import 'package:flutter/material.dart';
import 'package:newshopapp/UI/screen/bottom_nav_bar.dart';
import 'package:newshopapp/constants/custom_theme.dart';
import 'package:newshopapp/models/products_list_provider.dart';

import 'package:provider/provider.dart';

import 'UI/screen/product_detail_screen.dart';
import 'UI/screen/overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final customTheme = CustomTheme();
    return ChangeNotifierProvider(
      create: (_) => ProductsList(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: customTheme.customThemeData,
          home: const BottomNavBar(),
          routes: {
            ProductDetailScreen.routeName: (_) => const ProductDetailScreen(),
          }),
    );
  }
}
