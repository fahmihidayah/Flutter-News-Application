import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:news_app/data/models/article.dart';
import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/remote/article/article_api.dart';

class ArticleApiImpl extends ArticleApi {
  Dio dio;

  ArticleApiImpl({required this.dio});

  @override
  Future<BaseResponse<Article>> getArticleById(String id) async {
    final BaseResponse<Article> response = await processRequest(() async {
      return await dio.get('v1/article/$id');
    },
        (rawData) => BaseResponse.fromJson(rawData,
            details: Article.fromJson(rawData['details'])));
    return response;
  }

  @override
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
