import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/data/models/article.dart';
import 'package:news_app/data/models/base_response.dart';

abstract class ArticleRepository {
  Future<Either<Failure, BaseResponse<List<Article>>>> getListArticle();
  Future<Either<Failure, BaseResponse<Article>>> getArticleById(String id);
}