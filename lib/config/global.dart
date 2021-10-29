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

    WidgetsFlutterBinding.ensureInitialized();
    await SpHelper.initPrefs();
  }

  static void changeTheme() {
    String currentColor = SpHelper.getLocalStorage(keyThemeColor);
    Color color = themeColorMap[currentColor]!;
    AppColor.primary = color;
  }
}
