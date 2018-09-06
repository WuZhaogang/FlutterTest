
import 'package:flutter/material.dart';
import 'package:myapp/base/BasePage.dart';

class TestPage extends BasePage{
  @override
  State<StatefulWidget> createState() {
    return new TestPageState();
  }

}

class TestPageState extends State<TestPage>{
  @override
  Widget build(BuildContext context) {
    return new Stack(
      alignment: const Alignment(0.6, 0.6),
      children: <Widget>[
        new Text("dsadasdasdasd"),
        new Container(
          decoration: new BoxDecoration(
            color: Colors.black45,
          ),
          child: new Text(
            'Mia B',
            style: new TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

}