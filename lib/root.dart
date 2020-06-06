/*
 * @Author: zzj
 * @LastEditors: dachui.wzc
 * @Date: 2019-04-17 19:44:47
 * @LastEditTime: 2019-05-13 15:20:19
 */

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weijie/config/zhyn_colors.dart';
import 'package:weijie/view/home/page.dart';
import 'package:weijie/view/test1/page.dart';

import 'main.dart';
import 'view/login/page.dart';

class Root extends StatefulWidget {
  String account;
  String token;
  bool isLogin;
  Map<String,dynamic> userInfo;
//  int outCurrentIndex;
  int currentIndex = 0; //当前tabbar索引
  Root({Key key, this.account,this.token,this.userInfo,this.isLogin,this.currentIndex=0}) : super(key: key);
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root>{
  int num=0;
  int _lastClickTime = 0;
  AppLifecycleState _notification;
  @override
  void initState()  {
    super.initState();
    var permission =  PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
    print("permission status is " + permission.toString());
    PermissionHandler().requestPermissions(<PermissionGroup>[
      PermissionGroup.storage, // 在这里添加需要的权限
    ]);
  }



  @override
  Widget build(BuildContext context) {
    //PX屏幕适配
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: () {
          int nowTime = new DateTime.now().microsecondsSinceEpoch;
          if (_lastClickTime != 0 && nowTime - _lastClickTime > 1500) {
            return new Future.value(true);
          } else {
            _lastClickTime = new DateTime.now().microsecondsSinceEpoch;
            new Future.delayed(const Duration(milliseconds: 1500), () {
              _lastClickTime = 0;
            });
            Fluttertoast.showToast(msg: '再一次点击返回键关闭程序');
            return new Future.value(false);
          }
        },
        child: new Scaffold(
          body: IndexedStack(
            index: widget.currentIndex,
            children: [
              HomePage().buildPage(null),
              LoginPage().buildPage(null),
              TestPage().buildPage(null),
              TestPage().buildPage(null),
            ],
          ),
          bottomNavigationBar: _bottomNavigationBar(),
        ),
      ),
      title: '微洁',
      theme: new ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.red,
      ),
    );
  }

//底部bar的item,
  BottomNavigationBarItem _barItem(pos, image1, image2, title) {
    return BottomNavigationBarItem(
        icon: Image.asset(
          widget.currentIndex == pos ? image1 : image2,
          width: ScreenUtil.getInstance().setWidth(48),
          height: ScreenUtil.getInstance().setWidth(48),
          fit: BoxFit.fill,
        ),
        title: Text(title));
  }

  CupertinoTabBar _bottomNavigationBar() {
    return CupertinoTabBar(
      items: [
        _barItem(0, 'assets/images/ic_home_tab_1_y.png', 'assets/images/ic_home_tab_1_n.png',
            '首页'),
        _barItem(1, 'assets/images/ic_home_tab_2_y.png', 'assets/images/ic_home_tab_2_n.png',
            '分类'),
        _barItem(2, 'assets/images/ic_home_tab_3_y.png', 'assets/images/ic_home_tab_3_n.png',
            '查询'),
        _barItem(3, 'assets/images/ic_home_tab_4_y.png', 'assets/images/ic_home_tab_4_n.png',
            '我的'),
      ],
      currentIndex: widget.currentIndex,
      activeColor: ZhynColor.appColor[40],
      inactiveColor: ZhynColor.appColor[10],
      onTap: (int index) {
        setState(() {
          widget.currentIndex = index;
        });
      },
    );
  }

}

