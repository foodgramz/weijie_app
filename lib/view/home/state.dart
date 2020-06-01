import 'package:fish_redux/fish_redux.dart';
import 'package:weijie/widgets/load_state.dart';

class HomeState implements Cloneable<HomeState> {

  LoadState loadState=LoadState.State_Loading;

  List<dynamic> wjPersonList = [
  {'personContent':"李小龙（1940年11月27日—1973年7月20日），原名李振藩，师承叶问，1940年出生于美国加州旧金山，",
    'userName':"张三",'account':"13877778876",'headUrl':"https://yifangwu.oss-cn-hangzhou.aliyuncs.com/common/441ff0ae2543bc809b6e6001730f3f2c.jpg",'area':"杭州"},
  {'personContent':"成龙（Jackie Chan），1954年4月7日出生于香港，祖籍安徽芜湖，中国男演员、导演、国家一级演员、制作人、编剧、歌手",
    'userName':"李四",'account':"15899009909",'headUrl':"https://yifangwu.oss-cn-hangzhou.aliyuncs.com/common/daa2f5392dd52f4936fcf6c8096106f3.jpg",'area':"上海"},
  {'personContent':"李连杰1971年进入北京什刹海体校，从而开始武术运动员的生涯。1975年参加全运会武术套路比赛，获得全能冠军",
    'userName':"王五",'account':"18678889712",'headUrl':"https://yifangwu.oss-cn-hangzhou.aliyuncs.com/common/0f7259528e4d6323a3a0606bbff2ddfc.jpg",'area':"北京"},
  {'personContent':"洪金宝，1952年1月7日出生于中国香港，中国香港男演员、导演、动作指导、监制、编剧、制作人",
    'userName':"孙六",'account':"13100000000",'headUrl':"https://yifangwu.oss-cn-hangzhou.aliyuncs.com/common/ebc2d60e2080db3620228f81cb38e51a.jpg",'area':"天津"}
  ];

  @override
  HomeState clone() {
    return HomeState()
    ..loadState=loadState
    ..wjPersonList=wjPersonList;
  }
}

HomeState initState(Map<String, dynamic> args) {
  HomeState state =HomeState()
  ..loadState
  ..wjPersonList;
  return state;
}
