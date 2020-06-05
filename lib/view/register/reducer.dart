import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';
import 'state.dart';

Reducer<RegisterState> buildReducer() {
  return asReducer(
    <Object, Reducer<RegisterState>>{
      RegisterAction.showCitySuccess:_showCitySuccess,
    },
  );
}

RegisterState _showCitySuccess(RegisterState state, Action action) {
  final RegisterState newState = state.clone();
//  newState.customerAddr=state.customerAddr;
//  newState.customerPhone=state.customerPhone;
//  newState.customerName=state.customerName;
//  newState.detailAddr=state.detailAddr;
//  newState.checkType=state.checkType;
  return newState;
}

