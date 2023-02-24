import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/data/models/article.dart';
import 'package:news_app/data/models/base_response.dart';

import '../../fixtures/fixtures_reader.dart';
import '../../fixtures/model/article_fixtures.dart';

void main() {

  test('test deserializer fixture file to base response list article result success', () async {

    final BaseResponse<List<Article>> response = getBaseResponseListArticle();

    expect(response.details?.isNotEmpty, true);

  });

}

