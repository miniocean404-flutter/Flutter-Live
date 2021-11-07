import 'package:flutter/material.dart';
import 'package:my_app/config/theme.dart'; // 主题
import 'package:my_app/provider/theme.dart';
import 'package:my_app/route/routers.dart'; // 路由
import 'package:provider/provider.dart';
import 'config/global.dart';

// import 'local/app-localizations-delegate.dart';

void main() async {
  await Global.init();

  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ThemeInfo()),
      ],
      // 消费者
      child: Consumer<ThemeInfo>(
        builder: (ctx, themeInfo, child) {
          Global.changeTheme();
          return MyApp();
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'H直播',
      debugShowCheckedModeBanner: false,
      theme: themeColor(), // 默认的主题
      darkTheme: darkTheme(), //黑暗模式的主题
      initialRoute: Routers.startPage,
      onGenerateRoute: Routers.router.generator,
      // // 国际化支持的语言
      // supportedLocales: [
      //   const Locale('zh'),
      //   const Locale('en'),
      // ],
      // localizationsDelegates: [
      //   AppLocalizationsDelegate(),
      // ],
    );
  }
}
