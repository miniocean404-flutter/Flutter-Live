import 'package:flutter/material.dart';
// theme
import 'package:my_app/theme/StateBarAndVirtualKey.dart';
// bottombar
import 'package:my_app/views/home/home.dart';
import 'package:my_app/views/category/category.dart';
import 'package:my_app/views/mine/mine.dart';
import 'package:my_app/views/DyVideo/DyVideo.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  _BottomBarPageState createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  @override
  void initState() {
    super.initState();
    barColor(color: 'white');
  }

  int _currentIndex = 0;
  List bottomBarList = [
    HomeCotainer(),
    DyVideo(),
    Category(),
    Mine(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
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
      body: this.bottomBarList[this._currentIndex],
    );
  }
}
