import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

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

// * 随机获取指定范围内的数值
int getRandomRangeInt(int min, int max) {
  final Random random = new Random();
  return min + random.nextInt(max + 1 - min);
}

// * 权限申请
checkPermission(Function(bool) res) async {
  final status = await Permission.camera.status;
  if (status.isGranted) {
    res(true);
  } else {
    // 如果以前已授予它，则什么也不会发生，如果没有授权，则提示用户去授权
    final v = await Permission.storage.request();
    res(v.isGranted);
  }

  // if (status.isGranted) {
  //     //权限通过
  //   } else if (status.isDenied) {
  //     //权限拒绝， 需要区分IOS和Android，二者不一样
  //     requestPermission(permission);
  //   } else if (status.isPermanentlyDenied) {
  //     //权限永久拒绝，且不在提示，需要进入设置界面，IOS和Android不同
  //     openAppSettings();
  //   } else if (status.isRestricted) {
  //     //活动限制（例如，设置了家长///控件，仅在iOS以上受支持。
  //     openAppSettings();
  //   } else {
  //     //第一次申请
  //     requestPermission(permission);
  //   }
}
