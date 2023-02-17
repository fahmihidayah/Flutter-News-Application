import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/models/configuration.dart';
import 'package:news_app/data/repository/config/config_repository.dart';
import 'package:news_app/feature/splash/use_case/load_configuration.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final LoadConfiguration loadConfiguration;

  SplashBloc({required this.loadConfiguration}) : super(SplashInitial()) {
    on(_onInitialSplashEvent);
  }

  Future<void> _onInitialSplashEvent(InitialSplashEvent event, Emitter<SplashState> emit) async {
    final result = await loadConfiguration.call(NoParams());
    result.fold((failure) {
      emit(ErrorSplashState("Error from server"));
    }, (response) async {
      if(response.details?.firstWhere((element) => element.key == "is_maintenance").value != "1") {
        emit(FinishInitialSplashState());
      }
      else {
        emit(ErrorSplashState(response.details?.firstWhere((element) => element.key == "maintenance_message").value));
      }
    });

  }
}
