import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MyFishAction { action }

class MyFishActionCreator {
  static Action onAction() {
    return const Action(MyFishAction.action);
  }
}
