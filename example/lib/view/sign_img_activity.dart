import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:sts_flutter_example/app.dart';

class SignImgActivity extends StatefulWidget {
  final Uint8List img;

  SignImgActivity({@required this.img});

  @override
  _SignImgState createState() => _SignImgState();
}

class _SignImgState extends State<SignImgActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App.getAppBar("签名图片"),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Image.memory(widget.img),
      ),
    );
  }
}
