import 'package:flutter/material.dart';
// 主题
import 'package:my_app/theme/theme.dart';
// 路由
import 'package:my_app/route/routers.dart';
// 状态栏
import 'package:my_app/theme/StateBarAndVirtualKey.dart';

void main() {
  barColor(color: 'white');
  Routers.initRouter();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 默认配置
      title: '抖音',
      debugShowCheckedModeBanner: false,
      theme: themeColor(), // 默认的主题
      darkTheme: darkTheme(), //黑暗模式的主题
      initialRoute: Routers.Start_Page,
      onGenerateRoute: Routers.router.generator,
    );
  }
}
