import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp/base/GSYListState.dart';
import 'package:myapp/base/GSYPullLoadWidget.dart';
import 'package:myapp/model/BaseResp.dart';
import 'package:myapp/model/UserModel.dart';
import 'package:myapp/ui/NewPage.dart';
import 'package:myapp/ui/ScrollPage.dart';
import 'package:myapp/ui/TestPage.dart';
import 'package:myapp/ui/TestPage1.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
          // counter didn't reset back to zero; the application is not restarted.
          primarySwatch: Colors.blue,
          platform: TargetPlatform.iOS //滑动返回
          ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends GSYListState<MyHomePage>
    with WidgetsBindingObserver {
  @override
  Future<Null> handleRefresh() async {
    if (isLoading) {
      return null;
    }
    isLoading = true;
    page = 1;

    for (int i = 0; i < 20; i++) {
      var json = {
        "msg": "dasdas",
        "object": {
          "id": "487349",
          "userName": "Pooja Bhaumik  $i",
          "score": 1000,
          "order": {"orderId": "$i"}
        }
      };
      UserModel userModel =
          BaseResp<UserModel>(json, (res) => UserModel.fromJson(res)).data;
      pullLoadWidgetControl.dataList.add(userModel);
    }
    pullLoadWidgetControl.dataList =
        pullLoadWidgetControl.dataList.sublist(0, 10);
    setState(() {
      pullLoadWidgetControl.needLoadMore = true;
    });
    isLoading = false;
    return null;
  }

  @override
  Future<Null> onLoadMore() async {
    if (isLoading) {
      return null;
    }
    isLoading = true;
    page++;
//
//    for (int i = 0; i < 10; i++) {
//      pullLoadWidgetControl.dataList.add("dasdasda");
//    }
    setState(() {
      pullLoadWidgetControl.needLoadMore = true;
    });
    isLoading = false;
    return null;
  }

  @override
  bool get wantKeepAlive => true;

  @override
  requestRefresh() {}

  @override
  requestLoadMore() {}

  @override
  bool get isRefreshFirst => false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    super.build(context);
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: GSYPullLoadWidget(
        pullLoadWidgetControl,
        (BuildContext context, int index) =>
            _renderEventItem(pullLoadWidgetControl.dataList[index]),
        handleRefresh,
        onLoadMore,
        refreshKey: refreshIndicatorKey,
      ),
    );
  }

  _renderEventItem(UserModel asa) {
    return new GestureDetector(
      onTap: () {
        onItemClick(asa);
      },
      child: new Row(children: <Widget>[new Text(asa.userName)]),
    );
  }

  void onItemClick(UserModel userModel) {
//    Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new NewPage("PageView&BottomNavgationBar")));
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new ScrollPage("ScrollView联动效果测试")));
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (pullLoadWidgetControl.dataList.length == 0) {
      showRefreshLoading();
    }
    super.didChangeDependencies();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (pullLoadWidgetControl.dataList.length != 0) {
        showRefreshLoading();
      }
    }
  }
}
