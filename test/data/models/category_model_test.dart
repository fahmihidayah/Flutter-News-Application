import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/models/category.dart';

import '../../fixtures/fixtures_reader.dart';
import '../../fixtures/model/categories_fixtures.dart';

void main() {
  test('test deserializer fixture file to base response list category result success', () async {
    final BaseResponse<List<Category>> response = getBaseResponseListCategory();
    expect(response.details?.isNotEmpty, true);
  });
}
