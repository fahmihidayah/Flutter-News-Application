import 'package:flutter/cupertino.dart';
import 'package:news_app/screen/home/home_screen.dart';
import 'package:news_app/screen/login/login_screen.dart';
import 'package:news_app/screen/main/main_screen.dart';
import 'package:news_app/screen/splash/splash_screen.dart';

var routesConfig = <String, WidgetBuilder>{
  '/splash': (context) => SplashScreen(),
  '/login': (context) => LoginScreen(),
  '/home': (context) => HomeScreen(),
  '/main': (context) => MainScreen()
};