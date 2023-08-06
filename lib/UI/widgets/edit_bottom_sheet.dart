// import 'dart:js_interop';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newshopapp/helpers/user_product_form_validator.dart';
import 'package:newshopapp/models/product_provider.dart';
import 'package:newshopapp/models/products_list_provider.dart';
import 'package:provider/provider.dart';

class ProductEditSheet extends StatefulWidget {
  const ProductEditSheet({
    Key? key,
    required this.productId,
    required this.isNewProduct,
  }) : super(key: key);
  final String productId;
  final bool isNewProduct;

  @override
  State<ProductEditSheet> createState() => _ProductEditSheetState();
}

class _ProductEditSheetState extends State<ProductEditSheet> {
  late Product currentProduct;
  File? _pickedImage;
  bool changeOldProductImage = false;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  //Init state
  @override
  void initState() {
    currentProduct = widget.isNewProduct
        ? Product(id: '', name: '', description: '', imageUrl: '', price: 0)
        : Provider.of<ProductsList>(context, listen: false)
            .findById(widget.productId);
    super.initState();
  }

  Widget verticalSpace() {
    return const SizedBox(
      height: 20,
    );
  }

// Image picker function
  Future _pickImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }
    setState(() {
      _pickedImage = File(image.path);
    });
  }

// dispose
  @override
  void dispose() {
    super.dispose();
  }

  Widget previewImage(bool newItem) {
    if (newItem) {
      if (_pickedImage == null) {
        return const Icon(Icons.add);
      } else {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.file(
            _pickedImage!,
            fit: BoxFit.cover,
          ),
        );
      }
    }
    return currentProduct.imageUrl.isEmpty
        ? const Icon(Icons.add)
        : !changeOldProductImage
            ? ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  currentProduct.imageUrl,
                  fit: BoxFit.cover,
                ),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: _pickedImage == null
                    ? Image.network(currentProduct.imageUrl)
                    : Image.file(
                        _pickedImage!,
                        fit: BoxFit.cover,
                      ),
              );
  }

  void buttonSubmit() {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
      if (widget.isNewProduct) {
        Provider.of<ProductsList>(context, listen: false)
            .addUserProduct(currentProduct);
      }
      Provider.of<ProductsList>(context, listen: false).updateUi();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 0),
      child: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.isNewProduct ? "New Prodcut" : "Edit Product",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              verticalSpace(),
              //name
              TextFormField(
                maxLength: 100,
                initialValue: currentProduct.name,
                validator: UserProductValidation.validateName,
                decoration: const InputDecoration(
                  counterStyle: TextStyle(color: Colors.white),
                  labelText: "Name",
                ),
                textInputAction: TextInputAction.next,
                onSaved: (newValue) {
                  currentProduct.name = newValue!;
                },
              ),
              verticalSpace(),
              //description
              TextFormField(
                initialValue: currentProduct.description,
                keyboardType: TextInputType.multiline,
                maxLines: 7,
                minLines: 3,
                decoration: const InputDecoration(
                    labelText: "Description", alignLabelWithHint: true),
                onSaved: (newValue) {
                  if (newValue == null) {
                    return;
                  }
                  currentProduct.description = newValue;
                },
              ),

              verticalSpace(),
              //Price
              TextFormField(
                initialValue: currentProduct.price.toString(),
                decoration: const InputDecoration(labelText: "Price"),
                keyboardType: TextInputType.number,
                validator: UserProductValidation.validatePrice,
                onSaved: (newValue) {
                  currentProduct.price = double.parse(newValue!);
                },
              ),
              verticalSpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          changeOldProductImage =
                              widget.isNewProduct ? false : true;
                        });
                        _pickImageFromGallery();
                      },
                      child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: Colors.grey,
                                width: 2,
                                style: BorderStyle.solid),
                          ),
                          child: previewImage(widget.isNewProduct)),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: TextFormField(
                      initialValue: currentProduct.imageUrl,
                      decoration: const InputDecoration(labelText: "Image Url"),
                      onSaved: (newValue) {
                        if (newValue == null) {
                          return;
                        }
                        currentProduct.imageUrl = newValue;
                      },
                    ),
                  )
                ],
              ),
              verticalSpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    style:
                        TextButton.styleFrom(backgroundColor: Colors.grey[850]),
                    child: const Text("Cancel"),
                  ),
                  TextButton(
                      onPressed: buttonSubmit, child: const Text("Submit"))
                ],
              ),
              verticalSpace()
            ],
          ),
        ),
      ),
    );
  }
}
