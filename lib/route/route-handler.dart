import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
// 隐藏滚动水波纹
import 'package:my_app/config/water-ripple.dart';
import 'package:my_app/views/album-show.dart';
import 'package:my_app/views/home/tab-page/builtIn-browser.dart';
import 'package:my_app/views/mine/about.dart';
import 'package:my_app/views/mine/settings.dart';
import 'package:my_app/views/video/custom-video.dart';
import 'package:my_app/views/category/device-info.dart';
import 'package:my_app/views/category/easy-refresh-page.dart';
import 'package:my_app/views/category/file-operate.dart';
import 'package:my_app/views/home/bottom-bar-page.dart';
import 'package:my_app/views/category/category.dart';
import 'package:my_app/views/home/home.dart';
import 'package:my_app/views/mine/mine.dart';
import 'package:my_app/views/category/image-pick.dart';
import 'package:my_app/views/video/live_video_page.dart';
import 'package:my_app/views/router/name-router.dart';
import 'package:my_app/views/router/router.dart';
import 'package:my_app/views/search.dart';
import 'package:my_app/views/start-page.dart';

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
    return LiveVideoPage(
      platform: params['com'][0],
      roomId: params['roomId'][0],
    );
  },
);
var aboutHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return About();
  },
);

var settingsHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return Settings();
  },
);
