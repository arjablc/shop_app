import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/product_provider.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routeName = 'product-detail';

  const ProductDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments.toString();
    final product =
        Provider.of<ProductProvider>(context, listen: false).findById(id);

    return Scaffold(
      appBar: AppBar(
          foregroundColor: Colors.white,
          title: Text(
            product.name,
          )),
    );
  }
}
