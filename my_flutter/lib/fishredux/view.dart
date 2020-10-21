import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(
    MyFishState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text('fish-redux'),
    ),
    body: Container(
      alignment: Alignment.center,
      color: Colors.yellow[50],
      child: Text('this is a fish redux page, route name is myfish'),
    ),
  );
}
