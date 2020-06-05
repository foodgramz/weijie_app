import 'package:city_pickers/city_pickers.dart';
import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weijie/services/api/services.dart';
import 'package:weijie/services/request/user_respository.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<RegisterState> buildEffect() {
  return combineEffects(<Object, Effect<RegisterState>>{
    RegisterAction.regist: _regist,
    RegisterAction.success:_success,
    RegisterAction.failure:_failure,
    RegisterAction.showCity: _showCity,
  });
}

Future<void> _showCity(Action action, Context<RegisterState> ctx) async {
  Result result = await CityPickers.showCityPicker(
    cancelWidget: Text(
      '取消',
      style: TextStyle(fontSize: ScreenUtil().setSp(26),color: Color(0xff999999)),
    ),
    confirmWidget: Text(
      '确定',
      style: TextStyle(fontSize: ScreenUtil().setSp(26),color: Color(0xfffe1314)),
    ),
    context: ctx.context,
  );
  if(result!=null){
    ctx.state.address=result.provinceName+result.cityName+result.areaName;
    ctx.dispatch(RegisterActionCreator.showCitySuccess());
  }
}



void _regist(Action action, Context<RegisterState> ctx) {
//  FormData formData= FormData.fromMap(action.payload);
//  Services.asyncRequest(
//      ctx,
//          () => UserRespository.regist(formData: formData),
//      RegisterActionCreator.request(),
//          (json) => RegisterActionCreator.success(json),
//          (errorInfo) => RegisterActionCreator.failure(errorInfo));
}


void _success(Action action, Context<RegisterState> ctx) {
  print("跳转页面操作");
}

void _failure(Action action, Context<RegisterState> ctx) {
  print(action.payload);
}
