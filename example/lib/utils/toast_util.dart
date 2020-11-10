import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ToastUtil() 和 ToastUtil.instance 获取的是同一个对象
class ToastUtil {
  // 工厂模式
  factory ToastUtil() => _getInstance();

  static ToastUtil get instance => _getInstance();
  static ToastUtil _instance;

  ToastUtil._internal();

  static ToastUtil _getInstance() {
    if (_instance == null) {
      _instance = ToastUtil._internal();
    }
    return _instance;
  }

  void showToast(String resultMsg) {
    Fluttertoast.showToast(
      msg: resultMsg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey[600],
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
