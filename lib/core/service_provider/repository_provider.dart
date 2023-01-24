import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/data/remote/config_api.dart';
import 'package:news_app/core/data/repository/config_repository.dart';

List<RepositoryProvider<dynamic>> getRepositoryProvider() =>
    [
      RepositoryProvider<ConfigRepository>(
          create: (context) => ConfigRepository(configApi: RepositoryProvider.of<ConfigApi>(context)))
    ];