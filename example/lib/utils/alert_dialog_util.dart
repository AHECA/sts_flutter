import 'package:flutter/material.dart';

class AlertDialogUtil {
  // 工厂模式
  factory AlertDialogUtil() => _getInstance();

  static AlertDialogUtil get instance => _getInstance();
  static AlertDialogUtil _instance;

  AlertDialogUtil._internal();

  static AlertDialogUtil _getInstance() {
    if (_instance == null) {
      _instance = AlertDialogUtil._internal();
    }
    return _instance;
  }

  void dialogShow(BuildContext context,
      {String title = "提示", String msg = "", bool showCancelBtn = true, String cancelText = "否", String okText = "是", VoidCallback onCancelPressed, VoidCallback onOkPressed}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      child: AlertDialog(
        title: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
        ),
        content: Text(
          msg,
          style: TextStyle(fontSize: 20.0),
        ),
        actions: <Widget>[
          showCancelBtn
              ? FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                    if (onCancelPressed != null) onCancelPressed();
                  },
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    cancelText,
                    style: TextStyle(fontSize: 24.0),
                  ),
                )
              : null,
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
              if (onCancelPressed != null) onOkPressed();
            },
            padding: EdgeInsets.all(5.0),
            child: Text(
              okText,
              style: TextStyle(fontSize: 24.0),
            ),
          ),
        ],
      ),
    );
  }
}
