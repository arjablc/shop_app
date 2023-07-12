import 'package:flutter/material.dart';
import 'package:newshopapp/models/product_provider.dart';
import 'package:newshopapp/models/products_list_provider.dart';
// import 'package:newshopapp/models/user_product_provider.dart';
import 'package:provider/provider.dart';

class ProductBottomSheet extends StatefulWidget {
  const ProductBottomSheet({
    required this.isNewItem,
    this.id,
    super.key,
  });
  final bool isNewItem;
  final String? id;

  @override
  State<ProductBottomSheet> createState() => ProductBottomSheetState();
}

class ProductBottomSheetState extends State<ProductBottomSheet> {
  Widget buildVerticalSpace([double? height]) {
    return SizedBox(height: height ?? 10);
  }

  Product? currentUserProduct;

  bool isCurrentProduct(String? id) {
    return (id != null) ? true : false;
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void saveForm() {
    _formKey.currentState!.save();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.id != null) {
      currentUserProduct =
          Provider.of<ProductsList>(context).findById(widget.id!);
    }
    return Container(
      padding: const EdgeInsets.all(20),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textScaleFactor: MediaQuery.of(context).textScaleFactor,
                widget.isNewItem ? "New Product" : "Edit Product",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 25),
              ),
              buildVerticalSpace(20),
              TextFormField(
                initialValue:
                    isCurrentProduct(widget.id) ? currentUserProduct!.name : "",
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              buildVerticalSpace(),
              TextFormField(
                  initialValue: isCurrentProduct(widget.id)
                      ? currentUserProduct!.price.toString()
                      : "",
                  decoration: const InputDecoration(
                    labelText: "Price",
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next),
              buildVerticalSpace(),
              TextFormField(
                initialValue: isCurrentProduct(widget.id)
                    ? currentUserProduct!.description
                    : "",
                maxLines: 10,
                minLines: 3,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                    labelText: "Description",
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    alignLabelWithHint: true),
                textInputAction: TextInputAction.newline,
              ),
              buildVerticalSpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel"),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    onPressed: saveForm,
                    child: const Text("Submit"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
