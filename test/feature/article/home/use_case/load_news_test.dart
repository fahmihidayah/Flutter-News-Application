import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/repository/article/article_repository.dart';
import 'package:news_app/feature/article/home/use_case/load_news.dart';

import 'load_news_test.mocks.dart';

@GenerateMocks([ArticleRepository])
void main() {
  MockArticleRepository mockArticleRepository = MockArticleRepository();
  late LoadNews loadNews;

  setUp(() {
    loadNews = LoadNews(articleRepository: mockArticleRepository);
  });

  group('loadNews test', () {


  });

}