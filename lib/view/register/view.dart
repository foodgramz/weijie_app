import 'package:fish_redux/fish_redux.dart';
import 'package:weijie/config/zhyn_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:city_pickers/city_pickers.dart';
import '../login/action.dart';
import 'action.dart';
import 'state.dart';


Widget buildView(RegisterState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        elevation: 0,
        centerTitle: true,
//          title: Text(S.of(viewService.context).darkMode),
      ),

      body: GestureDetector(
          onTap: (){
            FocusScope.of(viewService.context).requestFocus(FocusNode());
          },
          child: _body(state,dispatch)
      )
  );
}


Widget _body(RegisterState state, Dispatch dispatch){
  ScrollController _scrollController = ScrollController();
  return SafeArea(
      top: false,
      bottom: false,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(child:CustomScrollView(
              controller:_scrollController,
              slivers:<Widget>[
                SliverList(
                  delegate: SliverChildListDelegate(<Widget>[
                    _title(state,dispatch),
                  ]),
                ),
              ]
          )
          ),
        ],));
}

Widget _title(RegisterState state,Dispatch dispatch){
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  return Column(
    children: <Widget>[
      Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(
                left: ScreenUtil.getInstance().setWidth(80.0),
                top: ScreenUtil.getInstance().setWidth(50.0),
                right: ScreenUtil.getInstance().setWidth(80.0),
              ),
              alignment: Alignment.centerLeft,
              child:Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  Container(
                    // decoration:BoxDecoration(
                    //   //设置四周边框
                    //   // border:Border(bottom:BorderSide(width: ScreenUtil.getInstance().setWidth(10),color: Colors.red)),
                    // ),
                    child: Text("注册新用户",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil.getInstance().setSp(55)
                      ),
                    ),
                  )
                ],
              )
          ),
          // CheckboxListTile(
          //   value: false, 
          //   onChanged: (value){
          //     // setState((){
          //     //   _checkboxUser = value;
          //     // });
          //   },
            
          //   title: Text('阿姨注册，请打勾'),
          //   subtitle: Text('不打勾为用户注册'),
          //   secondary: Icon(Icons.bookmark),
          //   // selected: _checkboxUser,
          //   activeColor: ZhynColor.appColor[40],
          //   ),
          Container(
            margin: EdgeInsets.only(
                top: ScreenUtil.getInstance().setWidth(50),
                left: ScreenUtil.getInstance().setWidth(80),
                right: ScreenUtil.getInstance().setWidth(80)
            ),
            child: FormBuilder(
              key: _fbKey,
              initialValue: {
                'date': DateTime.now(),
                'accept_terms': false,
              },
              autovalidate: true,
              child: Column(
                children: <Widget>[
                  Container(
                    child: FormBuilderTextField(
                      initialValue: "18018699892",
                      attribute: 'phone',
                      validators: <String Function(dynamic)>[
                        FormBuilderValidators.required(),
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.maxLength(11),
                      ],
                      decoration: InputDecoration(labelText: "请输入手机号码"),
                    ),
                  ),
                  Container(
                    child: FormBuilderTextField(
                      initialValue:"123456",
                      attribute: 'verification code',
                      validators: <String Function(dynamic)>[
                        FormBuilderValidators.minLength(6),
                        FormBuilderValidators.required(),
                      ],
                      decoration: InputDecoration(labelText: "请输入6位验证码"),
                    ),
                  ),
                  Container(
                    child: FormBuilderTextField(
                      initialValue:"李小英",
                      attribute: 'Username',
                      validators: <String Function(dynamic)>[
                        FormBuilderValidators.required(),
                      ],
                      decoration: InputDecoration(labelText: "请输入姓名"),
                    ),
                  ),
                  Container(
                    child: FormBuilderTextField(
                      initialValue:"我来自江苏徐州做过5年家政服务，为人诚恳，做事认真负责",
                      attribute: 'description',
                      validators: <String Function(dynamic)>[
                        FormBuilderValidators.minLength(6),
                        FormBuilderValidators.required(),
                      ],
                      decoration: InputDecoration(labelText: "请输入个人简介"),
                    ),
                  ),
                Expanded(
                  child: Container(
                    child: TextField(
                      cursorColor: ZhynColor.appColor[22],
                      maxLengthEnforced: false,
                      // controller: _addcontroller,
                      style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(20),
                        color:ZhynColor.appColor[22],
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        fillColor: Colors.transparent,
                        hintText: "请选择服务城市的区域",
                        hintStyle: TextStyle(
                          color:Color(0xff999999),
                          fontSize: 15,
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.only(
                            top: ScreenUtil.getInstance().setWidth(24),
                            bottom: ScreenUtil.getInstance().setWidth(24),
                          ),
                        ),
                      onTap: (){
                        dispatch(ReceiveAddressActionCreator.showCityPicker());
                      },
                    ),

                  ),
                ),
                

                  
                ],
              ),
            ),
          ),
          
          Container(
            width: double.infinity,
            height: ScreenUtil.getInstance().setWidth(80),
            margin: EdgeInsets.only(
              left: ScreenUtil.getInstance().setWidth(80.0),
              top: ScreenUtil.getInstance().setWidth(80.0),
              right: ScreenUtil.getInstance().setWidth(80.0),
            ),
            child: RaisedButton(
              onPressed: (){
                _fbKey.currentState.save();
                if (_fbKey.currentState.validate()) {
                  final Map<String, String> input = _fbKey
                      .currentState.value
                      .map((dynamic key, dynamic value) =>
                      MapEntry<String, String>(
                          key, value.toString()));
                  dispatch(RegisterActionCreator.regist(input));
                }
              },
              shape: StadiumBorder(side: BorderSide.none),
              color: ZhynColor.appColor[40],
              child: Text(
                "注册",
                style: TextStyle(color: Colors.white,fontSize: 15),
              ),
            ),
          ),
          GestureDetector(
              onTap: (){

              },
              child: Container(
                margin: EdgeInsets.only(
                    top: ScreenUtil.getInstance().setWidth(80)
                ),
                child: Text("忘记密码?",style: TextStyle(color:Colors.orange)),
              )
          ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(
                          top: ScreenUtil.getInstance().setWidth(30)
                      ),
                      child: Text("我有账号",),
                    )
                ),
                Expanded(
                    child: GestureDetector(
                      onTap: (){
                      //  dispatch(LoginActionCreator.toRegisterPage());
                      },
                      child: Container(
//                      decoration:BoxDecoration(
//                        //设置四周边框
//                        border:Border(bottom:BorderSide(width: ScreenUtil.getInstance().setWidth(1),color: Colors.orange)),
//                      ),
                        margin: EdgeInsets.only(
                          top: ScreenUtil.getInstance().setWidth(30),
                          right:  ScreenUtil.getInstance().setWidth(80),
                        ),
                        child: Text(" 登录",style: TextStyle(color:Colors.orange,)),
                      ),
                    )
                ),   
            
              ],
            ),
          )


        ],
      ),
    ],
  );
}

