import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_img_result.g.dart';

@JsonSerializable()
class SignImgResult {
  int resultCode = 0;
  String resultMsg = "";
  String signImg;

  SignImgResult({
    @required this.resultCode,
    @required this.resultMsg,
    @required this.signImg,
  });

  //反序列化
  factory SignImgResult.fromJson(Map<String, dynamic> map) => _$SignImgResultFromJson(map);

  //序列化
  Map<String, dynamic> toJson() => _$SignImgResultToJson(this);
}
