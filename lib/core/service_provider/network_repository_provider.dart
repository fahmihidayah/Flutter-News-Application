import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/data/remote/auth_api.dart';
import 'package:news_app/core/data/remote/config_api.dart';
import 'package:news_app/core/initializer/network_api_initializer.dart';

List<RepositoryProvider<dynamic>> getNetworkProviders() => [
  RepositoryProvider<Dio>(create: (context) => NetworkAPIInitializer.createDioInstance()),
  RepositoryProvider<ConfigApi>(create: (context) => ConfigApi(dio: RepositoryProvider.of<Dio>(context))),
  RepositoryProvider<AuthApi>(create: (context) => AuthApi(dio: RepositoryProvider.of(context))),
];