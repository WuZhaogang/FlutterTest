
import 'package:flutter/material.dart';
import 'package:myapp/base/BasePage.dart';

class TestPage extends BasePage{
  final String title;

  TestPage(this.title);

  @override
  State<StatefulWidget> createState() {
    return new TestPageState(title);
  }

}

class TestPageState extends State<TestPage>{
  final String title;

  TestPageState(this.title);

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.green,
      child: new Column(
        children: <Widget>[
          new Text("dasdasdasdasd"),
          new Text("dasdasdasdasd"),
          new Text("dasdasdasdasd"),
          new Text("dasdasdasdasd")
        ],
      ),
    );
  }

}