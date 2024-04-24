import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:edspert_advance_2/model/product_model.dart';

class ProductRepository {
  Future<List<Product>> getProductList() async {
    try {
      const url = 'http://makeup-api.herokuapp.com/';
      const path = 'api/v1/products.json';
      final queryParams = {'brand': 'maybelline'};

      final response =
          await Dio().get('$url$path', queryParameters: queryParams);

      log('Response getProductList = ${response.data}');
      final data =
          List.from(response.data).map((e) => Product.fromJson(e)).toList();

      return data;
    } catch (e, stackTrace) {
      log('Error at getProductList: ${e.toString()}', stackTrace: stackTrace);

      return [];
    }
  }
}
