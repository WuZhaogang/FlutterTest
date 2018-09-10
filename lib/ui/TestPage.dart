import 'dart:async';
import 'dart:io';

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
  static const iosJumpPlugin = const MethodChannel(
      'samples.flutter.io/battery');

  Future<Null> _jumpToNative() async {
    if (Platform.isIOS) {
      iosJumpPlugin.invokeMethod("asdasd");
    } else {
      String result = await jumpPlugin.invokeMethod('acOne');
      print(result);
    }
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("dasdasd"),
      ),
      body: new GestureDetector(
        onTap: () {
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
      ),
    );
  }

}