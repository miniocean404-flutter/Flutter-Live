import 'package:flutter/material.dart';

class DeviceInfo extends StatelessWidget {
  const DeviceInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //屏幕大小
    Size mSize = MediaQuery.of(context).size;
    //密度
    double mRatio = MediaQuery.of(context).devicePixelRatio;
    //设备像素
    double width = mSize.width * mRatio;
    double height = mSize.height * mRatio;

    // 我们通常取上边刘海高度和下边导航高度  上下边距 （主要用于 刘海  和  内置导航键）
    EdgeInsets padding = MediaQuery.of(context).padding;
    double topPadding = MediaQuery.of(context).padding.top;
    double bottomPadding = MediaQuery.of(context).padding.bottom;

    // 每个逻辑像素的字体像素数
    double textScaleFactor = MediaQuery.of(context).textScaleFactor;

    // 主机平台当前亮度模式
    Brightness platformBrightness = MediaQuery.of(context).platformBrightness;

    // 完全被系统UI(通常是设备的键盘)遮挡的显示部分
    EdgeInsets viewInsets = MediaQuery.of(context).viewInsets;

    // 格式化时间时是否使用24小时格式
    bool alwaysUse24HourFormat = MediaQuery.of(context).alwaysUse24HourFormat;

    // 用户是否使用TalkBack或VoiceOver等辅助功能服务与应用程序进行交互
    bool accessibleNavigation = MediaQuery.of(context).accessibleNavigation;

    // 设备是否反转平台的颜色
    bool invertColors = MediaQuery.of(context).invertColors;

    // 平台是否要求尽可能禁用或减少动画
    bool disableAnimations = MediaQuery.of(context).disableAnimations;

    // 平台是否请求使用粗体字体重绘制文本
    bool boldText = MediaQuery.of(context).boldText;

    return Scaffold(
      appBar: AppBar(
        title: Text('设备信息'),
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: Text('宽：$width,高 $height'),
            ),
            Center(
              child: Text('上边刘海高度：$topPadding,下边导航高度：$bottomPadding'),
            ),
            Center(
              child: Text('字体逻辑像素：$textScaleFactor'),
            ),
            Center(
              child: Text('主机平台亮度模式：$platformBrightness'),
            ),
            Center(
              child: Text('完全被系统UI(通常是设备的键盘)遮挡的显示部分：$viewInsets'),
            ),
            Center(
              child: Text('是否使用24小时格式：$alwaysUse24HourFormat'),
            ),
            Center(
              child: Text(
                  '用户是否使用TalkBack或VoiceOver等辅助功能服务与应用程序进行交互：$accessibleNavigation'),
            ),
            Center(
              child: Text('颜色是否反转：$invertColors'),
            ),
            Center(
              child: Text('平台是否请求使用粗体字体重绘制文本：$boldText'),
            ),
            Center(
              child: Text('平台是否要求尽可能禁用或减少动画：$disableAnimations'),
            ),
          ],
        ),
      ),
    );
  }
}
