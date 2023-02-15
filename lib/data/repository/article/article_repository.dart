import 'package:news_app/core/data/models/Article.dart';
import 'package:news_app/data/models/base_response.dart';

abstract class ArticleRepository {
  Future<BaseResponse<List<Article>>> getListArticle();
}