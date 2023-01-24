import 'package:news_app/core/data/remote/config_api.dart';

class ConfigRepository {

  ConfigApi configApi;

  ConfigRepository({required this.configApi});

  void getListConfig() {
    configApi.getListConfig();
  }
}