import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum HomeAction { action,changeState,request,success,failure }

class HomeActionCreator {
  static Action onAction() {
    return const Action(HomeAction.action);
  }

  static Action changeState() {
    return Action(HomeAction.changeState);
  }

  static Action request() {
    return Action(HomeAction.request);
  }

  static Action success(dynamic json) {
    return Action(HomeAction.success,payload: json);
  }

  static Action failure(dynamic errorInfo) {
    return Action(HomeAction.failure,payload: errorInfo);
  }
}
