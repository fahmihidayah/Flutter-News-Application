import 'dart:js';

import 'package:bloc/src/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:news_app/core/resources/images.dart';
import 'package:news_app/core/widget/base_bloc_widget.dart';
import 'package:news_app/core/widget/error/error_widget.dart';
import 'package:news_app/feature/article/favourite/bloc/favourite_bloc.dart';
import 'package:news_app/feature/article/favourite/page/favourite_content.dart';
import 'package:news_app/feature/article/favourite/use_case/load_favourite.dart';

class FavouriteScreen extends BaseBlocStatelessWidget {
  @override
  Widget buildChild(BuildContext context) {
    return FavouriteContentWidget();
  }

  @override
  List<BlocProvider<StateStreamableSource<Object?>>> createProviders() => [
        BlocProvider(
            create: (context) => FavouriteBloc(
                loadFavourite: LoadFavouriteImpl(
                    articleRepository: RepositoryProvider.of(context)))
              ..add(FavouriteEventInitial()))
      ];
}
