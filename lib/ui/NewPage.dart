import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myapp/base/BasePage.dart';

class NewPage extends BasePage {
  @override
  State<StatefulWidget> createState() => NewPageState();
}

class NewPageState extends State<NewPage> {
  var _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("新页面"),
      ),
      body: new Text("这是内容"),
      bottomNavigationBar: new BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              icon: new Icon(Icons.add),
              title: new Text(
                "dasdasda",
                style: new TextStyle(color: Colors.black),
              )),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.clear),
              title: new Text(
                "dasdasda",
                style: new TextStyle(color: Colors.black),
              )),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.build),
              title: new Text(
                "dasdasda",
                style: new TextStyle(color: Colors.black),
              )),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.print),
              title: new Text(
                "dasdasda",
                style: new TextStyle(color: Colors.black),
              )),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.ac_unit),
              title: new Text(
                "dasdasda",
                style: new TextStyle(color: Colors.black),
              ))
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
