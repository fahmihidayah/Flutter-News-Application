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
import '../../fixtures/model/article_fixtures.dart';
import 'article_api_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  MockDio mockDio = MockDio();
  late ArticleApi  articleApi;

  setUp(() {
    articleApi = ArticleApiImpl(dio: mockDio);
  });

  group("getListArticle", () {
    final Map<String, dynamic> mapResponse = getListArticleMap();
    final BaseResponse<List<Article>> response = getBaseResponseListArticle();

    void prepareSuccessfulRequest() {
      when(mockDio.get("v1/articles")).thenAnswer((_) => Future.value(Response(
        statusCode: 200,
        data: mapResponse,
        requestOptions: RequestOptions(path: 'v1/articles')
      )));
    }

    test('test request to v1/articles response success', () async {
      prepareSuccessfulRequest();
      final testResponse = await articleApi.getListArticle();
      expect(testResponse.details?.length, response.details?.length);
    });
  });

  group('getArticle', () {
    final Map<String, dynamic> mapResponse = getArticleMap();
    final BaseResponse<Article> response = getBaseResponseArticle();

    void prepareSuccessfulRequest() {
      when(mockDio.get("v1/article/1")).thenAnswer((_) => Future.value(Response(
          statusCode: 200,
          data: mapResponse,
          requestOptions: RequestOptions(path: 'v1/article/1')
      )));
    }

    test('test request to v1/article/1 response success', () async {
      prepareSuccessfulRequest();
      final testResponse = await articleApi.getArticleById("1");
      expect(testResponse.details?.title, response.details?.title);
    });
  });
}
