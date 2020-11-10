import 'dart:async';

import 'package:flutter/services.dart';

class StsPlatformBridge {
  static const MethodChannel _methodChannel = const MethodChannel('sts_flutter');

//  证书相关
  static Future<String> init(
    String url,
    String appKey,
    String secretKey,
  ) async {
    if (url == null || url.isEmpty || appKey == null || appKey.isEmpty || secretKey == null || secretKey.isEmpty) {
      return "初始化手机盾失败，参数为空";
    } else {
      try {
        return await _methodChannel.invokeMethod("init", {
          "baseUrl": url,
          "stsAppKey": appKey,
          "stsSecretKey": secretKey,
        });
      } on Exception catch (e) {
        return e.toString();
      }
    }
  }

  static Future<String> initUseId(
    String useId,
  ) async {
    if (useId == null || useId.isEmpty) {
      return "初始化手机盾用户唯一标识失败，参数为空";
    } else {
      try {
        return await _methodChannel.invokeMethod("initUseId", {
          "useId": useId,
        });
      } on Exception catch (e) {
        return e.toString();
      }
    }
  }

  static Future<String> initFace(
    String id,
    String fileName,
  ) async {
    if (id == null || id.isEmpty || fileName == null || fileName.isEmpty) {
      return "初始化手机盾人脸识别模块失败，参数为空";
    } else {
      try {
        return await _methodChannel.invokeMethod("initFace", {
          "id": id,
          "fileName": fileName,
        });
      } on Exception catch (e) {
        return e.toString();
      }
    }
  }

  static Future<String> initThemeColor(
    int color,
  ) async {
    if (color <= 0) {
      return "初始化手机盾主题色失败，色值小于等于零";
    } else {
      try {
        return await _methodChannel.invokeMethod("initThemeColor", {
          "color": color,
        });
      } on Exception catch (e) {
        return e.toString();
      }
    }
  }

  static Future<String> get getDeviceID async {
    return await _methodChannel.invokeMethod("getDeviceID");
  }

  static Future<bool> get isLocalCertExist async {
    return await _methodChannel.invokeMethod("isLocalCertExist");
  }

  static Future<String> get checkCert async {
    return await _methodChannel.invokeMethod("checkCert");
  }

  static Future<String> get clearCert async {
    return await _methodChannel.invokeMethod("clearCert");
  }

  static Future<String> applyPersonalCert(
    String stsUserInfo,
  ) async {
    return await _methodChannel.invokeMethod("applyPersonalCert", {
      "stsUserInfo": stsUserInfo,
    });
  }

  static Future<String> applyCompanyCert(
      String stsCompanyInfo,
  ) async {
    return await _methodChannel.invokeMethod("applyCompanyCert", {
      "stsCompanyInfo": stsCompanyInfo,
    });
  }

  static Future<String> get getUntieEquipmentQRCode async {
    return await _methodChannel.invokeMethod("getUntieEquipmentQRCode");
  }

  static Future<String> untieEquipment(
    String qrData,
  ) async {
    return await _methodChannel.invokeMethod("untieEquipment", {
      "qrData",
      qrData,
    });
  }

  static Future<String> updatePersonalCert(
      String stsUserInfo,
  ) async {
    return await _methodChannel.invokeMethod("updatePersonalCert", {
      "stsUserInfo": stsUserInfo,
    });
  }

  static Future<String> updateCompanyCert(
      String stsCompanyInfo,
  ) async {
    return await _methodChannel.invokeMethod("updateCompanyCert", {
      "stsCompanyInfo": stsCompanyInfo,
    });
  }

  static Future<String> resetPersonalPIN(
      String stsUserInfo,
  ) async {
    return await _methodChannel.invokeMethod("resetPersonalPIN", {
      "stsUserInfo": stsUserInfo,
    });
  }

  static Future<String> resetCompanyPIN(
      String stsCompanyInfo,
  ) async {
    return await _methodChannel.invokeMethod("resetCompanyPIN", {
      "stsCompanyInfo": stsCompanyInfo,
    });
  }

  static Future<String> get modifyPIN async {
    return await _methodChannel.invokeMethod("modifyPIN");
  }

  static Future<String> scanLogin(
      String stsScanInfo,
  ) async {
    return await _methodChannel.invokeMethod("scanLogin", {
      "stsScanInfo": stsScanInfo,
    });
  }

  static Future<String> scanSign(
      String stsScanInfo,
  ) async {
    return await _methodChannel.invokeMethod("scanSign", {
      "stsScanInfo": stsScanInfo,
    });
  }

