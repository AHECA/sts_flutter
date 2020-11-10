// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_qr_code_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetQRCodeResult _$GetQRCodeResultFromJson(Map<String, dynamic> json) {
  return GetQRCodeResult(
    resultCode: json['resultCode'] as int,
    resultMsg: json['resultMsg'] as String,
    qrCode: json['qrCode'] as String,
  );
}

Map<String, dynamic> _$GetQRCodeResultToJson(GetQRCodeResult instance) =>
    <String, dynamic>{
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
      'qrCode': instance.qrCode,
    };
