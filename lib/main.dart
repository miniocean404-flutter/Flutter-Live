import 'package:flutter/material.dart';
import 'package:get/get.dart';
// 主题
import 'package:my_app/theme/theme.dart';
// 路由
import 'package:my_app/route/RouterConfig.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // 默认配置
      title: '抖音',
      debugShowCheckedModeBanner: false,
      theme: themeColor(), // 默认的主题
      darkTheme: darkTheme(), //黑暗模式的主题
      // GetX路由配置
      initialRoute: RouteConfig.Start_Page,
      getPages: RouteConfig.getPages,
      defaultTransition: Transition.cupertino, //过渡动画
    );
  }
}
