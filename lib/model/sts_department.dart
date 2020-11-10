import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sts_department.g.dart';

@JsonSerializable()
class StsDepartment {
  String departmentNo = "";
  String departmentName = "";

  StsDepartment({
    @required this.departmentNo,
    @required this.departmentName,
  });

  //反序列化
  factory StsDepartment.fromJson(Map<String, dynamic> map) => _$StsDepartmentFromJson(map);

  //序列化
  Map<String, dynamic> toJson() => _$StsDepartmentToJson(this);
}
