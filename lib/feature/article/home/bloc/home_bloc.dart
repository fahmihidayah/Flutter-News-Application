import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/data/models/article.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/data/repository/article/article_repository.dart';
import 'package:news_app/feature/article/home/use_case/load_news.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final LoadNews loadNews;

  HomeBloc({required this.loadNews}) : super(HomeStateProgress()) {
    on(_onInitialEvent);
  }

  Future<void> _onInitialEvent(
      InitialHomeEvent event,
      Emitter<HomeState> emitter) async {
      emit(HomeStateProgress());
      final result = await loadNews.call(NoParams());
      result.fold((left) => emit(HomeStateFailure(failure: left)),
        (right) => emit(HomeStateSuccess(listArticle: right.details ?? [])));
  }
}
