import 'package:news_app/core/data/models/Configuration.dart';
import 'package:news_app/core/data/models/base_response.dart';
import 'package:news_app/core/data/remote/config_api.dart';

class ConfigRepository {

  ConfigApi configApi;

  ConfigRepository({required this.configApi});

  Future<BaseResponse<List<Configuration>>> getListConfig() async {
    return await configApi.getListConfig();
  }
}