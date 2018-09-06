import 'package:flutter/material.dart';
import 'package:myapp/base/BasePage.dart';

class ScrollPage extends BasePage {
  final String title;

  ScrollPage(this.title);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ScrollPageState(title);
  }
}

class ScrollPageState extends State<ScrollPage> {
  final String title;

  ScrollPageState(this.title);

  final List<ListItem> listData = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    for (int i = 0; i < 20; i++) {
      listData.add(new ListItem("我是测试标题$i", Icons.cake));
    }

    return new Scaffold(
        body: new NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    )),
                background: Image.network(
                  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1531798262708&di=53d278a8427f482c5b836fa0e057f4ea&imgtype=0&src=http%3A%2F%2Fh.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F342ac65c103853434cc02dda9f13b07eca80883a.jpg",
                  fit: BoxFit.fill,
                )),
          ),
        ];
      },
      body: Center(
        child: new ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return new ListItemWidget(listData[index]);
          },
          itemCount: listData.length,
        ),
      ),
    ));
  }
}

class ListItem {
  final String title;
  final IconData iconData;

  ListItem(this.title, this.iconData);
}

class ListItemWidget extends StatelessWidget {
  final ListItem listItem;

  ListItemWidget(this.listItem);

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      child: new ListTile(
        leading: new Icon(listItem.iconData),
        title: new Text(listItem.title),
      ),
      onTap: () {},
    );
  }
}
