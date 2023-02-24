import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/data/models/article.dart';
import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/feature/article/home/bloc/home_bloc.dart';
import 'package:news_app/feature/article/home/use_case/load_news.dart';

import '../../../../fixtures/model/article_fixtures.dart';
import 'home_bloc_test.mocks.dart';

@GenerateMocks([LoadNews])
void main() {
  MockLoadNews mockLoadNews = MockLoadNews();
  late HomeBloc homeBloc;

  setUp(() {
    EquatableConfig.stringify = true;
    homeBloc = HomeBloc(loadNews: mockLoadNews);
  });

  final BaseResponse<List<Article>> baseResponse = getBaseResponseListArticle();
  final noParams = NoParams();

  when(mockLoadNews.call(noParams))
      .thenAnswer((realInvocation) async => Future.value(Right(baseResponse)));

  blocTest('test home bloc initial',
      build: () => homeBloc,
      act: (bloc) => homeBloc..add(InitialHomeEvent()),
      expect: ()  => [
            HomeStateProgress(),
            HomeStateSuccess(listArticle: baseResponse.details ?? [])
          ]);

  tearDown(() {
    homeBloc.close();
  });
}
