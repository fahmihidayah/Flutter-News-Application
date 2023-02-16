import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/data/models/article.dart';
import 'package:news_app/data/models/base_response.dart';

import '../../fixtures/fixtures_reader.dart';

void main() {

  test('Deserializer from json to model', () async {
    final Map<String, dynamic> responseJsonMap =
    json.decode(fixture("article_response.json"));

    final BaseResponse<List<Article>> response = BaseResponse.fromJson(
        responseJsonMap,
        details: (responseJsonMap['details'] as List)
            .map((e) => Article.fromJson(e))
            .toList());

    expect(response.details?.length, 8);
  });

}

