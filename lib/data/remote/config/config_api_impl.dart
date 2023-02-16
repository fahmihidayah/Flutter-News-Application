import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/models/configuration.dart';
import 'package:news_app/data/remote/base_api.dart';
import 'package:news_app/data/remote/config/config_api.dart';

class ConfigApiImpl extends ConfigApi {
  Dio dio;

  ConfigApiImpl({required this.dio});

  @override
  Future<BaseResponse<List<Configuration>>> getListConfig() async {
    final BaseResponse<List<Configuration>> response = await processRequest(() async {
      return await dio.get("v1/configurations");
    }, (rawData) {
      return BaseResponse.fromJson(rawData,
          details: (rawData['details'] as List).map((e) => Configuration.fromJson(e)).toList());
    });
    return response;
  }

}