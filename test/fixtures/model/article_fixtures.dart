
import 'dart:convert';

import 'package:news_app/data/models/article.dart';
import 'package:news_app/data/models/base_response.dart';
import '../fixtures_reader.dart';

Map<String, dynamic> getListArticleMap() => json.decode(fixture("article_response.json"));
Map<String, dynamic> getArticleMap() => json.decode(fixture("article_detail_response.json"));

BaseResponse<List<Article>> getBaseResponseListArticle() {
  final mapResponse = getListArticleMap();
  return BaseResponse.fromJson(mapResponse, details:
  (mapResponse['details'] as List).map((e) => Article.fromJson(e)).toList()
  );
}

BaseResponse<Article> getBaseResponseArticle() {
  final mapResponse = getArticleMap();
  return BaseResponse.fromJson(mapResponse, details:
  Article.fromJson(mapResponse['details']));
}


