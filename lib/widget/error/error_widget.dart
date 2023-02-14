import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorContentWidget extends StatelessWidget {
  String message;
  String image;


  ErrorContentWidget({super.key, required this.message,required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 130,
          width: 130,
          child: Image(image: AssetImage(image), ),
        ),
        Text(message, style: TextStyle(fontSize: 20,), textAlign: TextAlign.center,),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 30),
            width: 100,
            height: 40,
            child: ElevatedButton(onPressed: (){}, child: Text("Reload", style: TextStyle(fontSize: 17),)),
          ),
        )
      ],
    );
  }
}