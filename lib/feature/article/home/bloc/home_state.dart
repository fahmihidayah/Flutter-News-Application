part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {}

class HomeStateSuccess extends HomeState {
  final List<Article> listArticle;

  HomeStateSuccess({required this.listArticle});

  @override
  List<Object?> get props => [listArticle];
}

class HomeStateFailure extends HomeState {
  final Failure failure;

  HomeStateFailure({required this.failure});

  @override
  List<Object?> get props => [failure];
}

class HomeStateProgress extends HomeState {
  @override
  List<Object?> get props => [];
}
