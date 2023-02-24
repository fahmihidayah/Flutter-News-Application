
import 'dart:convert';

import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/models/category.dart';

import '../fixtures_reader.dart';

Map<String, dynamic> getListCategoryMap() =>
    json.decode(fixture("categories_response.json"));

BaseResponse<List<Category>> getBaseResponseListCategory() {
  Map<String, dynamic> mapResponse = getListCategoryMap();
  return BaseResponse.fromJson(mapResponse,
      details: (mapResponse['details'] as List)
          .map((e) => Category.fromJson(e))
          .toList());
}
