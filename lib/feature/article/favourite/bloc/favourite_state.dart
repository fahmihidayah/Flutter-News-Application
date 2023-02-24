part of 'favourite_bloc.dart';

@immutable
abstract class FavouriteState extends Equatable {}

class FavouriteStateInitial extends FavouriteState {
  @override
  List<Object?> get props => [];
}

class FavouriteStateSuccessLoad extends FavouriteState {
  final List<Article> listArticles;

  FavouriteStateSuccessLoad(this.listArticles);

  @override
  List<Object?> get props => [listArticles];
}

class FavouriteStateProgress extends FavouriteState {
  @override
  List<Object?> get props => [];
}

class FavouriteStateFailure extends FavouriteState {
  final Failure failure;

  FavouriteStateFailure(this.failure);

  @override
  List<Object?> get props => [failure];
}

