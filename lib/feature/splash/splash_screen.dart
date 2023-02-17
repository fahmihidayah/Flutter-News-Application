import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/widget/base_bloc_widget.dart';
import 'package:news_app/data/repository/config/config_repository.dart';
import 'package:news_app/feature/splash/bloc/splash_bloc.dart';
import 'package:news_app/feature/splash/splash_content.dart';
import 'package:news_app/feature/splash/use_case/load_configuration.dart';

class SplashScreen extends BaseBlocStatelessWidget {
  const SplashScreen({super.key});

  @override
  List<BlocProvider<StateStreamableSource<Object?>>> createProviders() => [
        BlocProvider<SplashBloc>(
            create: (context) => SplashBloc(
                loadConfiguration: LoadConfiguration(
                    configRepository: RepositoryProvider.of(context)))
              ..add(InitialSplashEvent()))
      ];

  @override
  Widget buildChild(BuildContext context) => SplashContentWidget();
}
