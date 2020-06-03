

import 'package:dio/dio.dart';
import 'package:weijie/services/api/services.dart';

class UserRespository{
  //登录
  static Future<Response> login({FormData formData})   async {
    return Services.request().post('/login/anon/telCodeLogin',data: formData);
  }

  //注册
  static Future<Response> regist({FormData formData})   async {
    return Services.request().post('/login/anon/register',data: formData);
  }


  static Future<Response> queryUser({Map<String,dynamic> queryParam})   async {
    return Services.request().post('/login/anon/queryUser',data: queryParam);
  }



}