  static Future<String> certLogin(
    String data,
    String dataFormat,
    String dataType,
    String pn,
  ) async {
    return await _methodChannel.invokeMethod("certLogin", {
      "data": data,
      "dataFormat": dataFormat,
      "dataType": dataType,
      "pn": pn,
    });
  }

  static Future<String> certSeal(
    String pn,
  ) async {
    return await _methodChannel.invokeMethod("certSeal", {
      "pn": pn,
    });
  }

  static Future<String> certSign(
    String data,
    String dataFormat,
    String dataType,
    String pn,
  ) async {
    return await _methodChannel.invokeMethod("certSign", {
      "data": data,
      "dataFormat": dataFormat,
      "dataType": dataType,
      "pn": pn,
    });
  }

  static Future<String> certVerifySign(
    String data,
    String dataFormat,
    String signData,
    String dataType,
  ) async {
    return await _methodChannel.invokeMethod("certVerifySign", {
      "data": data,
      "dataFormat": dataFormat,
      "signData": signData,
      "dataType": dataType,
    });
  }

  static Future<String> certEncrypt(
    String data,
    String dataFormat,
    String dataType,
  ) async {
    return await _methodChannel.invokeMethod("certEncrypt", {
      "data": data,
      "dataFormat": dataFormat,
      "dataType": dataType,
    });
  }

  static Future<String> certDecrypt(
    String data,
    String dataFormat,
    String dataType,
    String pn,
  ) async {
    return await _methodChannel.invokeMethod("certDecrypt", {
      "data": data,
      "dataFormat": dataFormat,
      "dataType": dataType,
      "pn": pn,
    });
  }

  static Future<String> changeCertStatus(
      int statusType,
  ) async {
    return await _methodChannel.invokeMethod("changeCertStatus", {
      "statusType": statusType,
    });
  }

  static Future<String> get postponeCert async {
    return await _methodChannel.invokeMethod("postponeCert");
  }

  static Future<String> setPKCacheTime(
    String pn,
  ) async {
    return await _methodChannel.invokeMethod("setPKCacheTime", {
      "pn": pn,
    });
  }

  static Future<String> clearPKCacheTime(
    String pn,
  ) async {
    return await _methodChannel.invokeMethod("clearPKCacheTime", {
      "pn": pn,
    });
  }

  static Future<String> getCert(
    int certType,
  ) async {
    return await _methodChannel.invokeMethod("getCert", {
      "certType": certType,
    });
  }

  static Future<String> getLocalCert(
    int certType,
  ) async {
    return await _methodChannel.invokeMethod("getLocalCert", {
      "certType": certType,
    });
  }

  static Future<String> downloadCert(
    String phoneNum,
    String departmentNo,
    int certType,
  ) async {
    return await _methodChannel.invokeMethod("downloadCert", {
      "phoneNum": phoneNum,
      "departmentNo": departmentNo,
      "certType": certType,
    });
  }

  static Future<String> get getDepartmentNo async {
    return await _methodChannel.invokeMethod("getDepartmentNo");
  }

  static Future<String> setSignImgWithDrawingBoard(
      String stsSignImgSetting,
  ) async {
    return await _methodChannel.invokeMethod("setSignImgWithDrawingBoard", {
      "stsSignImgSetting": stsSignImgSetting,
    });
  }

  static Future<String> setSignImgBase64Str(
    String imgBase64,
  ) async {
    return await _methodChannel.invokeMethod("setSignImgBase64Str", {
      "imgBase64": imgBase64,
    });
  }

  static Future<String> get getSignImgFromService async {
    return await _methodChannel.invokeMethod("getSignImgFromService");
  }

  static Future<String> getSignImgAndSetItIfNotExist(
      String stsSignImgSetting,
  ) async {
    return await _methodChannel.invokeMethod("getSignImgAndSetItIfNotExist", {
      "stsSignImgSetting": stsSignImgSetting,
    });
  }

  static Future<String> getSignImgWithDrawingBoard(
      String stsSignImgSetting,
  ) async {
    return await _methodChannel.invokeMethod("getSignImgWithDrawingBoard", {
      "stsSignImgSetting": stsSignImgSetting,
    });
  }

  static Future<bool> get getFingerprintStatus {
    return _methodChannel.invokeMethod("getFingerprintStatus");
  }

  static Future<String> openFingerprint(bool open) async {
    return await _methodChannel.invokeMethod("openFingerprint", {"open": open});
  }
}
