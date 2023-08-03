import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  void navigateToAddProduct() {
    Navigator.pushNamed(context, '/add-product');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Product screen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToAddProduct,
        tooltip: 'Add a product',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
