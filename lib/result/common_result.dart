import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'common_result.g.dart';

@JsonSerializable()
class CommonResult {
  int resultCode;
  String resultMsg;

  CommonResult({
    @required this.resultCode,
    @required this.resultMsg,
  });

  //反序列化
  factory CommonResult.fromJson(Map<String, dynamic> map) => _$CommonResultFromJson(map);

  //序列化
  Map<String, dynamic> toJson() => _$CommonResultToJson(this);
}
