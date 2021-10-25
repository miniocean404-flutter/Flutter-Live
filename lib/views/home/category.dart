import 'package:flutter/material.dart';
import 'package:my_app/route/routers.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(84, 51, 255, 1),
            Color.fromRGBO(32, 189, 255, 1),
            Color.fromRGBO(165, 254, 203, 1),
          ],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      child: GridView(
        scrollDirection: Axis.vertical,
        reverse: false,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 0.1,
        ),
        children: [
          TextButton(
            child: Text('选择图片'),
            onPressed: () => {Routers.navigateTo(context, Routers.imagePick)},
          ),
          TextButton(
            child: Text('文件操作'),
            onPressed: () => {Routers.navigateTo(context, Routers.fileOperate)},
          ),
          TextButton(
            child: Text('设备信息'),
            onPressed: () => {Routers.navigateTo(context, Routers.deviceInfo)},
          ),
          TextButton(
            child: Text('内嵌浏览器'),
            onPressed: () =>
                {Routers.navigateTo(context, Routers.builtInBrowser)},
          ),
          TextButton(
            child: Text('下拉刷新'),
            onPressed: () => {Routers.navigateTo(context, Routers.easyRefresh)},
          ),
        ],
      ),
    );
  }
}
