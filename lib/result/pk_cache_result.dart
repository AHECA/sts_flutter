import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pk_cache_result.g.dart';

@JsonSerializable()
class PKCacheResult {
  int resultCode = 0;
  String resultMsg = "";
  String token = "";

  PKCacheResult({
    @required this.resultCode,
    @required this.resultMsg,
    @required this.token,
  });

  //反序列化
  factory PKCacheResult.fromJson(Map<String, dynamic> map) => _$PKCacheResultFromJson(map);

  //序列化
  Map<String, dynamic> toJson() => _$PKCacheResultToJson(this);
}
