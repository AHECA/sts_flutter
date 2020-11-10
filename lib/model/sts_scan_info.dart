import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sts_scan_info.g.dart';

@JsonSerializable()
class StsScanInfo {
  String url = ""; //二维码唯一标识
  String qcid = ""; //二维码唯一标识
  String type = ""; //操作类型：1PDF签名(对PDF文件的hash值签名)、2登录(对data签名)、3签名(对字符串签名)、4签名(对byte数据签名)（默认为1）
  String flag = ""; //操作类型标识：1签名(固定样式)、2手写签名、3手写签批、4签章（默认为1，PDF签名/WORD/HTML/其他）
  String pn = ""; //应用编号
  String ut = ""; //医生等级

  StsScanInfo({
    @required this.url,
    @required this.qcid,
    @required this.type,
    @required this.flag,
    @required this.pn,
    @required this.ut,
  });

  //反序列化
  factory StsScanInfo.fromJson(Map<String, dynamic> map) => _$StsScanInfoFromJson(map);

  //序列化
  Map<String, dynamic> toJson() => _$StsScanInfoToJson(this);
}
