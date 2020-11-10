import 'package:flutter/material.dart';
import 'package:sts_flutter/result/cert_decrypt_result.dart';
import 'package:sts_flutter/result/cert_encrypt_result.dart';
import 'package:sts_flutter/sts_code_table.dart';
import 'package:sts_flutter/sts_flutter.dart';
import 'package:sts_flutter_example/app.dart';
import 'package:sts_flutter_example/utils/toast_util.dart';

class EncryptAndDecryptActivity extends StatefulWidget {
  @override
  _EncryptAndDecryptState createState() => _EncryptAndDecryptState();
}

class _EncryptAndDecryptState extends State<EncryptAndDecryptActivity> {
  String encryptDataStr;
  String encryptResultStr = "encryptResult";
  String decryptResultStr = "decryptResult";

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    Color disabledColor = Theme.of(context).disabledColor;
    Color hintColor = Theme.of(context).hintColor;

    var tffEncryptData = TextField(
      decoration: InputDecoration(labelText: "请输入加密原文"),
      style: TextStyle(fontSize: App.tffTextSize),
      maxLength: 40,
      keyboardType: TextInputType.phone,
      onChanged: (value) {
        encryptDataStr = value;
      },
    );

    Text encryptTitle = Text(
      "加密结果",
      style: TextStyle(color: hintColor, fontSize: App.littleTitleSize),
    );

    Text encryptResult = Text(
      encryptResultStr,
      style: TextStyle(color: Colors.black, fontSize: App.littleTitleSize),
    );

    Text decryptTitle = Text(
      "验签结果",
      style: TextStyle(color: hintColor, fontSize: App.littleTitleSize),
    );

    Text decryptResult = Text(
      decryptResultStr,
      style: TextStyle(color: Colors.black, fontSize: App.littleTitleSize),
    );

    var btnSign = MaterialButton(
      color: primaryColor,
      disabledColor: disabledColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
      padding: EdgeInsets.all(14.0),
      child: Text(
        "证书加密",
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
        "证书解密",
        style: TextStyle(color: Colors.white, fontSize: App.btnTextSize),
      ),
      onPressed: () => _certVerifySign(context),
    );

    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        tffEncryptData,
        Divider(height: 20.0, color: Colors.transparent),
        encryptTitle,
        encryptResult,
        Divider(height: 20.0, color: Colors.transparent),
        decryptTitle,
        decryptResult,
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
    if (encryptDataStr != null && encryptDataStr.length > 0) {
      CertEncryptResult certEncryptResult = await StsFlutter.certEncrypt(encryptDataStr, StsFlutter.DATA_FORMAT_DEFAULT, StsFlutter.DATA_TYPE_ORIGINAL);
      ToastUtil.instance.showToast(certEncryptResult.resultMsg);
      if (certEncryptResult.resultCode == StsCodeTable.rtnCode_success) {
        setState(() {
          encryptResultStr = certEncryptResult.encryptData;
        });
      }
    } else {
      ToastUtil.instance.showToast("请输入签名原文！");
    }
  }

  void _certVerifySign(BuildContext context) async {
    if (encryptDataStr != null && encryptDataStr.length > 0) {
      CertDecryptResult decryptResult = await StsFlutter.certDecrypt(encryptResultStr, StsFlutter.DATA_FORMAT_DEFAULT, StsFlutter.DATA_TYPE_ORIGINAL, "");
      ToastUtil.instance.showToast(decryptResult.resultMsg);
      setState(() {
        decryptResultStr = decryptResult.decryptData;
      });
    } else {
      ToastUtil.instance.showToast("请输入签名原文并签名！");
    }
  }
}
