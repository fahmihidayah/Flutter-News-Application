
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),),
      body: Center(
        child: Text("Home", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
      ),

    );
  }
}