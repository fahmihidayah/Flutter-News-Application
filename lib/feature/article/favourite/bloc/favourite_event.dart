part of 'favourite_bloc.dart';

@immutable
abstract class FavouriteEvent extends Equatable {}

class FavouriteEventInitial extends FavouriteEvent {
  @override
  List<Object?> get props => [];
}
