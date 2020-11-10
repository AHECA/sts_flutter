import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_plugin_qrcode/flutter_plugin_qrcode.dart';
import 'package:sts_flutter/result/apply_cert_result.dart';
import 'package:sts_flutter/result/get_department_no_result.dart';
import 'package:sts_flutter/result/sign_img_result.dart';
import 'package:sts_flutter/sts_code_table.dart';
import 'package:sts_flutter/sts_flutter.dart';
import 'package:sts_flutter/model/sts_user_info.dart';
import 'package:sts_flutter_example/app.dart';
import 'package:sts_flutter_example/utils/cache_util.dart';
import 'package:sts_flutter_example/utils/toast_util.dart';
import 'package:sts_flutter_example/utils/constant_table.dart';
import 'package:sts_flutter_example/view/main_activity.dart';
import 'package:sts_flutter_example/view/sign_img_activity.dart';
import 'package:sts_flutter_example/view/user_info_activity.dart';

class LaunchActivity extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<LaunchActivity> {
  final List<String> names = [
    "使用证书",
    "采集长期签名图片",
    "查看长期签名图片",
    "采集临时签名图片",
    "绑定设备",
    "下载预制证书",
    "设置用户信息",
    "修改服务配置",
  ];

  @override
  void initState() {
    super.initState();
    StsFlutter.init(ConstantTable.stsServiceURL, ConstantTable.stsAppKey, ConstantTable.stsSecretKey);
    StsFlutter.initFace(ConstantTable.Face_LicenseID, ConstantTable.Face_LicenseName);
  }

  @override
  Widget build(BuildContext context) {
    var gridView = GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      children: getGridViewChildren(),
    );

    return Scaffold(
      appBar: App.getAppBar("手机盾示例"),
      body: gridView,
    );
  }

  List<Widget> getGridViewChildren() {
    var items = <Widget>[];
    for (var i = 0; i < names.length; i++) {
      items.add(getItem(names[i], i));
    }
    return items;
  }

  Widget getItem(String name, int position) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FlutterLogo(size: 60.0),
          Text(name),
        ],
      ),
      onTap: () {
        changePage(position);
      },
    );
  }

  void changePage(int position) async {
    StsUserInfo stsUserInfo = await CacheUtil.userInfo;
    if (stsUserInfo == null) {
      var result = await Navigator.push(context, MaterialPageRoute(builder: (context) => UserInfoActivity()));
      if (result != null) {
        stsUserInfo = result["stsUserInfo"];
      } else {
        return;
      }
    }
    StsFlutter.initUseId(stsUserInfo.phoneNum);
    switch (position) {
      case 0:
        ApplyCertResult applyCertResult = await StsFlutter.applyPersonalCert(stsUserInfo);
        ToastUtil.instance.showToast(applyCertResult.resultMsg);
        if (applyCertResult.resultCode == StsCodeTable.rtnCode_success || applyCertResult.resultCode == StsCodeTable.rtnCode_cert_exist) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => MainActivity()));
        }
        break;
      case 1:
        SignImgResult signImgResult = await StsFlutter.setSignImgWithDrawingBoard(null);
        if (signImgResult.resultCode == StsCodeTable.rtnCode_success) {
          log("signImgResult = $signImgResult");
          log("signImgResult.signImg = ${signImgResult.signImg}");
          Navigator.push(context, MaterialPageRoute(builder: (context) => SignImgActivity(img: base64Decode(signImgResult.signImg))));
        }
        break;
      case 2:
        SignImgResult signImgResult = await StsFlutter.getSignImgAndSetItIfNotExist(null);
        if (signImgResult.resultCode == StsCodeTable.rtnCode_success) {
          log("signImgResult = $signImgResult");
          log("signImgResult.signImg = ${signImgResult.signImg}");
          Navigator.push(context, MaterialPageRoute(builder: (context) => SignImgActivity(img: base64Decode(signImgResult.signImg))));
        }
        break;
      case 3:
        SignImgResult signImgResult = await StsFlutter.getSignImgWithDrawingBoard(null);
        if (signImgResult.resultCode == StsCodeTable.rtnCode_success) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SignImgActivity(img: base64Decode(signImgResult.signImg))));
        }
        break;
      case 4:
        String qrData = await FlutterPluginQrcode.getQRCode;
        ApplyCertResult applyCertResult = await StsFlutter.untieEquipment(qrData);
        ToastUtil.instance.showToast(applyCertResult.resultMsg);
        if (applyCertResult.resultCode == StsCodeTable.rtnCode_success || applyCertResult.resultCode == StsCodeTable.rtnCode_cert_exist) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => MainActivity()));
        }
        break;
      case 5:
        GetDepartmentNoResult result = await StsFlutter.getDepartmentNo;
        ToastUtil.instance.showToast(result.resultMsg);
        break;
      case 6:
        Navigator.push(context, MaterialPageRoute(builder: (context) => UserInfoActivity()));
        break;
      case 7:
        break;
    }
  }
}