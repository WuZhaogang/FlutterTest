import 'package:flutter/material.dart';
import 'package:myapp/base/BasePage.dart';
import 'package:myapp/ui/TestPage.dart';

class NewPage extends BasePage {
  final String title;

  NewPage(this.title);

  @override
  State<StatefulWidget> createState() => NewPageState(title);
}

class NewPageState extends State<NewPage> with SingleTickerProviderStateMixin {
  var _currentIndex = 0;
  TabController _controller;
  VoidCallback onChanged;
  String title;

  NewPageState(this.title);

  @override
  void initState() {
    super.initState();
    _controller =
    new TabController(initialIndex: _currentIndex, length: 5, vsync: this);
    onChanged = () {
      setState(() {
        _currentIndex = this._controller.index;
      });
    };

    _controller.addListener(onChanged);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new TabBarView(
          children: <Widget>[
            new TestPage(),
            new TestPage(),
            new TestPage(),
            new TestPage(),
            new TestPage()
          ]
          , controller: _controller
      ),
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
