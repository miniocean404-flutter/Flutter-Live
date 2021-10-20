import 'package:flutter/material.dart';
import './WaterRipple.dart';
import './color.dart';

// 全局主题配置
class ColorSchemeConfig {
  static ColorScheme colorScheme({mode = Brightness.light}) {
    return ColorScheme(
      brightness: mode,
      // 脚手架上面标题等主要颜色(包括文本按钮的颜色,旋转指示器)
      primary: AppColor.backgroundColor,
      // 黑暗主题的主色调
      primaryVariant: Colors.black,
      // 一种强调色，，有选定行时PaginatedDataTable标题的颜色（水波纹、浮动按钮）

      secondary: Colors.blue,
      secondaryVariant: AppColor.selectColor,

      //小部件的背景色 如:card appbar
      surface: Colors.transparent,
      //可滚动内容后面的颜色
      background: Colors.green,
      //用于输入验证错误的颜色，例如:InputDecoration.errorText
      error: Colors.red,

      //(按钮、AppBar) 在主色调上绘制清晰易读的字体颜色
      onPrimary: Colors.black,
      //在secondary上绘制清晰易读的颜色
      onSecondary: Colors.white,
      onSurface: AppColor.backgroundColor,
      onBackground: Colors.blue,
      onError: Colors.red,
    );
  }
}

ThemeData themeColor() {
  return ThemeData(
    // platform: TargetPlatform.iOS, //启动时候的平台模式，打包还是原来的模式
    // 用于去除水波纹
    // splashColor: Colors.transparent,
    // highlightColor: Colors.transparent,
    // splashFactory: const NoSplashFactory(),

    //用于materia应用程序或app内页面的背景色
    // scaffoldBackgroundColor: _backgroundColor,

    // * 全局主题
    colorScheme: ColorSchemeConfig.colorScheme(),

    // * 横向TabBar的主题
    tabBarTheme: TabBarTheme(
      // indicator:,
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: AppColor.selectColor,
      labelStyle: TextStyle(
        fontWeight: AppColor.fontWeight,
      ),
      unselectedLabelColor: AppColor.unselectColor,
      labelPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      unselectedLabelStyle: TextStyle(
        fontWeight: AppColor.fontWeight,
      ),
    ),

    // * 底部按钮主题
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor.backgroundColor,
      elevation: 0, //虚线阴影
      selectedItemColor: AppColor.selectColor,
      unselectedItemColor: AppColor.unselectColor,
      // selectedIconTheme:,
      // unselectedIconTheme:,
      // selectedLabelStyle:,
      // unselectedLabelStyle:,
      // showSelectedLabels:,
      // showUnselectedLabels:,
      // type:,
      // enableFeedback:,
      // landscapeLayout:,
    ),

    // * 文字按钮主题
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(TextStyle(color: Colors.red)),
        //未知
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        //背景颜色
        foregroundColor: MaterialStateProperty.all(Colors.blue),
        //设置按钮上字体与图标的颜色
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        //长按水波纹颜色
        //设置阴影  不适用于这里的TextButton
        elevation: MaterialStateProperty.all(0),
        //设置按钮内边距
        padding: MaterialStateProperty.all(EdgeInsets.all(2)),
        //设置按钮的大小
        // minimumSize: MaterialStateProperty.all(Size(200, 100)),
        //设置边框
        side: MaterialStateProperty.all(
          BorderSide(color: Colors.transparent, width: 0),
        ),
        //外边框装饰 会覆盖 side 配置的样式
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
    ),
    // * 进度指示器主题
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: Colors.blue,
    ),
  );
}

ThemeData darkTheme() {
  return ThemeData(
    // * 全局主题
    colorScheme: ColorSchemeConfig.colorScheme(mode: Brightness.dark),

    // * 横向TabBar的主题
    tabBarTheme: TabBarTheme(
      // indicator:,
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: AppColor.selectColor,
      labelStyle: TextStyle(
        fontWeight: AppColor.fontWeight,
      ),
      unselectedLabelColor: AppColor.unselectColor,
      labelPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      unselectedLabelStyle: TextStyle(
        fontWeight: AppColor.fontWeight,
      ),
    ),
    // * 底部按钮主题
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0, //虚线阴影
      selectedItemColor: AppColor.selectColor,
      unselectedItemColor: AppColor.unselectColor,
    ),
  );
}
