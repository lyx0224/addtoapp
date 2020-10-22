import 'package:flutter/material.dart';

class SliverDemo extends StatelessWidget {
  static const int count = 15;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sliver demo2'),
      ),
      body: Container(
        color: Colors.red[50],
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              //title: Text('sliver app bar'),
              actions: <Widget>[Text('btn1'), Text('btn2')],
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('FlexibleSpaceBar'),
                background: Image.network(
                  'https://r-cf.bstatic.com/images/hotel/max1024x768/116/116281457.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate(
                    List<Widget>.generate(count, (index) {
              return Container(
                child: Text('item$index'),
                alignment: Alignment.center,
                color: Colors.red.withAlpha(index * 255 ~/ count),
                height: 100,
              );
            }).toList())),
          ],
        ),
      ),
    );
  }
}
