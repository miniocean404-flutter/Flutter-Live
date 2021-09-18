import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData themeColor() {
  final _selectColor = Colors.blue;
  final _unselectColor = Colors.grey;
  final _backgroundColor = Colors.white;
  final _fontWeight = FontWeight.w600;

  return ThemeData(
    // * 全局主题
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: _backgroundColor, // 脚手架上面标题等主要颜色(包括文本按钮的颜色)
      primaryVariant: Colors.green, // 主色调的较暗版本
      secondary: Colors.transparent, // 一种强调色，，有选定行时PaginatedDataTable标题的颜色（水波纹）
      secondaryVariant: _selectColor, //
      surface: Colors.green, //小部件的背景色 如:card
      background: Colors.green, //可滚动内容后面的颜色
      error: Colors.red, //用于输入验证错误的颜色，例如:InputDecoration.errorText

      onPrimary: Colors.black, //  (按钮、AppBar) 在主色调上绘制清晰易读的字体颜色
      onSecondary: Colors.red, //在secondary上绘制清晰易读的颜色
      onSurface: _backgroundColor,
      onBackground: Colors.blue,
      onError: Colors.red,
    ),

    // * 横向TabBar的主题
    tabBarTheme: TabBarTheme(
      // indicator:,
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: _selectColor,
      labelStyle: TextStyle(
        fontWeight: _fontWeight,
      ),
      unselectedLabelColor: _unselectColor,
      labelPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      unselectedLabelStyle: TextStyle(
        fontWeight: _fontWeight,
      ),
    ),
    // * 底部按钮主题
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: _backgroundColor,
      elevation: 0, //虚线阴影
      selectedItemColor: _selectColor,
      unselectedItemColor: _unselectColor,
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
        textStyle: MaterialStateProperty.all(TextStyle(color: Colors.red)), //未知
        backgroundColor: MaterialStateProperty.all(Colors.transparent), //背景颜色
        foregroundColor: MaterialStateProperty.all(Colors.blue), //设置按钮上字体与图标的颜色
        overlayColor: MaterialStateProperty.all(Colors.transparent), //长按水波纹颜色
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
  );
}

void barColor({required String color}) {
  if (Platform.isAndroid) {}
  if (Platform.isIOS) {}

  // 白色沉浸式状态栏颜色  白色文字
  SystemUiOverlayStyle light = SystemUiOverlayStyle(
    // * 虚拟按键
    systemNavigationBarColor: Color(0xFFFFFFFF), //背景色
    systemNavigationBarDividerColor: null, //分割颜色
    systemNavigationBarIconBrightness: Brightness.dark, //图标色
    systemNavigationBarContrastEnforced: false,

    // 注意安卓要想实现沉浸式的状态栏 需要底部设置透明色
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
  );

  // 黑色沉浸式状态栏颜色 黑色文字
  SystemUiOverlayStyle dark = SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xFF000000),
    systemNavigationBarDividerColor: null,
    systemNavigationBarIconBrightness: Brightness.light,

    /// 注意安卓要想实现沉浸式的状态栏 需要底部设置透明色
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  );

  // 这个地方你可以去掉三目运算符 直接调用你想要的 效果即可
  "white" == color.trim()
      ? SystemChrome.setSystemUIOverlayStyle(light)
      : SystemChrome.setSystemUIOverlayStyle(dark);
}
