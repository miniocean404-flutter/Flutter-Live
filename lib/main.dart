import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_app/route/routers.dart'; // 路由
import 'package:my_app/theme/StateBarAndVirtualKey.dart'; // 状态栏
import 'package:my_app/theme/theme.dart'; // 主题
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'local/AppLocalizationsDelegate.dart';

void main() {
  // 获取当前环境
  var env = String.fromEnvironment('APP_CHANNEL');
  print(env);

  barColor(color: 'white');
  GestureBinding.instance?.resamplingEnabled = true; // 启动高刷

  Routers.initRouter();

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(750, 1334),
      builder: () => MaterialApp(
        // 默认配置
        title: '抖音',
        debugShowCheckedModeBanner: false,
        theme: themeColor(), // 默认的主题
        darkTheme: darkTheme(), //黑暗模式的主题
        initialRoute: Routers.startPage,
        onGenerateRoute: Routers.router.generator,
        // 国际化支持的语言
        supportedLocales: [
          const Locale('zh'),
          const Locale('en'),
        ],
        localizationsDelegates: [
          AppLocalizationsDelegate(),
        ],
      ),
    );
  }
}
