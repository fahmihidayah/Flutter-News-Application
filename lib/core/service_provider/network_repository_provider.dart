import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/service_provider/factory/network_api_factory.dart';
import 'package:news_app/data/remote/article/article_api.dart';
import 'package:news_app/data/remote/article/article_api_impl.dart';
import 'package:news_app/data/remote/auth/auth_api.dart';
import 'package:news_app/data/remote/auth/auth_api_impl.dart';
import 'package:news_app/data/remote/config/config_api.dart';
import 'package:news_app/data/remote/config/config_api_impl.dart';

List<RepositoryProvider<dynamic>> getNetworkProviders() => [
  RepositoryProvider<Dio>(create: (context) => NetworkAPIFactory.createDioInstance()),
  RepositoryProvider<ConfigApi>(create: (context) => ConfigApiImpl(dio: RepositoryProvider.of<Dio>(context))),
  RepositoryProvider<AuthApi>(create: (context) => AuthApiImpl(dio: RepositoryProvider.of(context))),
  RepositoryProvider<ArticleApi>(create: (context) => ArticleApiImpl(dio: RepositoryProvider.of(context))),

];