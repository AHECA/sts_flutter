import 'dart:convert';

import 'package:sts_flutter/model/sts_user_info.dart';
import 'package:sts_flutter/model/sts_company_info.dart';
import 'package:sts_flutter/model/sts_scan_info.dart';
import 'package:sts_flutter/model/sts_sign_img_setting.dart';
import 'package:sts_flutter/result/apply_cert_result.dart';
import 'package:sts_flutter/result/cert_decrypt_result.dart';
import 'package:sts_flutter/result/cert_encrypt_result.dart';
import 'package:sts_flutter/result/cert_login_result.dart';
import 'package:sts_flutter/result/cert_seal_result.dart';
import 'package:sts_flutter/result/cert_sign_result.dart';
import 'package:sts_flutter/result/common_result.dart';
import 'package:sts_flutter/result/get_cert_result.dart';
import 'package:sts_flutter/result/get_department_no_result.dart';
import 'package:sts_flutter/result/get_qr_code_result.dart';
import 'package:sts_flutter/result/pk_cache_result.dart';
import 'package:sts_flutter/result/sign_img_result.dart';
import 'package:sts_flutter/sts_code_table.dart';
import 'package:sts_flutter/sts_platform_bridge.dart';

class StsFlutter {
  /// [.applyPersonalCert]
  /// [.applyPersonalCertWithPIN]
  /// [.updatePersonalCert]
  /// [.resetPersonalPIN]
  static const String CARD_TYPE_ID_CARD = "00"; // 身份证
  static const String CARD_TYPE_TEMPORARY_ID_CARD = "01"; // 临时身份证
  static const String CARD_TYPE_HOUSEHOLD_REGISTER = "02"; // 户口本
  static const String CARD_TYPE_PASSPORT = "03"; // 护照
  static const String CARD_TYPE_MILITARY_ID_CARD = "04"; // 军人身份证
  static const String CARD_TYPE_ARMED_POLICE_ID_CARD = "05"; // 武警身份证

  static const String CARD_TYPE_ID_CARD_NAME = "身份证"; // 身份证
  static const String CARD_TYPE_TEMPORARY_ID_CARD_NAME = "临时身份证"; // 临时身份证
  static const String CARD_TYPE_HOUSEHOLD_REGISTER_NAME = "户口本"; // 户口本
  static const String CARD_TYPE_PASSPORT_NAME = "护照"; // 护照
  static const String CARD_TYPE_MILITARY_ID_CARD_NAME = "军人身份证"; // 军人身份证
  static const String CARD_TYPE_ARMED_POLICE_ID_CARD_NAME = "武警身份证"; // 武警身份证

  /// [.certLogin]
  /// [.certSign]
  /// [.certVerifySign]
  /// [.certEncrypt]
  /// [.certDecrypt]
  static const String DATA_TYPE_ORIGINAL_TO_HEXADECIMAL = "0"; // 原文数据转成16进制
  static const String DATA_TYPE_BYTE_BY_HEXADECIMAL = "1"; // byte类型数据（16进制编码）
  static const String DATA_TYPE_CHINESE_TO_HEXADECIMAL = "2"; // 中文转成16进制
  static const String DATA_TYPE_ORIGINAL = "3"; // 原文数据
  static const String DATA_TYPE_BYTE_BY_BASE64 = "4"; // byte类型数据（Base64编码加密后的值）

  static const String DATA_FORMAT_P1 = "p1"; // P1
  static const String DATA_FORMAT_P7 = "p7"; // P7
  static const String DATA_FORMAT_P7_ENVELOPE = "p7envelope"; // P7数字信封
  static const String DATA_FORMAT_DEFAULT = "default"; // 裸签名

  /// [.changeCertStatus]
  static const int CERT_STATUS_TYPE_FREEZE = 1; // 冻结证书
  static const int CERT_STATUS_TYPE_UNFREEZE = 2; // 解冻证书
  static const int CERT_STATUS_TYPE_REVOKE = 3; // 销毁证书

  /// [.getCert]
  static const int CERT_TYPE_SIGNCERT = 1; // 签名证书
  static const int CERT_TYPE_ENCCERT = 2; // 解密证书

  /// [.setSignImgWithDrawingBoard]
  /// [.getSignImgAndSetItIfNotExist]
  /// [.getSignImgWithDrawingBoard]
  static const int ORIENTATION_AUTO = 1; // 根据系统切换
  static const int ORIENTATION_LANDSCAPE = 2; // 横屏
  static const int ORIENTATION_PORTRAIT = 3; // 竖屏

//  证书相关
  static Future<String> init(String url, String appKey, String secretKey) async {
    return await StsPlatformBridge.init(url, appKey, secretKey);
  }

  static Future<String> initUseId(String useId) async {
    return await StsPlatformBridge.initUseId(useId);
  }

  static Future<String> initFace(String id, String fileName) async {
    return await StsPlatformBridge.initFace(id, fileName);
  }

  static Future<String> initThemeColor(int color) async {
    return await StsPlatformBridge.initThemeColor(color);
  }

  static Future<String> get getDeviceID async {
    return await StsPlatformBridge.getDeviceID;
  }

