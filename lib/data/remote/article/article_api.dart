import 'dart:ffi';

import 'package:news_app/data/models/article.dart';
import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/remote/base_api.dart';

abstract class ArticleApi extends BaseApi {

  Future<BaseResponse<List<Article>>> getListArticle();
  Future<BaseResponse<Article>> getArticleById(Long id);
}