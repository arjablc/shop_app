import 'package:flutter/material.dart';
import '../../providers/product_provider.dart';
import 'package:provider/provider.dart';

import 'edit_bottom_sheet.dart';

class UserProductItem extends StatelessWidget {
  const UserProductItem({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.id,
  });
  final String name;
  final String imageUrl;
  final double price;
  final String id;

  static const noImage = 'assets/images/img_error.png';

  ImageProvider buildBackgroundImage(String url, String filePath) {
    if (url.isEmpty) {
      return AssetImage(filePath);
    }
    return NetworkImage(url);
  }

  void removeProduct(BuildContext context) {
    Provider.of<ProductProvider>(context, listen: false).removeUserProduct(id);
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      behavior: HitTestBehavior.translucent,
      background: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(20)),
        alignment: Alignment.centerRight,
        child: const Icon(Icons.delete),
      ),
      key: ValueKey(id),
      onDismissed: (_) => removeProduct(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.grey[700],
        child: ListTile(
          leading: CircleAvatar(
              backgroundImage: buildBackgroundImage(imageUrl, noImage),
              radius: 30),
          title: Text(
            maxLines: 1,
            name,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: Text(
            "\$ $price",
            style:
                Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 15),
          ),
          trailing: SizedBox(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => showModalBottomSheet(
                      context: context,
                      isDismissible: true,
                      useSafeArea: true,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.grey[800],
                      builder: ((context) => SafeArea(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              child: ProductEditSheet(
                                isNewProduct: false,
                                productId: id,
                              ),
                            ),
                          )),
                    ),
                  ),
                  IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.redAccent,
                      ),
                      onPressed: () => removeProduct(context)),
                ],
              )),
        ),
      ),
    );
  }
}
