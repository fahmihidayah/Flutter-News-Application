import 'dart:convert';

import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/models/configuration.dart';

import '../fixtures_reader.dart';

Map<String, dynamic> getListConfigurationMap() => json.decode(fixture("configurations_response.json"));

BaseResponse<List<Configuration>> getBaseResponseListConfiguration() {
  final mapResponse = getListConfigurationMap();
  return BaseResponse.fromJson(
      mapResponse,
      details: (mapResponse['details'] as List)
          .map((e) => Configuration.fromJson(e))
          .toList());
}