  static Future<bool> get isLocalCertExist async {
    return await StsPlatformBridge.isLocalCertExist;
  }

  static Future<CommonResult> get checkCert async {
    String jsonStr = await StsPlatformBridge.checkCert;
    return CommonResult.fromJson(json.decode(jsonStr));
  }

  static Future<CommonResult> get clearCert async {
    String jsonStr = await StsPlatformBridge.clearCert;
    return CommonResult.fromJson(json.decode(jsonStr));
  }

  static Future<ApplyCertResult> applyPersonalCert(StsUserInfo stsUserInfo) async {
    if (stsUserInfo == null)
      return ApplyCertResult(
          resultCode: StsCodeTable.rtnCode_no_data, resultMsg: StsCodeTable.rtnMsg_no_data, enCert: null, signCert: null, stsCertInfo: null, stsUserInfo: null, stsCompanyInfo: null);
    String jsonStr = await StsPlatformBridge.applyPersonalCert(json.encode(stsUserInfo));
    return ApplyCertResult.fromJson(json.decode(jsonStr));
  }

  static Future<ApplyCertResult> applyCompanyCert(StsCompanyInfo stsCompanyInfo) async {
    if (stsCompanyInfo == null)
      return ApplyCertResult(
          resultCode: StsCodeTable.rtnCode_no_data, resultMsg: StsCodeTable.rtnMsg_no_data, enCert: null, signCert: null, stsCertInfo: null, stsUserInfo: null, stsCompanyInfo: null);
    String jsonStr = await StsPlatformBridge.applyCompanyCert(json.encode(stsCompanyInfo));
    return ApplyCertResult.fromJson(json.decode(jsonStr));
  }

  static Future<GetQRCodeResult> get getUntieEquipmentQRCode async {
    String jsonStr = await StsPlatformBridge.getUntieEquipmentQRCode;
    return GetQRCodeResult.fromJson(json.decode(jsonStr));
  }

  static Future<ApplyCertResult> untieEquipment(String qrData) async {
    String jsonStr = await StsPlatformBridge.untieEquipment(qrData);
    return ApplyCertResult.fromJson(json.decode(jsonStr));
  }

  static Future<CommonResult> updatePersonalCert(StsUserInfo stsUserInfo) async {
    if (stsUserInfo == null) return CommonResult(resultCode: StsCodeTable.rtnCode_no_data, resultMsg: StsCodeTable.rtnMsg_no_data);
    String jsonStr = await StsPlatformBridge.updatePersonalCert(json.encode(stsUserInfo));
    return CommonResult.fromJson(json.decode(jsonStr));
  }

  static Future<CommonResult> updateCompanyCert(StsCompanyInfo stsCompanyInfo) async {
    if (stsCompanyInfo == null) return CommonResult(resultCode: StsCodeTable.rtnCode_no_data, resultMsg: StsCodeTable.rtnMsg_no_data);
    String jsonStr = await StsPlatformBridge.updateCompanyCert(json.encode(stsCompanyInfo));
    return CommonResult.fromJson(json.decode(jsonStr));
  }

  static Future<CommonResult> resetPersonalPIN(StsUserInfo stsUserInfo) async {
    if (stsUserInfo == null) return CommonResult(resultCode: StsCodeTable.rtnCode_no_data, resultMsg: StsCodeTable.rtnMsg_no_data);
    String jsonStr = await StsPlatformBridge.resetPersonalPIN(json.encode(stsUserInfo));
    return CommonResult.fromJson(json.decode(jsonStr));
  }

  static Future<CommonResult> resetCompanyPIN(StsCompanyInfo stsCompanyInfo) async {
    if (stsCompanyInfo == null) return CommonResult(resultCode: StsCodeTable.rtnCode_no_data, resultMsg: StsCodeTable.rtnMsg_no_data);
    String jsonStr = await StsPlatformBridge.resetCompanyPIN(json.encode(stsCompanyInfo));
    return CommonResult.fromJson(json.decode(jsonStr));
  }

  static Future<CommonResult> get modifyPIN async {
    String jsonStr = await StsPlatformBridge.modifyPIN;
    return CommonResult.fromJson(json.decode(jsonStr));
  }

  static Future<CommonResult> scanLogin(StsScanInfo stsScanInfo) async {
    if (stsScanInfo == null) return CommonResult(resultCode: StsCodeTable.rtnCode_no_data, resultMsg: StsCodeTable.rtnMsg_no_data);
    String jsonStr = await StsPlatformBridge.scanLogin(json.encode(stsScanInfo));
    return CommonResult.fromJson(json.decode(jsonStr));
  }

  static Future<CommonResult> scanSign(StsScanInfo stsScanInfo) async {
    if (stsScanInfo == null) return CommonResult(resultCode: StsCodeTable.rtnCode_no_data, resultMsg: StsCodeTable.rtnMsg_no_data);
    String jsonStr = await StsPlatformBridge.scanSign(json.encode(stsScanInfo));
    return CommonResult.fromJson(json.decode(jsonStr));
  }

