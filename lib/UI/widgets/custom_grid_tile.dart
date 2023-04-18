import 'package:flutter/material.dart';
import '../../models/cart_provider.dart';
import 'package:provider/provider.dart';

import '../../models/product_provider.dart';
import '../screen/product_detail_screen.dart';
import '../../models/products_list_provider.dart';

class CustomGridTile extends StatelessWidget {
  const CustomGridTile({
    Key? key,
  }) : super(key: key);

  void navigateToDetailScreen(String id, BuildContext context) {
    Navigator.of(context)
        .pushNamed(ProductDetailScreen.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    final Product product = Provider.of<Product>(context, listen: false);
    final ProductsList productsList = Provider.of<ProductsList>(context);

    return GestureDetector(
      onTap: () => navigateToDetailScreen(product.id, context),
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Stack(
              children: [
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                  child: ClipRRect(
                    //*Image from network
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                      // for the smooth appearence of images
                      frameBuilder:
                          (context, child, frame, wasSynchronouslyLoaded) {
                        if (!wasSynchronouslyLoaded) {
                          return AnimatedOpacity(
                            opacity: frame == null ? 0 : 1,
                            duration: const Duration(milliseconds: 500),
                            child: child,
                          );
                        } else {
                          return child;
                        }
                      },
                    ),
                  ),
                ),
                Container(
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.8),
                            Colors.transparent
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [(0.0), (0.25)]),
                    ),
                    child: Container(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.8),
                              Colors.transparent
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.center,
                            stops: const [(0.0), (0.5)]),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10.0, 5, 10, 10),
                                child: Row(
                                  //*the icon button row
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Material(
                                      borderRadius: BorderRadius.circular(100),
                                      clipBehavior: Clip.hardEdge,
                                      color: Colors.transparent,
                                      child: IconButton(
                                        splashColor: Colors.redAccent,
                                        onPressed: () => productsList
                                            .toggleFavortie(product),
                                        icon: Consumer<Product>(
                                            builder: (context, product, child) {
                                          return Icon(product.isFavorite
                                              ? Icons.favorite
                                              : Icons.favorite_border);
                                        }),
                                      ),
                                    ),
                                    Consumer<Cart>(
                                      builder: (context, cart, child) =>
                                          Material(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: Colors.transparent,
                                        clipBehavior: Clip.hardEdge,
                                        child: IconButton(
                                            splashColor: Colors.red,
                                            onPressed: () => cart.addItem(
                                                product.id,
                                                product.price,
                                                product.name),
                                            icon: cart.isOnCart(product.id)
                                                ? const Icon(
                                                    Icons.shopping_cart)
                                                : const Icon(Icons
                                                    .shopping_cart_outlined)),
                                      ),
                                    )
                                  ],
                                )),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10.0, 0, 10, 5),
                              child: Row(
                                //* the row of the title text
                                children: [
                                  Expanded(
                                    child: Text(
                                      product.name,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ]),
                    ))
              ],
            );
          },
        ),
      ),
    );
  }
}
