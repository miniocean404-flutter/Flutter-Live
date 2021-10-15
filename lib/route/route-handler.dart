import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
// 隐藏滚动水波纹
import 'package:my_app/theme/WaterRipple.dart';
import 'package:my_app/views/AlbumShow.dart';
import 'package:my_app/views/BottomBarPage.dart';
import 'package:my_app/views/BuiltInBrowser.dart';
import 'package:my_app/views/CustomVideo.dart';
import 'package:my_app/views/DeviceInfo.dart';
import 'package:my_app/views/EasyRefresh.dart';
import 'package:my_app/views/FileOperate.dart';
import 'package:my_app/views/ImagePick.dart';
import 'package:my_app/views/PullLoading.dart';
import 'package:my_app/views/StartPage.dart';
import 'package:my_app/views/category.dart';
// 路由
import 'package:my_app/views/home/home.dart';
import 'package:my_app/views/mine.dart';
import 'package:my_app/views/router/NameRouter.dart';
import 'package:my_app/views/router/router.dart';
import 'package:my_app/views/videoPlay.dart';

var SartPageHandler =
    Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
  return StartPage();
});

var BottomBarPageHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return HideScrollWaterRipple(BottomBarPage());
  },
);

var HomeCotainerHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return HomeCotainer();
  },
);

var CategoryHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return Category();
  },
);

var MineHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return Mine();
  },
);

var VideoAppHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return VideoApp();
  },
);

var ImagePickHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return ImagePick();
  },
);
var PullLoadingHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return PullLoading();
  },
);
var NameRouterHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return NameRouter();
  },
);
var RouterPageHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return RouterPage();
  },
);

var FileOperateHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return FileOperate();
  },
);
var DeviceInfoHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return DeviceInfo();
  },
);

var AlbumShowHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return AlbumShow();
  },
);

var BuiltInBrowserHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return BuiltInBrowser();
  },
);

var EasyreFreshHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return EasyreFresh();
  },
);

var CustomVideoHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return CustomVideo();
  },
);
