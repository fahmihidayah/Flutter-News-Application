import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/core/data/models/Article.dart';
import 'package:news_app/data/repository/article/article_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  ArticleRepository articleRepository;

  HomeBloc({required this.articleRepository}) : super(HomeInitial()) {
    on(_onInitialEvent);
  }

  Future<void> _onInitialEvent(InitialHomeEvent event, Emitter<HomeState> emitter) async {
    emit(HomeStateProgress());
    final response = await articleRepository.getListArticle();
    emit(HomeInitial(listArticle: response.details));
  }
}
