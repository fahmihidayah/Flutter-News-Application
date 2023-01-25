part of 'splash_bloc.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {}

class FinishInitialSplashState extends SplashState {

}

class ErrorSplashState extends SplashState {
  String? message;

  ErrorSplashState(this.message);
}
