
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/data/repository/article_repository.dart';
import 'package:news_app/core/widget/base_bloc_widget.dart';
import 'package:news_app/screen/home/bloc/home_bloc.dart';
import 'package:news_app/screen/home/home_content.dart';

class HomeScreen extends BaseBlocStatelessWidget {

  @override
  List<BlocProvider<StateStreamableSource<Object?>>> createProviders() => [
    BlocProvider<HomeBloc>(
        create: (context) =>
        HomeBloc(
          articleRepository: RepositoryProvider.of<ArticleRepository>(context)
        ))
  ];

  @override
  Widget buildChild(BuildContext context) => HomeContentWidget();

  const HomeScreen({super.key});
// @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: ErrorContentWidget(image: ImageRes().errorFile, message: "Content not found",),
  //   );
  // }
}