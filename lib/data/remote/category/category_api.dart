import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/models/category.dart';
import 'package:news_app/data/remote/base_api.dart';

abstract class CategoryApi extends BaseApi {
  Future<BaseResponse<List<Category>>> getListCategories();
}