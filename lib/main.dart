import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// 路由
import 'package:my_app/route/routers.dart';
// 状态栏
import 'package:my_app/theme/StateBarAndVirtualKey.dart';
// 主题
import 'package:my_app/theme/theme.dart';

void main() {
  var env = String.fromEnvironment('APP_CHANNEL'); //
  Routers.initRouter();
  barColor(color: 'white');
  GestureBinding.instance?.resamplingEnabled = true; // 启动高刷
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
      initialRoute: Routers.startPage,
      onGenerateRoute: Routers.router.generator,
    );
  }
}
