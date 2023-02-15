import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:news_app/core/data/models/Article.dart';
import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/models/category.dart';
import 'package:news_app/data/remote/article/article_api.dart';
import 'package:news_app/data/remote/base_api.dart';

class ArticleApiImpl extends ArticleApi  {
  Dio dio;

  ArticleApiImpl({required this.dio});

  @override
  Future<BaseResponse<Article>> getArticleById(Long id) async {
    return BaseResponse(code : 0, details : Article(), error: false, message : "");
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
