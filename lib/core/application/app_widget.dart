import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/application/routing.dart';
import 'package:news_app/core/service_provider/bloc_providers.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProviderStatelessWidget(
        child:  MaterialApp(
          title: 'News App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: "/main",
          routes: routesConfig,
        ));
  }

  const AppWidget({super.key});
}
