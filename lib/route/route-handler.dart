import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
// 隐藏滚动水波纹
import 'package:my_app/theme/WaterRipple.dart';
import 'package:my_app/views/AlbumShow.dart';
import 'package:my_app/views/BottomBarPage.dart';
import 'package:my_app/views/BuiltInBrowser.dart';
import 'package:my_app/views/CustomVideo.dart';
import 'package:my_app/views/DeviceInfo.dart';
import 'package:my_app/views/EasyRefreshPage.dart';
import 'package:my_app/views/FileOperate.dart';
import 'package:my_app/views/ImagePick.dart';
import 'package:my_app/views/PullLoading.dart';
import 'package:my_app/views/StartPage.dart';
import 'package:my_app/views/category.dart';
import 'package:my_app/views/home/home.dart';
import 'package:my_app/views/mine.dart';
import 'package:my_app/views/router/NameRouter.dart';
import 'package:my_app/views/router/router.dart';
import 'package:my_app/views/videoPlay.dart';

var startPageHandler =
    Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
  return StartPage();
});

var bottomBarPageHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return HideScrollWaterRipple(BottomBarPage());
  },
);

var homeCotainerHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return HomeCotainer();
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

var videoAppHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return VideoApp();
  },
);

var imagePickHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return ImagePick();
  },
);

var pullLoadingHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return PullLoading();
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
