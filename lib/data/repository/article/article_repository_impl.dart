import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/data/models/article.dart';
import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/models/category.dart';
import 'package:news_app/data/remote/article/article_api.dart';
import 'package:news_app/data/repository/article/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  ArticleApi articleApi;

  ArticleRepositoryImpl({required this.articleApi});

  Future<Either<Failure, BaseResponse<List<Article>>>> getListArticle() async {
    try {
      final result = await articleApi.getListArticle();
      if(result.details?.isEmpty == true) {
        return Left(EmptyDataFailure()) ;
      }
      return Right(result);
    }catch(e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, BaseResponse<Article>>> getArticleById(String id) async {
    try {
      final result = await articleApi.getArticleById(id);
      if(result.error) {
        return Left(ServerFailure());
      }
      return Right(result);
    }
    catch (e) {
      return Left(ServerFailure());
    }
  }

}