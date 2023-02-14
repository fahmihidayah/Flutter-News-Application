import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/resources/images.dart';
import 'package:news_app/core/widget/base_bloc_content_widget.dart';
import 'package:news_app/screen/home/bloc/home_bloc.dart';
import 'package:news_app/screen/home/home_item.dart';
import 'package:news_app/widget/error/error_widget.dart';

class HomeContentWidget
    extends BaseBlocContentStatelessWidget<HomeBloc, HomeState> {
  AppBar? createAppBar(BuildContext context, HomeState state) {
    return AppBar(
      title: Text("Home"),
    );
  }

  Widget buildBodyWidget(BuildContext context, HomeState state) {
    return ListView(children: [
      ArticleRegularItem(),
      ArticleRegularItem(),
      ArticleRegularItem(),
      ArticleRegularItem(),
      ArticleRegularItem(),
      ArticleRegularItem(),
      ArticleRegularItem(),
      ArticleRegularItem(),
      ArticleRegularItem(),
    ]);
  }
}
