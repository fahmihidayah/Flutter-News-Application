import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/data/remote/config_api.dart';
import 'package:news_app/core/data/repository/config_repository.dart';
import 'package:news_app/core/service_provider/hive_repository_provider.dart';
import 'package:news_app/core/service_provider/network_repository_provider.dart';
import 'package:news_app/core/service_provider/repository_provider.dart';

class BlocProviderStatelessWidget extends StatelessWidget {
  Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(providers: [
      ... getHiveRepositoryProvider(),
      ... getNetworkProviders(),
      ... getRepositoryProvider(),
    ], child: child);
  }

  BlocProviderStatelessWidget({required this.child, super.key});
}