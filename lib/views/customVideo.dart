import 'package:flutter/material.dart';
// import 'package:my_app/components/common/video/video_player_UI.dart';

class CustomVideo extends StatelessWidget {
  static final String routerName = '/VideoPage';

//  Size get _window => MediaQueryData.fromWindow(window).size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        // 该组件宽高默认填充父控件，你也可以自己设置宽高
        child: Text('视频'),
      ),
    );
  }
}
