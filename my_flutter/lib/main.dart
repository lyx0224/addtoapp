import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:my_flutter/fishredux/page.dart';
import 'package:my_flutter/home_page.dart';
import 'package:my_flutter/my_page.dart';
import 'package:my_flutter/sliver/sliver_demo.dart';
import 'simple_page_widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //fish-redux page
  final AbstractRoutes fishReduxRoutes = PageRoutes(
      pages: <String, Page<Object, dynamic>>{'myfish': MyFishPage()});

  @override
  void initState() {
    super.initState();

    FlutterBoost.singleton.registerPageBuilders(<String, PageBuilder>{
      'embeded': (String pageName, Map<String, dynamic> params, String _) =>
          EmbeddedFirstRouteWidget(),
      'first': (String pageName, Map<String, dynamic> params, String _) =>
          FirstRouteWidget(),
      'firstFirst': (String pageName, Map<String, dynamic> params, String _) =>
          FirstFirstRouteWidget(),
      'second': (String pageName, Map<String, dynamic> params, String _) =>
          SecondRouteWidget(),
      'secondStateful':
          (String pageName, Map<String, dynamic> params, String _) =>
              SecondStatefulRouteWidget(),
      'tab': (String pageName, Map<String, dynamic> params, String _) =>
          TabRouteWidget(),
      'platformView':
          (String pageName, Map<String, dynamic> params, String _) =>
              PlatformRouteWidget(),
      'flutterFragment':
          (String pageName, Map<String, dynamic> params, String _) =>
              FragmentRouteWidget(params),
      'mypage': (String pageName, Map<String, dynamic> params, String _) =>
          MyPage(params: params),
      'sliverdemo': (String pageName, Map<String, dynamic> params, String _) =>
          SliverDemo(),

      ///可以在native层通过 getContainerParams 来传递参数
      'flutterPage': (String pageName, Map<String, dynamic> params, String _) {
        print('flutterPage params:$params');

        return FlutterRouteWidget(params: params);
      },
      //fish-reudex路由交给flutterboost管理
      'myfish': (String pageName, Map<String, dynamic> params, String _) {
        return MyFishPage().buildPage(params);
      }
    });
    FlutterBoost.singleton
        .addBoostNavigatorObserver(TestBoostNavigatorObserver());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        title: 'Flutter Boost example',
        builder: FlutterBoost.init(postPush: _onRoutePushed),
        routes: <String, WidgetBuilder>{
          'mypage': (context) => MyPage(),
          'sliverdemo': (context) => SliverDemo()
        },
        onGenerateRoute: (RouteSettings settins) {
          return MaterialPageRoute(builder: (context) {
            return fishReduxRoutes.buildPage(settins.name, settins.arguments);
          });
        },
        home: MainPage());
  }

  void _onRoutePushed(
    String pageName,
    String uniqueId,
    Map<String, dynamic> params,
    Route<dynamic> route,
    Future<dynamic> _,
  ) {}
}

class TestBoostNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    print('flutterboost#didPush');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    print('flutterboost#didPop');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic> previousRoute) {
    print('flutterboost#didRemove');
  }

  @override
  void didReplace({Route<dynamic> newRoute, Route<dynamic> oldRoute}) {
    print('flutterboost#didReplace');
  }
}
