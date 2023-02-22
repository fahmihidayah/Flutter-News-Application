import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/models/category.dart';
import 'package:news_app/data/remote/category/category_api.dart';
import 'package:news_app/data/repository/category/category_repository.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final CategoryApi _categoryApi;

  CategoryRepositoryImpl(this._categoryApi) : super();

  @override
  Future<Either<Failure, BaseResponse<List<Category>>>> getListCategory() async {
    try{
      final response = await _categoryApi.getListCategories();
      return Right(response);
    }
    catch (e) {
      return Left(ServerFailure());
    }
  }

}