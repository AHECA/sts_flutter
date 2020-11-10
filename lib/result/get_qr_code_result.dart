import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_qr_code_result.g.dart';

@JsonSerializable()
class GetQRCodeResult {
  int resultCode = 0;
  String resultMsg = "";
  String qrCode = "";

  GetQRCodeResult({
    @required this.resultCode,
    @required this.resultMsg,
    @required this.qrCode,
  });

  //反序列化
  factory GetQRCodeResult.fromJson(Map<String, dynamic> map) => _$GetQRCodeResultFromJson(map);

  //序列化
  Map<String, dynamic> toJson() => _$GetQRCodeResultToJson(this);
}
