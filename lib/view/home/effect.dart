import 'package:fish_redux/fish_redux.dart';
import 'package:weijie/services/api/services.dart';
import 'package:weijie/services/request/user_respository.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    Lifecycle.initState:_init,
    HomeAction.action:_onAction,
  });
}


void _init(Action action, Context<HomeState> ctx) {
  ctx.dispatch(HomeActionCreator.onAction());
}


void _onAction(Action action, Context<HomeState> ctx) {
  Services.asyncRequest(
      ctx,
          () => UserRespository.queryUser(queryParam:{}),
      HomeActionCreator.request(),
          (json) => HomeActionCreator.success(json['data']),
          (errorInfo) => HomeActionCreator.failure(errorInfo));
}

