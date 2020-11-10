// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sts_scan_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StsScanInfo _$StsScanInfoFromJson(Map<String, dynamic> json) {
  return StsScanInfo(
    url: json['url'] as String,
    qcid: json['qcid'] as String,
    type: json['type'] as String,
    flag: json['flag'] as String,
    pn: json['pn'] as String,
    ut: json['ut'] as String,
  );
}

Map<String, dynamic> _$StsScanInfoToJson(StsScanInfo instance) =>
    <String, dynamic>{
      'url': instance.url,
      'qcid': instance.qcid,
      'type': instance.type,
      'flag': instance.flag,
      'pn': instance.pn,
      'ut': instance.ut,
    };
