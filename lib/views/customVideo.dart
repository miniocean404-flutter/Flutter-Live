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

  final string =
      'http://tx.hls.huya.com/src/78941969-2592787562-11135937784265572352-2914030356-10057-A-0-1-imgplus.m3u8?ratio=2000&wsSecret=af87e769a383fb8745f8bd9d55bacb47&wsTime=6173e1ce&fm=RFdxOEJjSjNoNkRKdDZUWV8kMF8kMV8kMl8kMw%3D%3D&ctype=tars_mobile&txyp=o%3Ad2%3B&fs=bgct&t=103';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VideoMain.network(url: string),
    );
  }
}
