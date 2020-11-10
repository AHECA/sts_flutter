import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:sts_flutter_example/app.dart';

class QRCodeActivity extends StatefulWidget {
  final List<int> img;

  QRCodeActivity({@required this.img});

  @override
  _QRCodeState createState() => _QRCodeState();
}

class _QRCodeState extends State<QRCodeActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App.getAppBar("解绑二维码"),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Image.memory(Uint8List.fromList(widget.img)),
      ),
    );
  }
}
