import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/models/category.dart';

import '../../fixtures/fixtures_reader.dart';

void main() {
  test('Test deserializer authoer model', () async {
    final Map<String, dynamic> responseJsonMap =
        json.decode(fixture("categories_response.json"));
    final BaseResponse<List<Category>> response = BaseResponse.fromJson(
        responseJsonMap,
        details: (responseJsonMap['details'] as List)
            .map((e) => Category.fromJson(e))
            .toList());
    expect(response.details?.length, 3);
  });
}
