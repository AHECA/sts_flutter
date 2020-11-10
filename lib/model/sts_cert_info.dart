import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sts_cert_info.g.dart';

@JsonSerializable()
class StsCertInfo {
  String publicKey = "";
  String notBefore = "";
  String certAlgorithm = "";
  String certSN = "";
  String notAfter = "";
  String keyUsage = "";
  String version = "";
  SubjectDNBean subjectDN;
  IssuerDNBean issuerDN;
  SubjectEXTBean subjectEXT;

  StsCertInfo({
    @required this.publicKey,
    @required this.notBefore,
    @required this.certAlgorithm,
    @required this.certSN,
    @required this.notAfter,
    @required this.keyUsage,
    @required this.version,
    @required this.subjectDN,
    @required this.issuerDN,
    @required this.subjectEXT,
  });

  //反序列化
  factory StsCertInfo.fromJson(Map<String, dynamic> map) => _$StsCertInfoFromJson(map);

  //序列化
  Map<String, dynamic> toJson() => _$StsCertInfoToJson(this);
}

@JsonSerializable()
class SubjectDNBean {
  String E = "";
  String ST = "";
  String GIVENNAME = "";
  String C = "";
  String L = "";
  String OU = "";
  String O = "";
  String CN = "";

  SubjectDNBean({
    @required this.E,
    @required this.ST,
    @required this.GIVENNAME,
    @required this.C,
    @required this.L,
    @required this.OU,
    @required this.O,
    @required this.CN,
  });

  //反序列化
  factory SubjectDNBean.fromJson(Map<String, dynamic> map) => _$SubjectDNBeanFromJson(map);

  //序列化
  Map<String, dynamic> toJson() => _$SubjectDNBeanToJson(this);
}

@JsonSerializable()
class IssuerDNBean {
  String ST = "";
  String C = "";
  String L = "";
  String OU = "";
  String O = "";
  String CN = "";

  IssuerDNBean({
    @required this.ST,
    @required this.C,
    @required this.L,
    @required this.OU,
    @required this.O,
    @required this.CN,
  });

  //反序列化
  factory IssuerDNBean.fromJson(Map<String, dynamic> map) => _$IssuerDNBeanFromJson(map);

  //序列化
  Map<String, dynamic> toJson() => _$IssuerDNBeanToJson(this);
}

@JsonSerializable()
class SubjectEXTBean {
  String certExt2 = "";
  String certExt4 = "";
  String certExt3 = "";
  String certExt9 = "";

  SubjectEXTBean({
    @required this.certExt2,
    @required this.certExt4,
    @required this.certExt3,
    @required this.certExt9,
  });

  //反序列化
  factory SubjectEXTBean.fromJson(Map<String, dynamic> map) => _$SubjectEXTBeanFromJson(map);

  //序列化
  Map<String, dynamic> toJson() => _$SubjectEXTBeanToJson(this);
}
