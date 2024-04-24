import 'package:edspert_advance_2/constants/color_constants.dart';
import 'package:edspert_advance_2/model/product_model.dart';
import 'package:edspert_advance_2/widgets/product_list_widget.dart';
import 'package:flutter/material.dart';

class AllProductListScreen extends StatelessWidget {
  final List<Product> productList;
  const AllProductListScreen({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.edspertBlue,
        title: const Text(
          'Pilih Product',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: ProductListWidget(
        itemCount: productList.length,
        productList: productList,
      ),
    );
  }
}
