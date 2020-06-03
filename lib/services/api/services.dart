import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:weijie/util/datautil.dart';
import 'package:weijie/view/login/page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Services {

  static BaseOptions getOptions()  {
    BaseOptions options=BaseOptions();
    options.baseUrl='http://47.98.253.175/weijie-web';
    options.connectTimeout=25000;
    options.receiveTimeout=25000;
    options.headers['token']=DataUtil.getToken();
    options.headers['accept']='application/json';
    return options;
  }


  static Dio request(){
    return Dio(getOptions());
  }

  static asyncRequest(
      Context ctx,
      Future<Response> Function() apiFuture,
      dynamic request,
      dynamic Function(dynamic) success,
      dynamic Function(RequestFailureInfo) failuer) async {
    ctx.dispatch(request);
    try {
      final response = await apiFuture();
      if (response.data != null) {
        //判断返回数据是否正确
        String code = response.data['code'];
        if (code == 'SUCCESS') {
//          print(response.data['token']);
          if(response.data['token']!=null){
            DataUtil.saveToken(response.data['token']);

          }
          ctx.dispatch(success(response.data));
        }else if(code == 'UNAUTHORIZED'){
          Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
            return LoginPage().buildPage(null);
          }));
        }
        else {
          final model = RequestFailureInfo(
            errorCode: response.data['code'],
            errorMsg: response.data['remark'],
          );
          print(response.data);
          ctx.dispatch(failuer(model));
        }
      }
    } on DioError catch (e) {
      final model = RequestFailureInfo(
        errorCode: '-1',
        errorMsg: '请求失败',
      );
      ctx.dispatch(failuer(model));
    }
  }

}






class RequestFailureInfo {
  String errorCode;
  String errorMsg;

  RequestFailureInfo({this.errorCode, this.errorMsg});
}
