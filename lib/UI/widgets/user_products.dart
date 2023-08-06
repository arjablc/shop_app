import 'package:flutter/material.dart';
import 'package:newshopapp/models/products_list_provider.dart';
import 'package:provider/provider.dart';

import 'edit_bottom_sheet.dart';

class UserProductItem extends StatelessWidget {
  const UserProductItem({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.id,
  }) : super(key: key);
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

  @override
  Widget build(BuildContext context) {
    return Card(
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
                    onPressed: () =>
                        Provider.of<ProductsList>(context, listen: false)
                            .removeUserProduct(id)),
              ],
            )),
      ),
    );
  }
}
