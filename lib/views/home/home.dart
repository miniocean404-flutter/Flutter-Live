import 'package:flutter/material.dart';
import 'package:my_app/views/home/RecommendTitle.dart';
import 'package:my_app/views/home/TabPage/BrowserJump.dart';
import 'package:my_app/views/home/TabPage/ClickAdd.dart';
import 'package:my_app/views/home/TabPage/Recommend.dart';
import 'package:my_app/views/home/TabPage/RouterUse.dart';

// * 主页的容器
class HomeContainer extends StatelessWidget {
  const HomeContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: HomeAppbar()._buildAppBar(context),
        body: HomeBody(),
      ),
    );
  }
}

// * AppBar
class HomeAppbar {
  PreferredSizeWidget _buildAppBar(context) {
    return AppBar(
      title: RecommendTitle(),
      centerTitle: true,
      elevation: 0,
      // brightness: Brightness.light,
      bottom: TabBar(
        isScrollable: true, // 横向滚动

        tabs: [
          Tab(
            child: Text('推荐'),
          ),
          Tab(
            child: Text('路由'),
          ),
          Tab(
            child: Text('点击添加'),
          ),
          Tab(
            child: Text('打开默认浏览器'),
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
        ],
      ),
    );
  }
}

// * Body
class HomeBody extends StatefulWidget {
  HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        Recommend(),
        RouterUse(),
        ClickAdd(),
        BrowserJump(),
        Container(child: Text('bar2')),
        Container(child: Text('bar2')),
        Container(child: Text('bar 2')),
        Container(child: Text('bar2')),
      ],
    );
  }
}
