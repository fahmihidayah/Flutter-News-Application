import 'dart:convert';

import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/models/category.dart';
import 'package:news_app/data/models/user.dart';

import '../fixtures_reader.dart';

Map<String, dynamic> getUserMap() =>
    json.decode(fixture("auth_response.json"));

BaseResponse<User> getBaseResponseUser() {
  final mapResponse = getUserMap();
  return BaseResponse.fromJson(mapResponse,
      details: User.fromJson(mapResponse['details']));
}
