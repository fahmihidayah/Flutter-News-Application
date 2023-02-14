import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/widget/base_bloc_widget.dart';
import 'package:news_app/screen/explore/explore_screen.dart';
import 'package:news_app/screen/favourite/favourite_screen.dart';
import 'package:news_app/screen/home/home_screen.dart';
import 'package:news_app/screen/profile/profile_screen.dart';

class MainScreenMenu {
  Widget widget;
  String title;

  MainScreenMenu(this.widget, this.title);
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  List<MainScreenMenu> _contentWidget = [
    MainScreenMenu(HomeScreen(), "Home"),
    MainScreenMenu(ExploreScreen(), "Explore"),
    MainScreenMenu(FavouriteScreen(), "Favoutite"),
    MainScreenMenu(ProfileScreen(), "Profile"),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _contentWidget[_currentIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Explore"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favourite"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: "Profile"),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

}
