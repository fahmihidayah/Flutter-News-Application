import 'package:dio/dio.dart';
import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/models/category.dart';
import 'package:news_app/data/remote/base_api.dart';
import 'package:news_app/data/remote/category/category_api.dart';

class CategoryApiImpl extends CategoryApi {
  Dio dio;

  CategoryApiImpl({required this.dio});

  @override
  Future<BaseResponse<List<Category>>> getListCategories() async {
    BaseResponse<List<Category>> response = await processRequest(
            () async => await dio.get("v1/categories"),
            (rawData) => BaseResponse.fromJson(rawData,
            details: (rawData['details'] as List)
                .map((e) => Category.fromJson(e))
                .toList()));
    return response;
  }
}