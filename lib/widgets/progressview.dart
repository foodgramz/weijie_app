/*
 * @Author: dachui.wzc
 * @LastEditors: dachui.wzc
 * @Date: 2019-04-30 11:06:17
 * @LastEditTime: 2019-04-30 11:06:49
 */

import 'package:flutter/material.dart';

class ProgressView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new SizedBox(
        width: 24.0,
        height: 24.0,
        child: new CircularProgressIndicator(
          strokeWidth: 2.0,
        ),
      ),
    );
  }
}