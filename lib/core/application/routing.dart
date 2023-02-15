import 'package:flutter/cupertino.dart';
import 'package:news_app/feature/article/home/page/home_screen.dart';
import 'package:news_app/feature/main/main_screen.dart';
import 'package:news_app/feature/splash/splash_screen.dart';
import 'package:news_app/feature/user/sign_in/login_screen.dart';

var routesConfig = <String, WidgetBuilder>{
  '/splash': (context) => SplashScreen(),
  '/login': (context) => LoginScreen(),
  '/home': (context) => HomeScreen(),
  '/main': (context) => MainScreen()
};