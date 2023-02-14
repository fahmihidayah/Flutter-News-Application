import 'package:news_app/core/data/models/Article.dart';
import 'package:news_app/core/data/models/base_response.dart';
import 'package:news_app/core/data/models/category.dart';
import 'package:news_app/core/data/remote/article_api.dart';

class ArticleRepository {
  ArticleApi articleApi;

  ArticleRepository({required this.articleApi});

  Future<BaseResponse<List<Category>>> getListCategories() async {
    return await articleApi.getListCategories();
  }

  Future<BaseResponse<List<Article>>> getListArticle() async {
    return await articleApi.getListArticle();
  }

}