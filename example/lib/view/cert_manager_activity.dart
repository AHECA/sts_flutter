import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sts_flutter_example/app.dart';
import 'package:sts_flutter_example/utils/cache_util.dart';
import 'package:sts_flutter_example/presenter/cert_manager_presenter.dart';
import 'package:sts_flutter/model/sts_user_info.dart';

class CertManagerActivity extends StatefulWidget {
  final bool isChecked;

  CertManagerActivity({@required this.isChecked});

  @override
  _CertManagerState createState() => _CertManagerState();
}

class _CertManagerState extends State<CertManagerActivity> {
  final EdgeInsets itemPadding = EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0);
  final List<String> titles = ["查看证书信息",   "重置证书密码", "修改证书密码", "指纹密码"];
  StsUserInfo userInfo ;
  bool isChecked;
  CertManagerPresenter presenter;

  @override
  void initState() {
    super.initState();
    this.isChecked = widget.isChecked;
    this.presenter = CertManagerPresenter();
  }

  void init() async {
     userInfo = await CacheUtil.userInfo;
}

  @override
  Widget build(BuildContext context) {

    var listView = ListView(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
      children: _getListItem(),
    );

    return Scaffold(
      appBar: App.getAppBar("证书管理"),
      body: listView,
    );
  }

  void _onListItemClick(int index) {
    switch (index) {
      case 0:
        presenter.certInfo(context);
        break;
      case 1:
        presenter.resetCertPin(context, userInfo);
        break;
      case 2:
        presenter.modifyCertPin(context);
        break;
      case 3:
        changeFingerprintState();
        break;
    }
  }

  Future changeFingerprintState() async {
    bool result = await presenter.changeFingerprintState(context, isChecked);
    setState(() {
      isChecked = result;
    });
  }

  Widget _getListItemChild(int index) {
    Widget child;
    switch (index) {
      case 0:
      case 1:
      case 2:
        child = Icon(
          Icons.chevron_right,
          color: Theme.of(context).primaryColor,
          size: 30.0,
        );
        break;
      case 3:
        child = Container(
          width: 60.0,
          height: 30.0,
          child: Switch(
            onChanged: (bool isChecked) => changeFingerprintState(),
            value: isChecked,
          ),
        );
//        child = AnimatedSwitcher(duration: Duration(seconds: 1),)
        break;
    }
    return child;
  }

  List<Widget> _getListItem() {
    List<Widget> list = List();

    for (var i = 0; i < titles.length; i++) {
      var gestureDetector = GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Container(
          padding: itemPadding,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  titles[i],
                  style: TextStyle(fontSize: App.menuTitleSize, color: Colors.black),
                ),
              ),
              _getListItemChild(i),
            ],
          ),
        ),
        onTap: () => _onListItemClick(i),
      );

      list.add(gestureDetector);
      list.add(Divider(
        color: Theme.of(context).dividerColor,
        height: 1.0,
      ));
    }

    return list;
  }
}
