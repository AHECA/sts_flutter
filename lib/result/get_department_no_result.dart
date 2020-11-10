import 'package:flutter/material.dart';
import 'package:sts_flutter/model/sts_department.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_department_no_result.g.dart';

@JsonSerializable()
class GetDepartmentNoResult {
  int resultCode = 0;
  String resultMsg = "";
  List<StsDepartment> departmentList;

  GetDepartmentNoResult({
    @required this.resultCode,
    @required this.resultMsg,
    @required this.departmentList,
  });

  //反序列化
  factory GetDepartmentNoResult.fromJson(Map<String, dynamic> map) => _$GetDepartmentNoResultFromJson(map);

  //序列化
  Map<String, dynamic> toJson() => _$GetDepartmentNoResultToJson(this);
}
