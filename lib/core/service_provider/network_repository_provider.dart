import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/data/remote/config_api.dart';

List<RepositoryProvider<dynamic>> getNetworkProviders() => [
  RepositoryProvider<ConfigApi>(create: (context) => ConfigApi())
];