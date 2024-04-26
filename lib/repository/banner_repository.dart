import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:edspert_advance_2/constants/api_constants.dart';
import 'package:edspert_advance_2/model/banner_model.dart';

class BannerRepository {
  Future<BannerResponse> getBannerList() async {
    try {
      final bannerPath = '${ApiContants.apiUrl}${ApiContants.bannerPath}';
      final queryParameters = {'limit': 5};
      final response = await Dio().get(
        bannerPath,
        queryParameters: queryParameters,
        options: Options(headers: ApiContants.headers),
      );

      final data = BannerResponse.fromJson(response.data);

      return data;
    } catch (e, stackTrace) {
      log('Error at getBannerList: ${e.toString()}', stackTrace: stackTrace);
      return BannerResponse();
    }
  }
}
