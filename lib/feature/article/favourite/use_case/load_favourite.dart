import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/data/models/article.dart';
import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/repository/article/article_repository.dart';

abstract class LoadFavourite
    extends UseCase<BaseResponse<List<Article>>, NoParams> {}

class LoadFavouriteImpl extends LoadFavourite {
  final ArticleRepository articleRepository;

  LoadFavouriteImpl({required this.articleRepository});

  @override
  Future<Either<Failure, BaseResponse<List<Article>>>> call(
      NoParams params) async {
    return await articleRepository.getListArticle();
  }
}
