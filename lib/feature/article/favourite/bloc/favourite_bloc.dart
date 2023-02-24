import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/data/models/article.dart';
import 'package:news_app/data/repository/article/article_repository.dart';
import 'package:news_app/feature/article/favourite/use_case/load_favourite.dart';

part 'favourite_event.dart';

part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final LoadFavourite loadFavourite;

  FavouriteBloc({required this.loadFavourite})
      : super(FavouriteStateInitial()) {
    on(_onInitialFavouriteArticle);
  }

  Future<void> _onInitialFavouriteArticle(
      FavouriteEventInitial event, Emitter<FavouriteState> emit) async {
    emit(FavouriteStateProgress());
    final result = await loadFavourite.call(NoParams());
    result.fold((l) => emit(FavouriteStateFailure(l)),
        (r) => emit(FavouriteStateSuccessLoad(r.details ?? [])));
  }
}
