import 'package:flutter/material.dart';
import 'package:sts_flutter/result/cert_sign_result.dart';
import 'package:sts_flutter/result/common_result.dart';
import 'package:sts_flutter/sts_code_table.dart';
import 'package:sts_flutter/sts_flutter.dart';
import 'package:sts_flutter_example/app.dart';
import 'package:sts_flutter_example/utils/toast_util.dart';

class SignAndVerifyActivity extends StatefulWidget {
  @override
  _SignAndVerifyState createState() => _SignAndVerifyState();
}

class _SignAndVerifyState extends State<SignAndVerifyActivity> {
  String signDataStr;
  String signResultStr = "signResult";
  String verifySignResultStr = "verifySignResult";

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    Color disabledColor = Theme.of(context).disabledColor;
    Color hintColor = Theme.of(context).hintColor;

    var tffSignData = TextField(
      decoration: InputDecoration(labelText: "请输入签名原文"),
      style: TextStyle(fontSize: App.tffTextSize),
      maxLength: 40,
      keyboardType: TextInputType.phone,
      onChanged: (value) {
        signDataStr = value;
      },
    );

    Text signTitle = Text(
      "签名结果",
      style: TextStyle(color: hintColor, fontSize: App.littleTitleSize),
    );

    Text signResult = Text(
      signResultStr,
      style: TextStyle(color: Colors.black, fontSize: App.littleTitleSize),
    );

    Text verifySignTitle = Text(
      "验签结果",
      style: TextStyle(color: hintColor, fontSize: App.littleTitleSize),
    );

    Text verifySignResult = Text(
      verifySignResultStr,
      style: TextStyle(color: Colors.black, fontSize: App.littleTitleSize),
    );

    var btnSign = MaterialButton(
      color: primaryColor,
      disabledColor: disabledColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
      padding: EdgeInsets.all(14.0),
      child: Text(
        "证书签名",
        style: TextStyle(color: Colors.white, fontSize: App.btnTextSize),
      ),
      onPressed: () => _certSign(context),
    );

    var btnVerifySign = MaterialButton(
      color: primaryColor,
      disabledColor: disabledColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
      padding: EdgeInsets.all(14.0),
      child: Text(
        "证书验签",
        style: TextStyle(color: Colors.white, fontSize: App.btnTextSize),
      ),
      onPressed: () => _certVerifySign(context),
    );

    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        tffSignData,
        Divider(height: 20.0, color: Colors.transparent),
        signTitle,
        signResult,
        Divider(height: 20.0, color: Colors.transparent),
        verifySignTitle,
        verifySignResult,
        Divider(height: 20.0, color: Colors.transparent),
        Container(
          width: double.infinity,
          child: btnSign,
          padding: EdgeInsets.only(top: 20.0),
        ),
        Container(
          width: double.infinity,
          child: btnVerifySign,
          padding: EdgeInsets.only(top: 20.0),
        ),
      ],
    );

    return Scaffold(
      appBar: App.getAppBar("签名验签"),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: column,
      ),
    );
  }

  void _certSign(BuildContext context) async {
    if (signDataStr != null && signDataStr.length > 0) {
      CertSignResult certSignResult = await StsFlutter.certSign(signDataStr, StsFlutter.DATA_FORMAT_DEFAULT, StsFlutter.DATA_TYPE_ORIGINAL, "");
      ToastUtil.instance.showToast(certSignResult.resultMsg);
      if (certSignResult.resultCode == StsCodeTable.rtnCode_success) {
        setState(() {
          signResultStr = certSignResult.signData;
        });
      }
    } else {
      ToastUtil.instance.showToast("请输入签名原文！");
    }
  }

  void _certVerifySign(BuildContext context) async {
    if (signDataStr != null && signDataStr.length > 0) {
      CommonResult commonResult = await StsFlutter.certVerifySign(signDataStr, StsFlutter.DATA_FORMAT_DEFAULT, signResultStr, StsFlutter.DATA_TYPE_ORIGINAL);
      ToastUtil.instance.showToast(commonResult.resultMsg);
      setState(() {
        verifySignResultStr = commonResult.resultMsg;
      });
    } else {
      ToastUtil.instance.showToast("请输入签名原文并签名！");
    }
  }
}
