import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;
  final videoString =
      'https://vd3.bdstatic.com/mda-mgkenk4wz2neyci5/hd/cae_h264_clips/1626863811102095828/mda-mgkenk4wz2neyci5.mp4?auth_key=1632297608-0-0-4916a294a8c74c60453df0766e205e51&bcevod_channel=searchbox_feed&pd=1&pt=3&abtest=';

  @override
  void initState() {
    _controller = VideoPlayerController.network(
      videoString,
    )..initialize().then((_) {
        // 确保在视频初始化后显示第一帧，甚至在按下播放按钮之前
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget? showVideo() {
    if (_controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: VideoPlayer(_controller),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter 官方播放器Demo'),
      ),
      body: showVideo(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
        // splashColor: Colors.blue,
      ),
    );
  }
}
