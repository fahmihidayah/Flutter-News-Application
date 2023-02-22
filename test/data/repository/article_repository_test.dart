

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/data/models/article.dart';
import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/remote/article/article_api.dart';
import 'package:news_app/data/repository/article/article_repository.dart';
import 'package:news_app/data/repository/article/article_repository_impl.dart';

import '../../fixtures/fixtures_reader.dart';
import 'article_repository_test.mocks.dart';

@GenerateMocks([ArticleApi])
void main() {
  MockArticleApi mockArticleApi = MockArticleApi();
  late ArticleRepository articleRepository;

  setUp(() {
    articleRepository = ArticleRepositoryImpl(articleApi: mockArticleApi);
  });

  group('get list article', () {
    final Map<String, dynamic> mapResponse = json.decode(fixture("article_response.json"));
    final BaseResponse<List<Article>> response = BaseResponse.fromJson(mapResponse,
        details: (mapResponse['details'] as List).map((e) => Article.fromJson(e)).toList()
    );

    void prepareSuccessfulResponse() {
      when(mockArticleApi.getListArticle()).thenAnswer((realInvocation) async => await Future.value(response));
    }

    test('test getListArticle method return success', () async {
      prepareSuccessfulResponse();
      final actualResponse = await articleRepository.getListArticle();
      expect(actualResponse.isRight(), true);
    });

  });

  group('getArticle', () {
    final Map<String, dynamic> mapResponse = json.decode(fixture("article_detail_response.json"));
    final BaseResponse<Article> response = BaseResponse.fromJson(mapResponse,
        details: Article.fromJson(mapResponse['details'])
    );

    void prepareSuccessfulResponse() {
      when(mockArticleApi.getArticleById('1')).thenAnswer((realInvocation) async => await Future.value(response));
    }
    test('test getArticle method return success', () async {
      prepareSuccessfulResponse();
      final actualResponse = await articleRepository.getArticleById("1");
      expect(actualResponse.isRight(), true);
    });
  });
}
