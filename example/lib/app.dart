import 'package:flutter/material.dart';

class App {
  static double appBarTitleSize = 22.0;
  static double menuTitleSize = 18.0;
  static double littleTitleSize = 16.0;
  static double btnTextSize = 18.0;
  static double tffTextSize = 18.0;

  static AppBar getAppBar(String title) {
    return AppBar(
      centerTitle: true,
      title: Container(
        padding: EdgeInsets.all(5.0),
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: appBarTitleSize),
        ),
      ),
    );
  }
}
