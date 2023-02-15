import 'package:news_app/core/data/models/Article.dart';
import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/models/category.dart';
import 'package:news_app/data/remote/article/article_api.dart';
import 'package:news_app/data/repository/article/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  ArticleApi articleApi;

  ArticleRepositoryImpl({required this.articleApi});

  Future<BaseResponse<List<Article>>> getListArticle() async {
    return await articleApi.getListArticle();
  }

}