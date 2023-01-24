import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:news_app/core/data/repository/config_repository.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  ConfigRepository repository;


  SplashBloc({required this.repository}) : super(SplashInitial()) {
    on(_onInitialSplashEvent);
  }

  void _onInitialSplashEvent(InitialSplashEvent event, Emitter<SplashState> emit) {
    debugPrint("initial --- request to server here --- ");
    repository.getListConfig();
    emit(FinishInitialSplashState());
  }
}
