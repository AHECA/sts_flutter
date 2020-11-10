import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sts_flutter/model/sts_cert_info.dart';
import 'package:sts_flutter/model/sts_user_info.dart';
import 'package:sts_flutter/result/common_result.dart';
import 'package:sts_flutter/result/get_cert_result.dart';
import 'package:sts_flutter/result/pk_cache_result.dart';
import 'package:sts_flutter/result/sign_img_result.dart';
import 'package:sts_flutter/sts_code_table.dart';
import 'package:sts_flutter/sts_flutter.dart';
import 'package:sts_flutter_example/utils/toast_util.dart';
import 'package:sts_flutter_example/view/cert_info_activity.dart';
import 'package:sts_flutter_example/view/sign_img_activity.dart';

class CertManagerPresenter {
  void certInfo(BuildContext context) async {
    GetCertResult result = await StsFlutter.getCert(StsFlutter.CERT_TYPE_SIGNCERT);

    int resultCode = result.resultCode;
    ToastUtil.instance.showToast(result.resultMsg);
    if (resultCode == 1) {
      StsCertInfo stsCertInfo = result.stsCertInfo;
      if (stsCertInfo != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CertInfoActivity(stsCertInfo: stsCertInfo),
          ),
        );
      } else {
        ToastUtil.instance.showToast("读取证书信息失败");
      }
    } else if (resultCode == StsCodeTable.rtnCode_cert_not_exist) _finish(context);
  }

  void signImg(BuildContext context) async {
    SignImgResult result = await StsFlutter.getSignImgAndSetItIfNotExist(null);
    var resultCode = result.resultCode;
    ToastUtil.instance.showToast(result.resultMsg);
    if (resultCode == StsCodeTable.rtnCode_success) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SignImgActivity(
            img: base64Decode(result.signImg),
          ),
        ),
      );
    } else if (resultCode == StsCodeTable.rtnCode_cert_not_exist) _finish(context);
  }

  void clearLocalCert(BuildContext context) async {
    CommonResult result = await StsFlutter.clearCert;
    int resultCode = result.resultCode;
    ToastUtil.instance.showToast(result.resultMsg);
    if (resultCode == StsCodeTable.rtnCode_success || resultCode == StsCodeTable.rtnCode_cert_not_exist) _finish(context);
  }

  void clearPkCache(BuildContext context, StsUserInfo userInfo) async {
    PKCacheResult result = await StsFlutter.clearPKCacheTime("");
    int resultCode = result.resultCode;
    ToastUtil.instance.showToast(result.resultMsg);
     if (resultCode == StsCodeTable.rtnCode_cert_not_exist) _finish(context);
  }

  void resetCertPin(BuildContext context, StsUserInfo userInfo) async {
    CommonResult result = await StsFlutter.resetPersonalPIN(userInfo);
    int resultCode = result.resultCode;
    ToastUtil.instance.showToast(result.resultMsg);
    if (resultCode == StsCodeTable.rtnCode_cert_not_exist) _finish(context);
  }

  void modifyCertPin(BuildContext context) async {
    CommonResult result = await StsFlutter.modifyPIN;
    int resultCode = result.resultCode;
    ToastUtil.instance.showToast(result.resultMsg);
    if (resultCode == StsCodeTable.rtnCode_cert_not_exist) _finish(context);
  }

  Future<bool> changeFingerprintState(BuildContext context, bool isChecked) async {
    CommonResult result = await StsFlutter.openFingerprint(!isChecked);
    int resultCode = result.resultCode;
    ToastUtil.instance.showToast(result.resultMsg);
    if (resultCode == StsCodeTable.rtnCode_cert_not_exist) {
      _finish(context);
      return false;
    } else {
      return await StsFlutter.getFingerprintStatus;
    }
  }

  void _finish(BuildContext context) {
    Navigator.pop(context);
  }
}
