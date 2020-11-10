import 'dart:convert';

import 'package:sts_flutter_example/app.dart';
import 'package:sts_flutter/model/sts_cert_info.dart';
import 'package:flutter/material.dart';

class CertInfoActivity extends StatelessWidget {
  final List<String> titles = ["证书信息", "颁发者信息", "使用者信息", "扩展信息"];
  final List<String> titleKeys = ["", "issuerDN", "subjectDN", "subjectEXT"];
  final List<List<String>> subtitleList = [
    ["证书序列号", "版本号", "生效日期", "失效日期", "算法标识"],
    ["颁发者", "组织", "机构", "城市", "省份", "国家"],
    ["姓名", "应用编号", "证件类型", "证件号码", "城市", "邮箱", "手机号码", "国家"],
    ["扩展项二", "扩展项三", "扩展项四"]
  ];
  final List<List<String>> subtitleKeyList = [
    ["certSN", "version", "notBefore", "notAfter", "certAlgorithm"],
    ["CN", "OU", "O", "L", "ST", "C"],
    ["CN", "OU", "GIVENNAME", "O", "L", "E", "ST", "C"],
    ["certExt2", "certExt3", "certExt4"]
  ];
  final StsCertInfo stsCertInfo;

  CertInfoActivity({@required this.stsCertInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App.getAppBar("证书信息"),
      body: ListView(
        children: _getColumnItem(context),
      ),
    );
  }

  List<Widget> _getColumnItem(BuildContext context) {
    Color blackColor = Colors.black;

    List<Widget> cards = [];

    Map<String, dynamic> certInfoJson = json.decode(json.encode(stsCertInfo));

    for (var i = 0; i < titles.length; i++) {
      var title = titles[i];
      var titleKey = titleKeys[i];
      var subtitles = subtitleList[i];
      var subtitleKeys = subtitleKeyList[i];

      List<Widget> cardColumnList = [];

      /// 卡片头部大标题
      cardColumnList.add(Container(
        width: double.infinity,
        padding: EdgeInsets.all(14.0),
        decoration: BoxDecoration(
          color: Theme
              .of(context)
              .disabledColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
        ),
        child: Text(
          title,
          style: TextStyle(color: blackColor, fontWeight: FontWeight.bold, fontSize: App.menuTitleSize),
        ),
      ));

      Map<String, dynamic> certInfo = certInfoJson;
      if (titleKey.length != 0) {
        if (certInfoJson.containsKey(titleKey)) {
          certInfo = certInfoJson[titleKey];
        } else {
          certInfo = null;
        }
      }
      for (var j = 0; j < subtitles.length; j++) {
        var subtitle = subtitles[j];
        var subtitleKey = subtitleKeys[j];
        var value;
        if (certInfo != null && certInfo.containsKey(subtitleKey)) {
          value = certInfo[subtitleKey];
        } else {
          value = "";
        }

        /// 卡片内容
        cardColumnList.add(Container(
          padding: EdgeInsets.all(14.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  subtitle,
                  style: TextStyle(color: blackColor, fontSize: App.littleTitleSize),
                ),
              ),
              Text(
                value,
                style: TextStyle(color: Theme
                    .of(context)
                    .hintColor, fontSize: App.littleTitleSize),
              )
            ],
          ),
        ));

        /// 卡片内容之间的分割线
        if (j < subtitles.length - 1)
          cardColumnList.add(Divider(
            color: Theme
                .of(context)
                .dividerColor,
            height: 1.0,
          ));
      }

      cards.add(Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        margin: EdgeInsets.all(14.0),
        child: Column(
          children: cardColumnList,
        ),
      ));
    }
    return cards;
  }
}
