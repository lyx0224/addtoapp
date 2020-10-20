import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

class MyPage extends StatelessWidget {
  final Map<String, dynamic> params;

  const MyPage({Key key, this.params}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("my page"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Text(
              "this is my page, params is $params",
              style: TextStyle(color: Colors.redAccent),
            ),
            SizedBox(
              height: 5,
            ),
            RaisedButton(
              onPressed: () {
                FlutterBoost.singleton.open('first').then((v) {});
              },
              child: Text("nav to first page by fb"),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('mypage');
              },
              child: Text("navigator to my page"),
            )
          ],
        ),
      ),
    );
  }
}