import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/remote/article/article_api.dart';
import 'package:news_app/data/remote/auth/auth_api.dart';
import 'package:news_app/data/remote/auth/auth_api_impl.dart';
import 'package:news_app/data/remote/config/config_api.dart';
import 'package:news_app/data/repository/article/article_repository.dart';
import 'package:news_app/data/repository/article/article_repository_impl.dart';
import 'package:news_app/data/repository/auth_repository.dart';
import 'package:news_app/data/repository/config_repository.dart';

List<RepositoryProvider<dynamic>> getRepositoryProvider() => [
      RepositoryProvider<ConfigRepository>(
          create: (context) => ConfigRepository(
              configApi: RepositoryProvider.of<ConfigApi>(context))),
      RepositoryProvider<AuthRepository>(
          create: (context) =>
              AuthRepository(authApi: RepositoryProvider.of<AuthApi>(context))),
      RepositoryProvider<ArticleRepository>(
          create: (context) => ArticleRepositoryImpl(
              articleApi: RepositoryProvider.of<ArticleApi>(context))),
    ];
