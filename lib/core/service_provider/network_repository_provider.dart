import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/data/remote/article_api.dart';
import 'package:news_app/core/data/remote/auth_api.dart';
import 'package:news_app/core/data/remote/config_api.dart';
import 'package:news_app/core/factory/network_api_factory.dart';

List<RepositoryProvider<dynamic>> getNetworkProviders() => [
  RepositoryProvider<Dio>(create: (context) => NetworkAPIFactory.createDioInstance()),
  RepositoryProvider<ConfigApi>(create: (context) => ConfigApi(dio: RepositoryProvider.of<Dio>(context))),
  RepositoryProvider<AuthApi>(create: (context) => AuthApi(dio: RepositoryProvider.of(context))),
  RepositoryProvider<ArticleApi>(create: (context) => ArticleApi(dio: RepositoryProvider.of(context))),

];