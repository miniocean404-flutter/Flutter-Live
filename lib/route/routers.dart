import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:my_app/route/route-handler.dart';
import 'package:my_app/utils/logger.dart';

//省略 import
class Routers {
  static FluroRouter router = FluroRouter();

  static const String startPage = "/";
  static const String bottomBarPage = "/bottomBarPage";

  static const String home = "/home";

  static const String category = "/category";
  static const String mine = "/mine";

  static const String imagePick = "/imagePick";
  static const String fileOperate = "/fileOperate";
  // 路由界面
  static const String nameRouter = "/nameRouter";
  static const String routerPage = "/routerPage";
  static const String deviceInfo = "/deviceInfo";
  static const String albumShow = "/albumShow";
  static const String builtInBrowser = "/builtInBrowser";
  static const String easyRefresh = "/easyRefresh";
  static const String customVideo = "/customVideo";

  // 公共功能页
  static const String search = "/search";
  static const String liveVideoPage = "/liveVideoPage";

  static void defineRoutes() {
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
        logW('没有匹配的路由!');
        return;
      },
    );

    router.define(startPage, handler: startPageHandler);
    router.define(bottomBarPage, handler: bottomBarPageHandler);
    router.define(home, handler: homeContainerHandler);
    router.define(category, handler: categoryHandler);
    router.define(mine, handler: mineHandler);
    router.define(imagePick, handler: imagePickHandler);
    router.define(nameRouter, handler: nameRouterHandler);
    router.define(fileOperate, handler: fileOperateHandler);
    router.define(deviceInfo, handler: deviceInfoHandler);
    router.define(albumShow, handler: albumShowHandler);
    router.define(builtInBrowser, handler: builtInBrowserHandler);
    router.define(easyRefresh, handler: easyRefreshHandler);
    router.define(customVideo, handler: customVideoHandler);
    router.define(search, handler: searchHandler);
    router.define(liveVideoPage, handler: liveVideoPageHandler);
  }

  // 对参数进行encode，解决参数中有特殊字符，影响fluro路由匹配
  static Future navigateTo(
    BuildContext context,
    String path, {
    Map<String, dynamic>? params,
    bool clearStack = false,
    bool replace = false,
    TransitionType transition = TransitionType.cupertino,
  }) {
    String paramsString = "";
    if (params != null) {
      int index = 0;

      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key].toString());
        index == 0 ? paramsString = "?" : paramsString = paramsString + "\&";
        paramsString += "$key=$value";
        index++;
      }
    }
    path = path + paramsString;

    return router.navigateTo(
      context,
      path,
      clearStack: clearStack,
      replace: replace,
      transition: transition,
    );
  }
}
