import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/service_provider/bloc_providers.dart';
import 'package:news_app/screen/home/home_screen.dart';
import 'package:news_app/screen/login/login_screen.dart';
import 'package:news_app/screen/splash/splash.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProviderStatelessWidget(
        child:  MaterialApp(
          title: 'News App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: SplashScreen(),
        ));
  }

  const AppWidget({super.key});
}
