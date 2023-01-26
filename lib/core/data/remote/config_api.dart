import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app/core/data/models/Configuration.dart';
import 'package:news_app/core/data/models/base_response.dart';
import 'package:news_app/core/data/remote/base_api.dart';

class ConfigApi extends BaseApi {
  Dio dio;

  ConfigApi({required this.dio});

  Future<BaseResponse<List<Configuration>>> getListConfig() async {
    // dio.get("v1/configurations").then((value) => {} ).catchError((error) => {});
    final BaseResponse<List<Configuration>> response = await processRequest(() async {
      return await dio.get("v1/configurations");
    }, (rawData) {
      return BaseResponse.fromJson(rawData,
          details: (rawData['details'] as List).map((e) => Configuration.fromJson(e)).toList());
    });
    return response;
  }

}