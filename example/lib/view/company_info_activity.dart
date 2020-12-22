import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sts_flutter/model/sts_company_info.dart';
import 'package:sts_flutter_example/app.dart';
import 'package:sts_flutter_example/utils/cache_util.dart';
import 'package:sts_flutter_example/utils/toast_util.dart';

class CompanyInfoActivity extends StatefulWidget {
  @override
  _CompanyInfoState createState() => _CompanyInfoState();
}

class _CompanyInfoState extends State<CompanyInfoActivity> {
  String _companyName = "";
  String _companyNo = "";
  String _idCardName = "";
  String _idCardNum = "";
  String _phoneNum = "";

  @override
  void initState() {
    super.initState();
    initUserInfo();
  }

  void initUserInfo() async {
    StsCompanyInfo stsCompanyInfo = await CacheUtil.companyInfo;
    setState(() {
      _companyName = stsCompanyInfo?.companyName ?? "";
      _companyNo = stsCompanyInfo?.companyNo ?? "";
      _idCardName = stsCompanyInfo?.userName ?? "";
      _idCardNum = stsCompanyInfo?.cardNum ?? "";
      _phoneNum = stsCompanyInfo?.phoneNum ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    var disabledColor = Theme.of(context).hintColor;

    //
    var tffCompanyName = TextField(
      decoration: InputDecoration(labelText: "请输入企业名称"),
      style: TextStyle(fontSize: App.tffTextSize),
      maxLength: 20,
      keyboardType: TextInputType.text,
      inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(20)],
      onChanged: (value) {
        _companyName = value;
      },
      controller: TextEditingController.fromValue(
        TextEditingValue(
          text: _companyName ?? "", //判断keyword是否为空
          // 保持光标在最后
          selection: TextSelection.fromPosition(
            TextPosition(affinity: TextAffinity.downstream, offset: _companyName?.length ?? 0),
          ),
        ),
      ),
    );

    var tffCompanyNo = TextField(
      decoration: InputDecoration(labelText: "请输入企业税号"),
      style: TextStyle(fontSize: App.tffTextSize),
      maxLength: 18,
      keyboardType: TextInputType.text,
      inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")), LengthLimitingTextInputFormatter(18)],
      onChanged: (value) {
        _companyNo = value;
      },
      controller: TextEditingController.fromValue(
        TextEditingValue(
          text: _companyNo ?? "", //判断keyword是否为空
          // 保持光标在最后
          selection: TextSelection.fromPosition(
            TextPosition(affinity: TextAffinity.downstream, offset: _companyNo?.length ?? 0),
          ),
        ),
      ),
    );

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
      controller: TextEditingController.fromValue(
        TextEditingValue(
          text: _idCardName ?? "", //判断keyword是否为空
          // 保持光标在最后
          selection: TextSelection.fromPosition(
            TextPosition(affinity: TextAffinity.downstream, offset: _idCardName?.length ?? 0),
          ),
        ),
      ),
    );

    var tffIdCardNum = TextField(
      decoration: InputDecoration(labelText: "请输入身份证号"),
      style: TextStyle(fontSize: App.tffTextSize),
      maxLength: 18,
      keyboardType: TextInputType.text,
      inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp("[0-9xX]")), LengthLimitingTextInputFormatter(18)],
      onChanged: (value) {
        _idCardNum = value;
      },
      controller: TextEditingController.fromValue(
        TextEditingValue(
          text: _idCardNum ?? "", //判断keyword是否为空
          // 保持光标在最后
          selection: TextSelection.fromPosition(
            TextPosition(affinity: TextAffinity.downstream, offset: _idCardNum?.length ?? 0),
          ),
        ),
      ),
    );

    var tffPhoneNum = TextField(
      decoration: InputDecoration(labelText: "请输入手机号"),
      style: TextStyle(fontSize: App.tffTextSize),
      maxLength: 11,
      keyboardType: TextInputType.phone,
      inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp("[0-9]")), LengthLimitingTextInputFormatter(11)],
      onChanged: (value) {
        _phoneNum = value;
      },
      controller: TextEditingController.fromValue(
        TextEditingValue(
          text: _phoneNum ?? "", //判断keyword是否为空
          // 保持光标在最后
          selection: TextSelection.fromPosition(
            TextPosition(affinity: TextAffinity.downstream, offset: _phoneNum?.length ?? 0),
          ),
        ),
      ),
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

    var listView = ListView(
      children: <Widget>[
        tffCompanyName,
        tffCompanyNo,
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
        child: listView,
      ),
    );
  }

  void _onBtnClick(BuildContext context) {
    if (_companyName.isEmpty) {
      ToastUtil.instance.showToast("请输入企业名称！");
    } else if (_companyNo.isEmpty || _companyNo.length != 18) {
      ToastUtil.instance.showToast("请输入企业税号！");
    } else if (_idCardName.isEmpty) {
      ToastUtil.instance.showToast("请输入真实姓名！");
    } else if (_idCardNum.isEmpty || (_idCardNum.length != 15 && _idCardNum.length != 18)) {
      ToastUtil.instance.showToast("请输入身份证号！");
    } else if (_phoneNum.isEmpty || _phoneNum.length != 11) {
      ToastUtil.instance.showToast("请输入手机号！");
    } else {
      var stsCompanyInfo = StsCompanyInfo(
        departmentNo: null,
        companyName: _companyName,
        companyNo: _companyNo,
        userName: _idCardName,
        cardNum: _idCardNum,
        phoneNum: _phoneNum,
        userEmail: null,
        certExt2: null,
        certExt3: null,
        certExt4: null,
      );

      CacheUtil.saveCompanyInfo(stsCompanyInfo);
      Navigator.pop(context, {"stsCompanyInfo": stsCompanyInfo});
    }
  }
}
