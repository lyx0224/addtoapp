import 'package:fish_redux/fish_redux.dart';

class MyFishState implements Cloneable<MyFishState> {

  @override
  MyFishState clone() {
    return MyFishState();
  }
}

MyFishState initState(Map<String, dynamic> args) {
  return MyFishState();
}
