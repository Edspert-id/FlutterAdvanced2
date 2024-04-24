import 'package:edspert_advance_2/model/course_model.dart';
import 'package:edspert_advance_2/model/product_model.dart';
import 'package:edspert_advance_2/repository/course_repository.dart';
import 'package:edspert_advance_2/repository/product_repository.dart';
import 'package:edspert_advance_2/screens/all_product_list_screen.dart';
import 'package:edspert_advance_2/widgets/product_list_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final courseRepository = CourseRepository();
  CourseResponse? courseResponse;

  final productRepository = ProductRepository();
  List<Product> productList = [];

  @override
  void initState() {
    getProductList();
    super.initState();
  }

  void getProductList() async {
    productList = await productRepository.getProductList();
    setState(() {});
  }

  void getCourseList() async {
    courseResponse = await courseRepository.getCourseList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hai, Altop',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
            Text(
              'Selamat Datang',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: CircleAvatar(radius: 16),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Pilih Product',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AllProductListScreen(
                                  productList: productList),
                            ));
                      },
                      child: const Text('Lihat Semua'))
                ],
              ),
              _buildProductListWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductListWidget() {
    final productCount = productList.length > 3 ? 3 : productList.length;

    return (productList.isEmpty)
        ? const CircularProgressIndicator()
        : ProductListWidget(itemCount: productCount, productList: productList);
  }
}
