import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/models/configuration.dart';
import 'package:news_app/data/repository/config_repository.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  ConfigRepository repository;


  SplashBloc({required this.repository}) : super(SplashInitial()) {
    on(_onInitialSplashEvent);
  }

  Future<void> _onInitialSplashEvent(InitialSplashEvent event, Emitter<SplashState> emit) async {
    BaseResponse<List<Configuration>> response = await repository.getListConfig();
    if(response.details?.firstWhere((element) => element.key == "is_maintenance").value != "1") {
      emit(FinishInitialSplashState());
    }
    else {
      emit(ErrorSplashState(response.details?.firstWhere((element) => element.key == "maintenance_message").value));
    }
  }
}
