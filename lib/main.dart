import 'package:flutter/material.dart';
import 'package:my_app/theme/WaterRipple.dart';

import 'package:my_app/theme/theme.dart';
import 'package:my_app/theme/StateBarAndVirtualKey.dart';

import 'package:my_app/route/index.dart';
import 'package:my_app/views/home/home.dart';
import 'package:my_app/views/category/category.dart';
import 'package:my_app/views/mine/mine.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '抖音',
      debugShowCheckedModeBanner: false,
      routes: routes,
      onGenerateRoute: onGenerateRoute,
      theme: themeColor(), // 默认的主题
      darkTheme: darkTheme(), //黑暗模式的主题
      home: HideScrollWaterRipple(
        BottomBarPage(),
      ),
    );
  }
}

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
    Category(),
    Mine(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
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
