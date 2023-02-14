import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/core/data/repository/article_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  ArticleRepository articleRepository;

  HomeBloc({required this.articleRepository}) : super(HomeInitial()) {
    on(_onInitialEvent);
  }

  void _onInitialEvent(InitialHomeEvent event, Emitter<HomeState> emitter) {

  }
}
