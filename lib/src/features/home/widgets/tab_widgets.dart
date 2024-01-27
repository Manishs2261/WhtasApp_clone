import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabWidgets extends StatelessWidget {
  TabWidgets({super.key,

    required this.title,
    this.nuReadChats = "",
    required this.radius
  });


  String title;
  String nuReadChats ;
  double radius;


  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(
            width: 5,
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: radius,
            child: Text(
              nuReadChats ,
              style: TextStyle(fontSize: 10),
            ),
          )
        ],
      ),
    );
  }
}