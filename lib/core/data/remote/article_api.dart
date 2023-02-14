import 'package:dio/dio.dart';
import 'package:news_app/core/data/models/Article.dart';
import 'package:news_app/core/data/models/base_response.dart';
import 'package:news_app/core/data/models/category.dart';
import 'package:news_app/core/data/remote/base_api.dart';

class ArticleApi extends BaseApi {
  Dio dio;

  ArticleApi({required this.dio});

  Future<BaseResponse<List<Category>>> getListCategories() async {
    BaseResponse<List<Category>> response = await processRequest(
        () async => await dio.get("v1/categories"),
        (rawData) => BaseResponse.fromJson(rawData,
            details: (rawData['details'] as List)
                .map((e) => Category.fromJson(e))
                .toList()));
    return response;
  }

  Future<BaseResponse<List<Article>>> getListArticle() async {
    BaseResponse<List<Article>> response = await processRequest(
        () async => await dio.get("v1/articles"),
        (rawData) => BaseResponse.fromJson(rawData,
            details: (rawData['details'] as List)
                .map((e) => Article.fromJson(e))
                .toList()));
    return response;
  }
}
