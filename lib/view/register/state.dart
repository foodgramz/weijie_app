import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class RegisterState implements Cloneable<RegisterState> {

  bool isLoading;
  String address;

  @override
  RegisterState clone() {
    return RegisterState()
    ..isLoading=isLoading
    ..address=address;
  }
}

RegisterState initState(Map<String, dynamic> args) {
  RegisterState state=RegisterState()
  ..isLoading
  ..address;
  return state;
}
