import 'dart:math';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

/// 转为 rpx 单位
///
/// [size] 设计稿上的大小
///
/// [width] 设计稿尺寸
double toRpx({
  double size = 0,
  double width = 750,
  required BuildContext context,
}) {
  //屏幕大小
  Size mSize = MediaQuery.of(context).size;
  //密度
  double mRatio = MediaQuery.of(context).devicePixelRatio;
  //设备像素
  double deviceWidth = mSize.width * mRatio;
  // double deviceHeight = mSize.height * mRatio;

  double rpx = deviceWidth / width;
  return size * rpx;
}

// 数字简化为k/w格式
String formatCharCount(int count) {
  if (count < 0 || count.isNaN) {
    return '0';
  }
  String strCount = count.toString();
  if (strCount.length >= 5) {
    // 如：123456 => 12
    String prefix = strCount.substring(0, strCount.length - 4);
    if (strCount.length == 5) {
      prefix += '.' + strCount[1];
    }
    if (strCount.length == 6) {
      prefix += '.' + strCount[2];
    }
    return prefix + 'w';
  }
  return strCount;
}

// * 秒数转时:分:秒格式
String secondsToTime(int seconds) {
  if (seconds <= 0 || seconds.isNaN) {
    return '00:00';
  }
  // 时分数
  int hours = 0;
  // 分钟数
  int minutes = 0;
  // 除整数分钟外剩余的秒数
  int remainingSeconds = 0;

  hours = (seconds / 60 / 60).floor();
  minutes = (seconds / 60 % 60).floor();
  remainingSeconds = seconds % 60;

  return '${formatNumber(hours)}:${formatNumber(minutes)}:${formatNumber(remainingSeconds)}';
}

// * 个数补零
String formatNumber(int count) {
  String strCount = count.toString();
  return strCount.length > 1 ? strCount : '0$strCount';
}

// * 随机获取指定范围内的数值

/// 随机获取指定返回内的数值
/// from [min] 含，to [max] 含
int getRandomRangeInt(int min, int max) {
  final Random random = new Random();
  return min + random.nextInt(max + 1 - min);
}
