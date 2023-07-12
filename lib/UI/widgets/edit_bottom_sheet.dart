import 'package:flutter/material.dart';

class ProductBottomSheet extends StatefulWidget {
  const ProductBottomSheet({
    required this.isNewItem,
    super.key,
  });
  final bool isNewItem;

  @override
  State<ProductBottomSheet> createState() => ProductBottomSheetState();
}

class ProductBottomSheetState extends State<ProductBottomSheet> {
  Widget buildVerticalSpace([double? height]) {
    return SizedBox(height: height ?? 10);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Form(
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
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              buildVerticalSpace(),
              TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Price",
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next),
              buildVerticalSpace(),
              TextFormField(
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
                    onPressed:
                        //TODO: Implement the logic for submit and cancel button
                        () => null,
                    child: const Text("Cancel"),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    onPressed:
                        //TODO: Implement the logic for submit and cancel button
                        () => null,
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
