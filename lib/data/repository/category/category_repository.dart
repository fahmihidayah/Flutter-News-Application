import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/models/category.dart';

abstract class CategoryRepository {
  Future<Either<Failure, BaseResponse<List<Category>>>> getListCategory();
}