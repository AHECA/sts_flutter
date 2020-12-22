import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sts_flutter/model/sts_company_info.dart';
import 'package:sts_flutter/result/apply_cert_result.dart';
import 'package:sts_flutter/sts_code_table.dart';
import 'package:sts_flutter/sts_flutter.dart';
import 'package:sts_flutter/model/sts_user_info.dart';
import 'package:sts_flutter_example/app.dart';
import 'package:sts_flutter_example/utils/cache_util.dart';
import 'package:sts_flutter_example/utils/toast_util.dart';
import 'package:sts_flutter_example/utils/constant_table.dart';
import 'package:sts_flutter_example/view/company_info_activity.dart';
import 'package:sts_flutter_example/view/launch_activity.dart';
import 'package:sts_flutter_example/view/user_info_activity.dart';

class ChoiceCertTypeActivity extends StatefulWidget {
  @override
  _ChoiceCertTypeState createState() => _ChoiceCertTypeState();
}

class _ChoiceCertTypeState extends State<ChoiceCertTypeActivity> {
  final List<String> names = [
    "个人证书",
    "企业证书",
    "设置用户信息",
    "设置企业信息",
    "修改服务配置",
  ];

  @override
  void initState() {
    super.initState();
    StsFlutter.init(ConstantTable.stsServiceURL, ConstantTable.stsAppKey, ConstantTable.stsSecretKey);
    if (Platform.isIOS) {
      StsFlutter.initFace(ConstantTable.Face_LicenseID_iOS, ConstantTable.Face_LicenseName_iOS);
    } else if (Platform.isAndroid) {
      StsFlutter.initFace(ConstantTable.Face_LicenseID_Android, ConstantTable.Face_LicenseName_Android);
    }
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
    switch (position) {
      case 0:
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
        ApplyCertResult applyCertResult = await StsFlutter.applyPersonalCert(stsUserInfo);
        ToastUtil.instance.showToast(applyCertResult.resultMsg);
        if (applyCertResult.resultCode == StsCodeTable.rtnCode_success || applyCertResult.resultCode == StsCodeTable.rtnCode_cert_exist) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => LaunchActivity()));
        }
        break;
      case 1:
        StsCompanyInfo stsCompanyInfo = await CacheUtil.companyInfo;
        if (stsCompanyInfo == null) {
          var result = await Navigator.push(context, MaterialPageRoute(builder: (context) => CompanyInfoActivity()));
          if (result != null) {
            stsCompanyInfo = result["stsCompanyInfo"];
          } else {
            return;
          }
        }
        StsFlutter.initUseId(stsCompanyInfo.companyNo);
        ApplyCertResult applyCertResult = await StsFlutter.applyCompanyCert(stsCompanyInfo);
        ToastUtil.instance.showToast(applyCertResult.resultMsg);
        if (applyCertResult.resultCode == StsCodeTable.rtnCode_success || applyCertResult.resultCode == StsCodeTable.rtnCode_cert_exist) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => LaunchActivity()));
        }
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => UserInfoActivity()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) => CompanyInfoActivity()));
        break;
      case 4:
        break;
    }
  }
}