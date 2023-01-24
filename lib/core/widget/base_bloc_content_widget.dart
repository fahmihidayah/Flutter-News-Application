import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screen/splash/bloc/splash_bloc.dart';

abstract class BaseBlocContentStatelessWidget<B extends StateStreamableSource<S>, S> extends StatelessWidget {

  String appBarTitle = "Home";

  BlocConsumer<B, S> buildBloc(BuildContext context) {
    return BlocConsumer<B, S>(builder: buildContentWidget,  listener: buildListener);
  }

  Widget buildContentWidget(BuildContext context, S state) {
    return Stack(
      children: [
        Scaffold(
          appBar: createAppBar(context, state),
          body: buildBodyWidget(context, state),
        )
      ],
    );
  }

  void buildListener(BuildContext context, S state) {

  }

  @override
  Widget build(BuildContext context) {
    return buildBloc(context);
  }

  AppBar? createAppBar(BuildContext context, S state) {
    return AppBar(title: Text(appBarTitle),);
  }

  Widget buildBodyWidget(BuildContext context, S state) {
    return const Center(
      child: Text("Base Content"),
    );
  }

  Widget? buildLoadingWidget() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black12,
        ),
        Center(
          child: CircularProgressIndicator(color: Colors.blue,),
        )
      ],
    );
  }
}