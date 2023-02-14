import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/data/remote/article_api.dart';
import 'package:news_app/core/data/remote/auth_api.dart';
import 'package:news_app/core/data/remote/config_api.dart';
import 'package:news_app/core/data/repository/article_repository.dart';
import 'package:news_app/core/data/repository/auth_repository.dart';
import 'package:news_app/core/data/repository/config_repository.dart';

List<RepositoryProvider<dynamic>> getRepositoryProvider() => [
      RepositoryProvider<ConfigRepository>(
          create: (context) => ConfigRepository(
              configApi: RepositoryProvider.of<ConfigApi>(context))),
      RepositoryProvider<AuthRepository>(
          create: (context) =>
              AuthRepository(authApi: RepositoryProvider.of<AuthApi>(context))),
      RepositoryProvider<ArticleRepository>(
          create: (context) => ArticleRepository(
              articleApi: RepositoryProvider.of<ArticleApi>(context))),
    ];
