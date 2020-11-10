import 'package:flutter/material.dart';
import 'package:sts_flutter_example/view/launch_activity.dart';

void main() {
  runApp(MaterialApp(
    title: "手机盾示例",
    home: LaunchActivity(),
    theme: ThemeData(
      primaryColor: Color(0xFF3388FF),
      primaryColorDark: Color(0xFF1162D3),
      accentColor: Color(0xFF009A50),
      hintColor: Color(0xFFBBBBBB),
      disabledColor: Color(0xFFCCCCCC),
      dividerColor: Color(0xFF999999),
    ),
  ));
}
