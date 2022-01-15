import 'package:flutter/material.dart';
import 'package:my_app/route/routers.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = new TabController(length: 2, vsync: this);
    tabController.addListener(() {
      print(tabController.index);

      //点击tab回调一次，滑动切换tab不会回调
      if (tabController.indexIsChanging) {
        print("ysl--${tabController.index}");
      }

      //点击tab时或滑动tab回调一次
      if (tabController.index.toDouble() == tabController.animation!.value) {
        print("ysl${tabController.index}");
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: TabBar(
          controller: tabController,
          isScrollable: true,
          indicatorColor: Colors.transparent,
          labelStyle: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
          tabs: [
            Tab(text: '案例'),
            Tab(text: '最新'),
          ],
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(84, 51, 255, 1),
                    Color.fromRGBO(32, 189, 255, 1),
                    Color.fromRGBO(165, 254, 203, 1),
                  ],
                  stops: [0.0, 0.5, 1.0],
                ),
              ),
              child: GridView(
                scrollDirection: Axis.vertical,
                reverse: false,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0.1,
                ),
                children: [
                  TextButton(
                    child: Text('选择图片'),
                    onPressed: () =>
                        {Routers.navigateTo(context, Routers.imagePick)},
                  ),
                  TextButton(
                    child: Text('文件操作'),
                    onPressed: () =>
                        {Routers.navigateTo(context, Routers.fileOperate)},
                  ),
                  TextButton(
                    child: Text('设备信息'),
                    onPressed: () =>
                        {Routers.navigateTo(context, Routers.deviceInfo)},
                  ),
                  TextButton(
                    child: Text('内嵌浏览器'),
                    onPressed: () =>
                        {Routers.navigateTo(context, Routers.builtInBrowser)},
                  ),
                  TextButton(
                    child: Text('下拉刷新'),
                    onPressed: () =>
                        {Routers.navigateTo(context, Routers.easyRefresh)},
                  ),
                ],
              ),
            ),
            Center(child: Text("页面B")),
          ],
        ),
      ),
    );
  }

  // AutomaticKeepAliveClientMixin 抽象类的实现
  @override
  bool get wantKeepAlive => true;
}
