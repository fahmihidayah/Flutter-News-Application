import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/data/models/article.dart';
import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/remote/article/article_api.dart';
import 'package:news_app/data/remote/article/article_api_impl.dart';

import '../../fixtures/fixtures_reader.dart';
import 'article_api_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  MockDio mockDio = MockDio();
  late ArticleApi  articleApi;

  setUp(() {
    articleApi = ArticleApiImpl(dio: mockDio);
  });

  group("getListArticle", () {
    final Map<String, dynamic> mapResponse = json.decode(fixture("article_response.json"));
    final BaseResponse<List<Article>> response = BaseResponse.fromJson(mapResponse,
        details: (mapResponse['details'] as List).map((e) => Article.fromJson(e)).toList()
    );

    void prepareSuccessfulRequest() {
      when(mockDio.get("v1/articles")).thenAnswer((_) => Future.value(Response(
        statusCode: 200,
        data: mapResponse,
        requestOptions: RequestOptions(path: 'v1/articles')
      )));
    }

    test('request to v1/articles make sure it called', () async {
      prepareSuccessfulRequest();
      final testResponse = await articleApi.getListArticle();
      expect(testResponse.code, response.code);
    });
  });
}
