import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:my_app/route/route-handler.dart';

//省略 import
class Routers {
  static late FluroRouter router;
  static bool routerDefined = false;

  static void initRouter() {
    if (!routerDefined) {
      router = FluroRouter();
      defineRoutes();
      routerDefined = true;
    }
  }

  static const String Start_Page = "/";
  static const String Bottom_Bar_Page = "/BottomBarPage";

  static const String home = "/home";
  static const String category = "/category";
  static const String mine = "/mine";

  static const String Video_Play = "/VideoPlay";
  static const String Image_Pick = "/ImagePick";
  static const String Pull_Loading = "/PullLoading";
  static const String File_Operate = "/FileOperate";
  // 路由界面
  static const String Name_Router = "/NameRouter";
  static const String Router_Page = "/RouterPage";
  static const String Device_Info = "/DeviceInfo";
  static const String Album_Show = "/AlbumShow";
  static const String Built_In_Browser = "/BuiltInBrowser";
  static const String Easyre_Fresh = "/EasyreFresh";

  static void defineRoutes() {
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
        print('route not found!');
        return;
      },
    );

    router.define(Start_Page, handler: startPageHandler);
    router.define(Bottom_Bar_Page, handler: bottomBarPageHandler);
    router.define(home, handler: homeCotainerHandler);
    router.define(category, handler: categoryHandler);
    router.define(mine, handler: mineHandler);
    router.define(Video_Play, handler: videoAppHandler);
    router.define(Image_Pick, handler: imagePickHandler);
    router.define(Pull_Loading, handler: pullLoadingHandler);
    router.define(Name_Router, handler: nameRouterHandler);
    router.define(Router_Page, handler: routerPageHandler);
    router.define(File_Operate, handler: fileOperateHandler);
    router.define(Device_Info, handler: deviceInfoHandler);
    router.define(Album_Show, handler: albumShowHandler);
    router.define(Built_In_Browser, handler: builtInBrowserHandler);
    router.define(Easyre_Fresh, handler: easyreFreshHandler);
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
    String query = "";
    if (params != null) {
      int index = 0;
      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key]);

        if (index == 0) {
          query = "?";
        } else {
          query = query + "\&";
        }

        query += "$key=$value";
        index++;
      }
    }

    print('我是navigateTo传递的参数：$query');
    path = path + query;
    return router.navigateTo(
      context,
      path,
      clearStack: clearStack,
      replace: replace,
      transition: transition,
    );
  }
}
