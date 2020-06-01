import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weijie/config/zhyn_colors.dart';
import 'package:weijie/generated/l10n.dart';
import 'package:weijie/view/loadData/page.dart';
import 'package:weijie/widgets/load_state.dart';
import 'package:flutter/material.dart';
import 'package:weijie/widgets/progressview.dart';

import '../../settting.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("微洁到家"),
      ),

      body:  GestureDetector(
            child: CustomScrollView(
                slivers:<Widget>[
                  SliverSafeArea(sliver: SliverPadding(
                      padding: EdgeInsets.all(1.0),
                      sliver:
                      SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 1.0,
                          crossAxisSpacing:0.1,
                          childAspectRatio: 0.55,
                        ),
                        delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index){
                            final bean = state.wjPersonList[index];
                            return _item(bean,dispatch,state);
                          },
                          childCount: state.wjPersonList.length,

                        ),
                      )
                  ),
                  ),

                ]
            )
        ),
  );
}

Widget _item(dynamic bean,Dispatch dispatch,HomeState state){
  return Container(
    padding: EdgeInsets.only(
      left: ScreenUtil.getInstance().setWidth(20),
      right: ScreenUtil.getInstance().setWidth(20),
    ),
    child: Column(
      children: <Widget>[
        Container(
          child: new Container(
              width: ScreenUtil.getInstance().setWidth(350.0),
              height: ScreenUtil.getInstance().setWidth(350.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: bean['headUrl'],
                  placeholder: (context, url) => new ProgressView(),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                ),
              )
          ),
        ),
        Container(
          child: Text(bean['personContent'],style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Text(bean['userName'],style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              ),
              Expanded(
                child: Container(
                  child: Text(bean['area']),
                ),
              ),
              Expanded(
                child: Container(
                  child: Icon(Icons.phone,color: Colors.red,),
                ),
              ),
              Expanded(
                child: Container(
                  child: Icon(Icons.flash_on,color: Colors.blue,),
                ),
              ),
            ],
          )
        ),
      ],
    ),
  );
}



