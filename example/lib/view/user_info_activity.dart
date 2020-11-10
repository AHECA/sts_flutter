import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sts_flutter/model/sts_user_info.dart';
import 'package:sts_flutter/sts_flutter.dart';
import 'package:sts_flutter_example/app.dart';
import 'package:sts_flutter_example/utils/cache_util.dart';
import 'package:sts_flutter_example/utils/toast_util.dart';

class UserInfoActivity extends StatefulWidget {
  @override
  _UserInfoActivityState createState() => _UserInfoActivityState();
}

class _UserInfoActivityState extends State<UserInfoActivity> {
  String _idCardName = "";
  String _idCardNum = "";
  String _phoneNum = "";

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    var disabledColor = Theme.of(context).hintColor;

    //
    var tffIdCardName = TextField(
      decoration: InputDecoration(labelText: "请输入真实姓名"),
      style: TextStyle(fontSize: App.tffTextSize),
      maxLength: 20,
      keyboardType: TextInputType.text,
      inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(20)],
      onChanged: (value) {
        _idCardName = value;
      },
    );

    var tffIdCardNum = TextField(
      decoration: InputDecoration(labelText: "请输入身份证号"),
      style: TextStyle(fontSize: App.tffTextSize),
      maxLength: 18,
      keyboardType: TextInputType.text,
      inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp("[0-9xX]")), LengthLimitingTextInputFormatter(20)],
      onChanged: (value) {
        _idCardNum = value;
      },
    );

    var tffPhoneNum = TextField(
      decoration: InputDecoration(labelText: "请输入手机号"),
      style: TextStyle(fontSize: App.tffTextSize),
      maxLength: 11,
      keyboardType: TextInputType.phone,
      inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp("[0-9]")), LengthLimitingTextInputFormatter(20)],
      onChanged: (value) {
        _phoneNum = value;
      },
    );

    var btn = MaterialButton(
      color: primaryColor,
      disabledColor: disabledColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
      padding: EdgeInsets.all(14.0),
      child: Text(
        "确认",
        style: TextStyle(color: Colors.white, fontSize: App.btnTextSize),
      ),
      onPressed: () => _onBtnClick(context),
    );

    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        tffIdCardName,
        tffIdCardNum,
        tffPhoneNum,
        Container(
          width: double.infinity,
          child: btn,
          padding: EdgeInsets.only(top: 20.0),
        ),
      ],
    );

    return Scaffold(
      appBar: App.getAppBar("输入信息"),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: column,
      ),
    );
  }

  void _onBtnClick(BuildContext context) {
    if (_idCardName.isEmpty) {
      ToastUtil.instance.showToast("请输入真实姓名！");
    } else if (_idCardNum.isEmpty || (_idCardNum.length != 15 && _idCardNum.length != 18)) {
      ToastUtil.instance.showToast("请输入身份证号！");
    } else if (_phoneNum.isEmpty || _phoneNum.length != 11) {
      ToastUtil.instance.showToast("请输入手机号！");
    } else {
      var stsUserInfo = StsUserInfo(
        departmentNo: null,
        userName: _idCardName,
        cardType: StsFlutter.CARD_TYPE_ID_CARD,
        cardNum: _idCardNum,
        phoneNum: _phoneNum,
        userCity: null,
        userEmail: null,
        certExt2: null,
        certExt3: null,
        certExt4: null,
      );

      CacheUtil.saveUserInfo(stsUserInfo);
      Navigator.pop(context, {"stsUserInfo": stsUserInfo});
    }
  }
}
