import 'package:flutter/material.dart';

import 'edit_bottom_sheet.dart';

class UserProductItem extends StatefulWidget {
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

  @override
  State<UserProductItem> createState() => _UserProductItemState();
}

class _UserProductItemState extends State<UserProductItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.grey[700],
      child: ListTile(
        leading: CircleAvatar(
            backgroundImage: NetworkImage(widget.imageUrl), radius: 30),
        title: Text(
          maxLines: 1,
          widget.name,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          "\$ ${widget.price}",
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
                    useSafeArea: false,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Colors.grey[800],
                    builder: ((context) => Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: ProductBottomSheet(
                            isNewItem: false,
                            id: widget.id,
                          ),
                        )),
                  ),
                ),
                IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                    ),
                    onPressed: () {}),
              ],
            )),
      ),
    );
  }
}
