// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pk_cache_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PKCacheResult _$PKCacheResultFromJson(Map<String, dynamic> json) {
  return PKCacheResult(
    resultCode: json['resultCode'] as int,
    resultMsg: json['resultMsg'] as String,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$PKCacheResultToJson(PKCacheResult instance) =>
    <String, dynamic>{
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
      'token': instance.token,
    };
