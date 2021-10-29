import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/config/state-bar-and-virtual-key.dart'; // 状态栏
import 'package:my_app/config/theme.dart'; // 主题
import 'package:my_app/provider/theme.dart';
import 'package:my_app/route/routers.dart'; // 路由
import 'package:provider/provider.dart';

// import 'local/app-localizations-delegate.dart';

void main() {
  // 获取当前环境
  var env = String.fromEnvironment('APP_CHANNEL');
  print('当前类型${env.runtimeType.toString()}');

  barColor(color: 'white');
  GestureBinding.instance?.resamplingEnabled = true; // 当输入和显示频率不同导致的性能下降处理
  Routers.defineRoutes();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      designSize: Size(1080, 2356),
      orientation: Orientation.portrait,
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ThemeInfo()),
      ],
      // 消费者
      child: Consumer<ThemeInfo>(
        builder: (ctx, themeInfo, child) {
          return MaterialApp(
            title: 'H直播',
            debugShowCheckedModeBanner: false,
            theme: themeColor(), // 默认的主题
            darkTheme: darkTheme(), //黑暗模式的主题
            initialRoute: Routers.startPage,
            onGenerateRoute: Routers.router.generator,
            // 国际化支持的语言
            // supportedLocales: [
            //   const Locale('zh'),
            //   const Locale('en'),
            // ],
            // localizationsDelegates: [
            //   AppLocalizationsDelegate(),
            // ],
          );
        },
      ),
    );
  }
}
