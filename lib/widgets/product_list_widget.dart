import 'package:edspert_advance_2/model/product_model.dart';
import 'package:edspert_advance_2/screens/product_detail.dart';
import 'package:flutter/material.dart';

class ProductListWidget extends StatelessWidget {
  final int itemCount;
  final List<Product> productList;
  const ProductListWidget({
    super.key,
    required this.itemCount,
    required this.productList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: itemCount,
      shrinkWrap: true,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final product = productList[index];

        return InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              // return CourseDetail(
              //   course: courseResponse?.data?[index] ??
              //       CourseData());
              return ProductDetail(product: product);
            },
          )),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.network(
                    product.imageLink ?? '',
                    width: 70,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                      child: Text(
                    product.name ?? 'No Course Name',
                  )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
