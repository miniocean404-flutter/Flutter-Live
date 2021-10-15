import 'package:flutter/material.dart';
import 'package:my_app/components/common/video/video_player_UI.dart';

class CustomVideo extends StatelessWidget {
  static final String routerName = '/VideoPage';

//  Size get _window => MediaQueryData.fromWindow(window).size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        // 该组件宽高默认填充父控件，你也可以自己设置宽高
        child: VideoPlayerUI.network(
          url:
              'https://vd3.bdstatic.com/mda-mgkenk4wz2neyci5/hd/cae_h264_clips/1626863811102095828/mda-mgkenk4wz2neyci5.mp4?auth_key=1632297608-0-0-4916a294a8c74c60453df0766e205e51&bcevod_channel=searchbox_feed&pd=1&pt=3&abtest=',
          title: '示例视频',
        ),
      ),
    );
  }
}
