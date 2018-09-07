import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  static const jumpPlugin = const MethodChannel('com.wzg.jump/plugin');

  Future<Null> _jumpToNative() async {
    String result = await jumpPlugin.invokeMethod('acOne');

    print(result);
  }


  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: (){
        _jumpToNative();
      },
      child: new Container(
        color: Colors.green,
        child: new Column(
          children: <Widget>[
            new Text("dasdasdasdasd"),
            new Text("dasdasdasdasd"),
            new Text("dasdasdasdasd"),
            new Text("dasdasdasdasd")
          ],
        ),
      ),
    );
  }

}