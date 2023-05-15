import 'package:flutter/material.dart';

class UserProductItem extends StatefulWidget {
  const UserProductItem({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.price,
  }) : super(key: key);
  final String name;
  final String imageUrl;
  final double price;

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
          widget.name,
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
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      scrollable: true,
                      backgroundColor: Colors.grey[700],
                      elevation: 0,
                      title: Text(
                        "Edit your product",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 20),
                      ),
                      content: Form(
                        child: SingleChildScrollView(
                          child: Column(children: [
                            // const Text("Edit your Product"),
                            TextFormField(
                              decoration: InputDecoration(
                                  // hintText: "Name:",
                                  labelText: "Name of your product",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                            ),
                            TextFormField(),
                            TextFormField(
                              keyboardType: TextInputType.number,
                            )
                          ]),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                    ),
                    onPressed: () => null),
              ],
            )),
      ),
    );
  }
}
