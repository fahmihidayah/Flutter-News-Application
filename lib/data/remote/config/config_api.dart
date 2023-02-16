import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/models/configuration.dart';
import 'package:news_app/data/remote/base_api.dart';

abstract class ConfigApi extends BaseApi {
  Future<BaseResponse<List<Configuration>>> getListConfig();
}