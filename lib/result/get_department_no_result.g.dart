// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_department_no_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDepartmentNoResult _$GetDepartmentNoResultFromJson(
    Map<String, dynamic> json) {
  return GetDepartmentNoResult(
    resultCode: json['resultCode'] as int,
    resultMsg: json['resultMsg'] as String,
    departmentList: (json['departmentList'] as List)
        ?.map((e) => e == null
            ? null
            : StsDepartment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GetDepartmentNoResultToJson(
        GetDepartmentNoResult instance) =>
    <String, dynamic>{
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
      'departmentList': instance.departmentList,
    };
