import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MyFishPage extends Page<MyFishState, Map<String, dynamic>> {
  MyFishPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<MyFishState>(
                adapter: null,
                slots: <String, Dependent<MyFishState>>{
                }),
            middleware: <Middleware<MyFishState>>[
            ],);

}
