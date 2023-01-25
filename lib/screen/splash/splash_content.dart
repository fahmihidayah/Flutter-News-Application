import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/application/route/route_builder.dart';
import 'package:news_app/core/widget/base_bloc_content_widget.dart';
import 'package:news_app/screen/login/login_screen.dart';
import 'package:news_app/screen/splash/bloc/splash_bloc.dart';

class SplashContentWidget extends BaseBlocContentStatelessWidget<SplashBloc, SplashState> {

  @override
  String get appBarTitle => "Splash Screen";

  @override
  Widget buildBodyWidget(BuildContext context, SplashState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 90,
          height: 90,
          child: Image.asset("assets/images/ic_app.png"),
        ),
        Text(
          "Your News",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        textAlign: TextAlign.center,)
      ],
    );
  }

  @override
  void buildListener(BuildContext context, SplashState state) {
    if(state is FinishInitialSplashState) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  @override
  AppBar? createAppBar(BuildContext context, SplashState state) {
    return null;
  }
}
