import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/resources/images.dart';
import 'package:news_app/core/widget/base_bloc_content_widget.dart';
import 'package:news_app/feature/article/home/bloc/home_bloc.dart';
import 'package:news_app/feature/article/home/widget/home_item.dart';


class HomeContentWidget
    extends BaseBlocContentStatelessWidget<HomeBloc, HomeState> {
  AppBar? createAppBar(BuildContext context, HomeState state) {
    return AppBar(
      title: Text("Home"),
    );
  }

  Widget buildBodyWidget(BuildContext context, HomeState state) {
    if(state is HomeStateSuccess && state.listArticle?.isNotEmpty == true) {
      return ListView.builder(itemCount : state.listArticle?.length ,itemBuilder: (context, index) {
        return ArticleRegularItem(article: state.listArticle?[index],);
      });
    }
    else if (state is HomeStateProgress) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.blue,
        ),
      );
    }
    else {
      return Center(
        child: ErrorWidget("No Data"),
      );
    }

    // return ListView(children: [
    //   ArticleRegularItem(),
    //   ArticleRegularItem(),
    //   ArticleRegularItem(),
    //   ArticleRegularItem(),
    //   ArticleRegularItem(),
    //   ArticleRegularItem(),
    //   ArticleRegularItem(),
    //   ArticleRegularItem(),
    //   ArticleRegularItem(),
    // ]);
  }
}
