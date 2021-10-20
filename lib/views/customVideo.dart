import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/components/common/video/Video_Main.dart';

// import 'package:my_app/components/common/video/video_player_UI.dart';
class CustomVideo extends StatefulWidget {
  CustomVideo({Key? key}) : super(key: key);

  @override
  _CustomVideoState createState() => _CustomVideoState();
}

class _CustomVideoState extends State<CustomVideo> {
  final videoString =
      'https://vd3.bdstatic.com/mda-mgkenk4wz2neyci5/hd/cae_h264_clips/1626863811102095828/mda-mgkenk4wz2neyci5.mp4?auth_key=1632297608-0-0-4916a294a8c74c60453df0766e205e51&bcevod_channel=searchbox_feed&pd=1&pt=3&abtest=';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VideoMain.network(url: videoString),
    );
  }
}
