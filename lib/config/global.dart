import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:my_app/config/state-bar-and-virtual-key.dart';
import 'package:my_app/config/theme-color.dart';
import 'package:my_app/provider/key.dart';
import 'package:my_app/route/routers.dart';
import 'package:my_app/utils/sp-helper.dart';

import 'color.dart';

class Global {
  static Future init() async {
    // 获取当前环境、identical 检查是否是同一个对象
    var env = String.fromEnvironment('APP_CHANNEL');
    barColor(color: 'white');

    GestureBinding.instance?.resamplingEnabled = true; // 当输入和显示频率不同导致的性能下降处理
    Routers.defineRoutes();

    // 1. WidgetsFlutterBinding
    // WidgetsFlutterBinding混入了不少的其他的Binding
    //
    // BindingBase 那些单一服务的混入类的基类
    // GestureBinding framework手势子系统的绑定，处理用户输入事件
    // ServicesBinding 接受平台的消息将他们转换成二进制消息，用于平台与flutter的通信
    // SchedulerBinding 调度系统，用于调用Transient callbacks（Window.onBeginFrame的回调）、Persistent callbacks（Window.onDrawFrame的回调）、Post-frame callbacks（在Frame结束时只会被调用一次，调用后会被系统移除，在Persistent callbacks后Window.onDrawFrame回调返回之前执行）
    // PaintingBinding 绘制库的绑定，主要处理图片缓存
    // SemanticsBinding 语义化层与Flutter engine的桥梁，主要是辅助功能的底层支持
    // RendererBinding 渲染树与Flutter engine的桥梁
    // WidgetsBinding Widget层与Flutter engine的桥梁
    WidgetsFlutterBinding.ensureInitialized();

    await SpHelper.initPrefs();
  }

  static void changeTheme() {
    String currentColor = SpHelper.getLocalStorage<String>(keyThemeColor);
    Color color = themeColorMap[currentColor]!;
    AppColor.primary = color;
  }
}
