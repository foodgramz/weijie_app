import 'package:fish_redux/fish_redux.dart';
import 'package:weijie/widgets/load_state.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
//      HomeAction.action: _onAction,
      HomeAction.changeState:_changeState,
      HomeAction.success:_success,
    },
  );
}

HomeState _onAction(HomeState state, Action action) {
  final HomeState newState = state.clone();
  newState.loadState = LoadState.State_Success;
  newState.wjPersonList =state.wjPersonList;
  return newState;
}


HomeState _changeState(HomeState state, Action action) {
  final HomeState newState = state.clone();
  newState.loadState = state.loadState;
  return newState;
}

HomeState _success(HomeState state, Action action) {
  final HomeState newState = state.clone();
  newState.wjPersonList = action.payload['list'];
  return newState;
}