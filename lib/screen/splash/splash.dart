import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/data/repository/config_repository.dart';
import 'package:news_app/core/widget/base_bloc_widget.dart';
import 'package:news_app/screen/splash/bloc/splash_bloc.dart';
import 'package:news_app/screen/splash/splash_content.dart';

class SplashScreen extends BaseBlocStatelessWidget {
  const SplashScreen({super.key});

  @override
  List<BlocProvider<StateStreamableSource<Object?>>> createProviders() => [
        BlocProvider<SplashBloc>(
            create: (context) =>
                SplashBloc(repository: context.read<ConfigRepository>())
                  ..add(InitialSplashEvent()))
      ];

  @override
  Widget buildChild(BuildContext context) => SplashContentWidget();
}
