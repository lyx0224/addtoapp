import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("main page"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Text("this is main.dart ’s home widget"),
            SizedBox(
              height: 5,
            ),
            RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'mypage');
                },
                child: Text("navigator to my page")),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              onPressed: () {
                FlutterBoost.singleton.open('mypage').then((v) {});
              },
              child: Text("fb mypage"),
            ),
            Text(
              "tips: not work in flutter module, but work well in host app",
              style: TextStyle(color: Colors.red),
            ),
            RaisedButton(
              onPressed: () {
                Fluttertoast.showToast(msg: "you clicked me");
              },
              child: Text("toast"),
            )
          ],
        ),
      ),
    );
  }
}
