import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<MyFishState> buildEffect() {
  return combineEffects(<Object, Effect<MyFishState>>{
    MyFishAction.action: _onAction,
  });
}

void _onAction(Action action, Context<MyFishState> ctx) {
}
