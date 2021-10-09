import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert; // 转Json

// 隐藏滚动水波纹
import 'package:my_app/theme/WaterRipple.dart';
// 路由
import 'package:my_app/views/home/home.dart';
import 'package:my_app/views/category/category.dart';
import 'package:my_app/views/mine/mine.dart';
import 'package:my_app/views/StartPage/StartPage.dart';
import 'package:my_app/views/router/NameRouter.dart';
import 'package:my_app/views/videoPlay/videoPlay.dart';
import 'package:my_app/views/imagePick/ImagePick.dart';
import 'package:my_app/views/PullLoading/PullLoading.dart';
import 'package:my_app/views/router/router.dart';
import 'package:my_app/views/BottomBarPage/BottomBarPage.dart';
import 'package:my_app/views/FileOperate/FileOperate.dart';
import 'package:my_app/views/DeviceInfo/DeviceInfo.dart';

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
