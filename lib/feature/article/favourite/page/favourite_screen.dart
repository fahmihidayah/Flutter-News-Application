import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/resources/images.dart';
import 'package:news_app/core/widget/error/error_widget.dart';

class FavouriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favourite"),),
      body: ErrorContentWidget(image: ImageRes().errorFile, message: "You don't have any favourite article"),
    );
  }
}