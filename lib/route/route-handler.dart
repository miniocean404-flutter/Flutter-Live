import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
// 隐藏滚动水波纹
import 'package:my_app/theme/WaterRipple.dart';
import 'package:my_app/views/albumShow.dart';
import 'package:my_app/views/builtInBrowser.dart';
import 'package:my_app/views/customVideo.dart';
import 'package:my_app/views/deviceInfo.dart';
import 'package:my_app/views/easyRefreshPage.dart';
import 'package:my_app/views/fileOperate.dart';
import 'package:my_app/views/home/bottomBarPage.dart';
import 'package:my_app/views/home/category.dart';
import 'package:my_app/views/home/home.dart';
import 'package:my_app/views/home/mine.dart';
import 'package:my_app/views/imagePick.dart';
import 'package:my_app/views/live_video_page.dart';
import 'package:my_app/views/router/NameRouter.dart';
import 'package:my_app/views/router/router.dart';
import 'package:my_app/views/search.dart';
import 'package:my_app/views/startPage.dart';

var startPageHandler =
    Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
  return StartPage();
});

var bottomBarPageHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return HideScrollWaterRipple(BottomBarPage());
  },
);

var homeContainerHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return HomeContainer();
  },
);

var categoryHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return Category();
  },
);

var mineHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return Mine();
  },
);

var imagePickHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return ImagePick();
  },
);

var nameRouterHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return NameRouter();
  },
);
var routerPageHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return RouterPage();
  },
);

var fileOperateHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return FileOperate();
  },
);
var deviceInfoHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return DeviceInfo();
  },
);

var albumShowHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return AlbumShow();
  },
);

var builtInBrowserHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return BuiltInBrowser();
  },
);

var easyRefreshHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return EasyRefreshPage();
  },
);

var customVideoHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return CustomVideo();
  },
);

var searchHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return Search();
  },
);

var liveVideoPageHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return LiveVideoPage();
  },
);
