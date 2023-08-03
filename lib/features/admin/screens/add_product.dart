import 'package:dotted_border/dotted_border.dart';
import 'package:ecommproject/constants/global_variables.dart';
import 'package:ecommproject/widgets/custom_button.dart';
import 'package:ecommproject/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  static const String routename = "/add-product";
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  String category = 'Mobiles';

  List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Add Product',
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    dashPattern: const [10, 4],
                    strokeCap: StrokeCap.round,
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.folder_open,
                            size: 40,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Select Product Images',
                            style: TextStyle(color: Colors.grey.shade400),
                          )
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                    textEditingController: _nameController,
                    hintText: "Product Name"),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    textEditingController: _descriptionController,
                    hintText: 'Description',
                    maxLine: 7),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  textEditingController: _priceController,
                  hintText: 'Price',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  textEditingController: _quantityController,
                  hintText: 'Quantity',
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                      value: category,
                      items: productCategories
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                      onChanged: (String? newVal) {
                        setState(() {
                          category = newVal!;
                        });
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(onTap: () {}, text: 'Sell')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
