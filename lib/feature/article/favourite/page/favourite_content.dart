import 'package:flutter/cupertino.dart';
import 'package:news_app/core/resources/images.dart';
import 'package:news_app/core/widget/base_bloc_content_widget.dart';
import 'package:news_app/core/widget/error/error_widget.dart';
import 'package:news_app/feature/article/favourite/bloc/favourite_bloc.dart';

class FavouriteContentWidget
    extends BaseBlocContentStatelessWidget<FavouriteBloc, FavouriteState> {
  @override
  String get appBarTitle => "Favourite";

  @override
  Widget buildBodyWidget(BuildContext context, FavouriteState state) {
    return ErrorContentWidget(
        message: "Error Message", image: ImageRes().errorFile);
  }
}
