part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeStateSuccess extends HomeState {
  final List<Article> listArticle;

  HomeStateSuccess({required this.listArticle});
}

class HomeStateFailure extends HomeState {
  final Failure failure;

  HomeStateFailure({required this.failure});
}

class HomeStateProgress extends HomeState {

}
