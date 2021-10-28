import 'package:flutter/material.dart';
import 'package:my_app/views/dy-video.dart';
import 'package:my_app/views/home/category.dart';
// bottomBar
import 'package:my_app/views/home/home.dart';
import 'package:my_app/views/home/mine.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  _BottomBarPageState createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  @override
  void initState() {
    super.initState();
  }

  int _currentIndex = 0;
  List<Widget> bottomBarList = [
    HomeContainer(),
    DyVideo(),
    Category(),
    Mine(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            elevation: 30,
            type: BottomNavigationBarType.fixed, // 导航条过长是否进行隐藏
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '首页',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.video_call_rounded),
                label: '视频',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: '分类',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '我',
              )
            ],
            onTap: (int index) {
              setState(() {
                this._currentIndex = index;
              });
            },
            currentIndex: _currentIndex,
          ),
          body: IndexedStack(
            index: this._currentIndex,
            children: bottomBarList,
          ),
        ),
        onWillPop: () async {
          return true;
        });
  }
}
