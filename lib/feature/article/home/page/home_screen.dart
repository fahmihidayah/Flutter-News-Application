import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/widget/base_bloc_widget.dart';
import 'package:news_app/data/repository/article/article_repository.dart';
import 'package:news_app/data/repository/article/article_repository_impl.dart';
import 'package:news_app/feature/article/home/bloc/home_bloc.dart';
import 'package:news_app/feature/article/home/page/home_content.dart';
import 'package:news_app/feature/article/home/use_case/load_news.dart';

class HomeScreen extends BaseBlocStatelessWidget {
  @override
  List<BlocProvider<StateStreamableSource<Object?>>> createProviders() => [
        BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(
                loadNews: LoadNews(
                    articleRepository:
                        RepositoryProvider.of<ArticleRepository>(context)))
              ..add(InitialHomeEvent()))
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
