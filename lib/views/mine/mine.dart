import 'package:flutter/material.dart';

import '../router/router.dart';

const tabBar = [
  Tab(
    child: Text('路由'),
  ),
  Tab(
    child: Text('界面'),
  ),
  Tab(
    child: Text('界面好看'),
  ),
  Tab(
    child: Text('界面'),
  ),
  Tab(
    child: Text('路由'),
  ),
  Tab(
    child: Text('界面'),
  ),
  Tab(
    child: Text('界面好看'),
  ),
  Tab(
    child: Text('界面'),
  ),
];

class Mine extends StatelessWidget {
  const Mine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: MineAppbar()._buildAppBar(),
        body: MineBody(),
      ),
    );
  }
}

// * AppBar
class MineAppbar {
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text('我'),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: (() => {print('我的页面中的搜索按钮点击')}),
        ),
      ],
      bottom: TabBar(
        isScrollable: true, // 横向滚动
        tabs: tabBar,
      ),
    );
  }
}

class MineBody extends StatelessWidget {
  const MineBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        Container(
            child: Wrap(
          children: <Widget>[
            TextButton(
              child: Text('基本路由'),
              onPressed: () => {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => RouterPage()))
              },
            ),
            TextButton(
              child: Text('命名传参路由'),
              onPressed: () => {Navigator.pushNamed(context, '/NameRouter')},
            )
          ],
        )),
        Container(child: Text('bar2')),
        Container(child: Text('bar2')),
        Container(child: Text('bar2')),
        Container(child: Text('bar2')),
        Container(child: Text('bar2')),
        Container(child: Text('bar2')),
        Container(child: Text('bar2')),
      ],
    );
  }
}
