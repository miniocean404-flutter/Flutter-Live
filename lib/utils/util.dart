import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

/// 转为 rpx 单位
/// [size] 设计稿上的大小
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

// * 随机获取指定范围内的数值
int getRandomRangeInt(int min, int max) {
  final Random random = new Random();
  return min + random.nextInt(max + 1 - min);
}
