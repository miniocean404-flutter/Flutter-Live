import 'package:flutter/material.dart';
import 'package:my_app/views/home/recommend-title.dart';
import 'package:my_app/views/home/tab-page/click-add.dart';
import 'package:my_app/views/home/tab-page/recommend.dart';
import 'package:my_app/views/home/tab-page/router-use.dart';
import 'package:my_app/views/home/tab-page/provider-page.dart';
import 'package:my_app/views/home/tab-page/scrollbar-page.dart';

// * 主页的容器
class HomeContainer extends StatelessWidget {
  const HomeContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
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
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(35),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: TabBar(
                isScrollable: true, // 横向滚动
                tabs: [
                  Tab(
                    text: '推荐',
                  ),
                  Tab(
                    text: '路由',
                  ),
                  Tab(
                    text: '弹窗',
                  ),
                  Tab(
                    text: '自定义滚动条',
                  ),
                  Tab(
                    text: 'Provider',
                  ),
                  Tab(
                    text: '界面好看',
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.menu),
            )
          ],
        ),
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

class _HomeBodyState extends State<HomeBody> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        Recommend(),
        RouterUse(),
        ClickAdd(),
        ScrollbarPage(),
        ProviderPage(),
        Container(child: Text('bar2')),
      ],
    );
  }
}
