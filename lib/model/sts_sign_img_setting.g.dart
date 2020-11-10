// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sts_sign_img_setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StsSignImgSetting _$StsSignImgSettingFromJson(Map<String, dynamic> json) {
  return StsSignImgSetting(
    userOrientation: json['userOrientation'] as int,
    paintStrokeWidth: json['paintStrokeWidth'] as int,
    imgBackgroundColor: json['imgBackgroundColor'] as int,
    paintColor: json['paintColor'] as int,
    standardWidth: json['standardWidth'] as int,
    standardHeight: json['standardHeight'] as int,
  );
}

Map<String, dynamic> _$StsSignImgSettingToJson(StsSignImgSetting instance) =>
    <String, dynamic>{
      'userOrientation': instance.userOrientation,
      'paintStrokeWidth': instance.paintStrokeWidth,
      'imgBackgroundColor': instance.imgBackgroundColor,
      'paintColor': instance.paintColor,
      'standardWidth': instance.standardWidth,
      'standardHeight': instance.standardHeight,
    };
