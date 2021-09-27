import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      child: ListView(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: TextButton(
                  child: Text('视频播放'),
                  onPressed: () => {Get.toNamed('/VideoPlay')},
                ),
              ),
              Expanded(
                flex: 1,
                child: TextButton(
                  child: Text('选择图片'),
                  onPressed: () => {Get.toNamed('/ImagePick')},
                ),
              ),

              // VideoApp()
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: TextButton(
                  child: Text('自定义下拉加载更多'),
                  onPressed: () => {Get.toNamed('/PullLoading')},
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
