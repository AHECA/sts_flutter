import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:sts_flutter/result/cert_login_result.dart';
import 'package:sts_flutter/result/common_result.dart';
import 'package:sts_flutter/result/get_qr_code_result.dart';
import 'package:sts_flutter/result/pk_cache_result.dart';
import 'package:sts_flutter/sts_code_table.dart';
import 'package:sts_flutter/sts_flutter.dart';
import 'package:sts_flutter_example/app.dart';
import 'package:sts_flutter_example/view/cert_manager_activity.dart';
import 'package:sts_flutter_example/utils/toast_util.dart';
import 'package:sts_flutter_example/view/encrypt_and_decrypt_activity.dart';
import 'package:sts_flutter_example/view/qr_code_activity.dart';
import 'package:sts_flutter_example/view/sign_and_verify_activity.dart';

class MainActivity extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<MainActivity> {
  List names = [
    "获取证书",
    "清除本地证书",
    "证书登录",
    "签名验签",
    "加密解密",
    "冻结证书",
    "解冻证书",
    "废除证书",
    "延期证书",
    "解绑设备",
    "设置密钥缓存时间",
    "清除密钥缓存时间",
  ];

  int certStatusType;

  @override
  Widget build(BuildContext context) {
    var gridView = GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      children: getGridViewChildren(),
    );

    return Scaffold(
      appBar: App.getAppBar("证书功能"),
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
        bool isChecked = await StsFlutter.getFingerprintStatus;
        Navigator.push(context, MaterialPageRoute(builder: (context) => CertManagerActivity(isChecked: isChecked)));
        break;
      case 1:
        CommonResult result = await StsFlutter.clearCert;
        int resultCode = result.resultCode;
        ToastUtil.instance.showToast(result.resultMsg);
        if (resultCode == StsCodeTable.rtnCode_success || resultCode == StsCodeTable.rtnCode_cert_not_exist) {
          _finish();
        }
        break;
      case 2:
        CertLoginResult certLoginResult = await StsFlutter.certLogin("登录原文", StsFlutter.DATA_FORMAT_DEFAULT, StsFlutter.DATA_TYPE_ORIGINAL, "");
        ToastUtil.instance.showToast(certLoginResult.resultMsg);
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) => SignAndVerifyActivity()));
        break;
      case 4:
        Navigator.push(context, MaterialPageRoute(builder: (context) => EncryptAndDecryptActivity()));
        break;
      case 5:
        certStatusType = StsFlutter.CERT_STATUS_TYPE_FREEZE;
        CommonResult commonResult = await StsFlutter.changeCertStatus(certStatusType);
        ToastUtil.instance.showToast(commonResult.resultMsg);
        break;
      case 6:
        certStatusType = StsFlutter.CERT_STATUS_TYPE_UNFREEZE;
        CommonResult commonResult = await StsFlutter.changeCertStatus(certStatusType);
        ToastUtil.instance.showToast(commonResult.resultMsg);
        break;
      case 7:
        certStatusType = StsFlutter.CERT_STATUS_TYPE_REVOKE;
        CommonResult commonResult = await StsFlutter.changeCertStatus(certStatusType);
        ToastUtil.instance.showToast(commonResult.resultMsg);
        if (commonResult.resultCode == StsCodeTable.rtnCode_success) {
          _finish();
        }
        break;
      case 8:
        CommonResult commonResult = await StsFlutter.postponeCert;
        ToastUtil.instance.showToast(commonResult.resultMsg);
        break;
      case 9:
        GetQRCodeResult getQRCodeResult = await StsFlutter.getUntieEquipmentQRCode;
        if (getQRCodeResult.resultCode == StsCodeTable.rtnCode_success) {
          Uint8List qrCode = base64Decode(getQRCodeResult.qrCode);
          Navigator.push(context, MaterialPageRoute(builder: (context) => QRCodeActivity(img: qrCode)));
        }
        break;
      case 10:
        PKCacheResult pkCacheResult = await StsFlutter.setPKCacheTime("");
        ToastUtil.instance.showToast(pkCacheResult.resultMsg);
        break;
      case 11:
        PKCacheResult pkCacheResult = await StsFlutter.clearPKCacheTime("");
        ToastUtil.instance.showToast(pkCacheResult.resultMsg);
        break;
    }
  }

  void _finish() {
    Navigator.pop(context);
  }
}
