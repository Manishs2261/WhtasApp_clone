import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabWidgets extends StatelessWidget {
  TabWidgets({super.key, required this.title, this.nuReadChats = "", required this.radius});

  String title;
  String nuReadChats;

  double radius;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        alignment: Alignment.center,
        height: 22,
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: BorderRadius.circular(
            25.0,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
            SizedBox(
              width: 5,
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: radius,
              child: Text(
                nuReadChats,
                style: TextStyle(fontSize: 10, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
