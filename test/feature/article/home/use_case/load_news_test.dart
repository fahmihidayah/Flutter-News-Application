import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/data/models/article.dart';
import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/repository/article/article_repository.dart';
import 'package:news_app/feature/article/home/use_case/load_news.dart';

import '../../../../fixtures/model/article_fixtures.dart';
import 'load_news_test.mocks.dart';

@GenerateMocks([ArticleRepository])
void main() {
  MockArticleRepository mockArticleRepository = MockArticleRepository();
  late LoadNews loadNews;

  setUp(() {
    loadNews = LoadNewsImpl(articleRepository: mockArticleRepository);
  });

  group('loadNews', () {
    final BaseResponse<List<Article>> baseResponse = getBaseResponseListArticle();

    void prepareSuccessResponse() {
      when(mockArticleRepository.getListArticle()).thenAnswer((realInvocation) async => Future.value(Right(
          baseResponse)));
    }

    test('test execute loadNews result success', () async {
      prepareSuccessResponse();
      final result = await loadNews.call(NoParams());
      expect(result.isRight(), true);
    });

  });

}