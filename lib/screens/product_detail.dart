import 'package:edspert_advance_2/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(product.name ?? 'No Name'),
          Text(product.description ?? '-'),
        ],
      ),
    );
  }
}
