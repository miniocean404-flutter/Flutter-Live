import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://vd3.bdstatic.com/mda-mgkenk4wz2neyci5/hd/cae_h264_clips/1626863811102095828/mda-mgkenk4wz2neyci5.mp4?auth_key=1632297608-0-0-4916a294a8c74c60453df0766e205e51&bcevod_channel=searchbox_feed&pd=1&pt=3&abtest=',
    )..initialize().then((_) {
        // 确保在视频初始化后显示第一帧，甚至在按下播放按钮之前
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('视频播放'),
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Container(),
      ),
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