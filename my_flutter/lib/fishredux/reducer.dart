import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MyFishState> buildReducer() {
  return asReducer(
    <Object, Reducer<MyFishState>>{
      MyFishAction.action: _onAction,
    },
  );
}

MyFishState _onAction(MyFishState state, Action action) {
  final MyFishState newState = state.clone();
  return newState;
}