  static Future<CertLoginResult> certLogin(String data, String dataFormat, String dataType, String pn) async {
    String jsonStr = await StsPlatformBridge.certLogin(data, dataFormat, dataType, pn);
    return CertLoginResult.fromJson(json.decode(jsonStr));
  }

  static Future<CertSealResult> certSeal(String pn) async {
    String jsonStr = await StsPlatformBridge.certSeal(pn);
    return CertSealResult.fromJson(json.decode(jsonStr));
  }

  static Future<CertSignResult> certSign(String data, String dataFormat, String dataType, String pn) async {
    String jsonStr = await StsPlatformBridge.certSign(data, dataFormat, dataType, pn);
    return CertSignResult.fromJson(json.decode(jsonStr));
  }

  static Future<CommonResult> certVerifySign(String data, String dataFormat, String signData, String dataType) async {
    String jsonStr = await StsPlatformBridge.certVerifySign(data, dataFormat, signData, dataType);
    return CommonResult.fromJson(json.decode(jsonStr));
  }

  static Future<CertEncryptResult> certEncrypt(String data, String dataFormat, String dataType) async {
    String jsonStr = await StsPlatformBridge.certEncrypt(data, dataFormat, dataType);
    return CertEncryptResult.fromJson(json.decode(jsonStr));
  }

  static Future<CertDecryptResult> certDecrypt(String data, String dataFormat, String dataType, String pn) async {
    String jsonStr = await StsPlatformBridge.certDecrypt(data, dataFormat, dataType, pn);
    return CertDecryptResult.fromJson(json.decode(jsonStr));
  }

  static Future<CommonResult> changeCertStatus(int statusType) async {
    String jsonStr = await StsPlatformBridge.changeCertStatus(statusType);
    return CommonResult.fromJson(json.decode(jsonStr));
  }

  static Future<CommonResult> get postponeCert async {
    String jsonStr = await StsPlatformBridge.postponeCert;
    return CommonResult.fromJson(json.decode(jsonStr));
  }

  static Future<PKCacheResult> setPKCacheTime(String pn) async {
    String jsonStr = await StsPlatformBridge.setPKCacheTime(pn);
    return PKCacheResult.fromJson(json.decode(jsonStr));
  }

  static Future<PKCacheResult> clearPKCacheTime(String pn) async {
    String jsonStr = await StsPlatformBridge.clearPKCacheTime(pn);
    return PKCacheResult.fromJson(json.decode(jsonStr));
  }

  static Future<GetCertResult> getCert(int certType) async {
    String jsonStr = await StsPlatformBridge.getCert(certType);
    return GetCertResult.fromJson(json.decode(jsonStr));
  }

  static Future<GetCertResult> getLocalCert(int certType) async {
    String jsonStr = await StsPlatformBridge.getLocalCert(certType);
    return GetCertResult.fromJson(json.decode(jsonStr));
  }

  static Future<GetCertResult> downloadCert(String phoneNum, String departmentNo, int certType) async {
    String jsonStr = await StsPlatformBridge.downloadCert(phoneNum, departmentNo, certType);
    return GetCertResult.fromJson(json.decode(jsonStr));
  }

  static Future<GetDepartmentNoResult> get getDepartmentNo async {
    String jsonStr = await StsPlatformBridge.getDepartmentNo;
    return GetDepartmentNoResult.fromJson(json.decode(jsonStr));
  }

  static Future<SignImgResult> setSignImgWithDrawingBoard(StsSignImgSetting stsSignImgSetting) async {
    String jsonStr = await StsPlatformBridge.setSignImgWithDrawingBoard(stsSignImgSetting == null ? null : json.encode(stsSignImgSetting));
    return SignImgResult.fromJson(json.decode(jsonStr));
  }

  static Future<SignImgResult> setSignImgBase64Str(String imgBase64) async {
    String jsonStr = await StsPlatformBridge.setSignImgBase64Str(imgBase64);
    return SignImgResult.fromJson(json.decode(jsonStr));
  }

  static Future<SignImgResult> get getSignImgFromService async {
    String jsonStr = await StsPlatformBridge.getSignImgFromService;
    return SignImgResult.fromJson(json.decode(jsonStr));
  }

  static Future<SignImgResult> getSignImgAndSetItIfNotExist(StsSignImgSetting stsSignImgSetting) async {
    String jsonStr = await StsPlatformBridge.getSignImgAndSetItIfNotExist(stsSignImgSetting == null ? null : json.encode(stsSignImgSetting));
    return SignImgResult.fromJson(json.decode(jsonStr));
  }

  static Future<SignImgResult> getSignImgWithDrawingBoard(StsSignImgSetting stsSignImgSetting) async {
    String jsonStr = await StsPlatformBridge.getSignImgWithDrawingBoard(stsSignImgSetting == null ? null : json.encode(stsSignImgSetting));
    return SignImgResult.fromJson(json.decode(jsonStr));
  }

  static Future<bool> get getFingerprintStatus {
    return StsPlatformBridge.getFingerprintStatus;
  }

  static Future<CommonResult> openFingerprint(bool open) async {
    String jsonStr = await StsPlatformBridge.openFingerprint(open);
    return CommonResult.fromJson(json.decode(jsonStr));
  }
}
