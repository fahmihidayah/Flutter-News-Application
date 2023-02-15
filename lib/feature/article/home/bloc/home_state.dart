part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {
  final List<Article>? listArticle;

  HomeInitial({this.listArticle});
}

class HomeStateProgress extends HomeState {

}
