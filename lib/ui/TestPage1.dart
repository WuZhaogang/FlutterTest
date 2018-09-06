import 'package:flutter/material.dart';

class TestPage1 extends StatelessWidget {
  final String title;

  TestPage1(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Text("这是内容!!!!"),
    );
  }
}
