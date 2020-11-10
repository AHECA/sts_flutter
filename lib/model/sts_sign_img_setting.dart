import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sts_sign_img_setting.g.dart';

@JsonSerializable()
class StsSignImgSetting {
  int userOrientation;
  int paintStrokeWidth;
  int imgBackgroundColor;
  int paintColor;
  int standardWidth;
  int standardHeight;

  StsSignImgSetting({
    @required this.userOrientation,
    @required this.paintStrokeWidth,
    @required this.imgBackgroundColor,
    @required this.paintColor,
    @required this.standardWidth,
    @required this.standardHeight,
  });

//反序列化
  factory StsSignImgSetting.fromJson(Map<String, dynamic> map) => _$StsSignImgSettingFromJson(map);

//序列化
  Map<String, dynamic> toJson() => _$StsSignImgSettingToJson(this);
}
