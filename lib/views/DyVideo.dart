import 'package:flutter/material.dart';
import 'package:my_app/route/routers.dart';

class DyVideo extends StatelessWidget {
  const DyVideo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: TextButton(
              child: Text('视频播放'),
              onPressed: () =>
                  {Routers.navigateTo(context, Routers.Video_Play)},
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              child: Text('视频自定义播放器'),
              onPressed: () =>
                  {Routers.navigateTo(context, Routers.Custom_Video)},
            ),
          ),
        ],
      ),
    );
  }
}
