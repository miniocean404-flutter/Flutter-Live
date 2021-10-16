import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';
import './Video_UI.dart';
import 'Video_Share_Widget.dart';

enum VideoPlayerType { network, asset, file }

class VideoMain extends StatefulWidget {
  final url;
  final VideoPlayerType type;
  final double width;
  final double height;
  final String title;
  final bool isSafeArea;

  VideoMain.network({
    Key? key,
    required String url, // 当前需要播放的地址
    this.width: double.infinity, // 播放器尺寸（大于等于视频播放区域）
    this.height: double.infinity,
    this.isSafeArea: false,
    this.title = '', // 视频需要显示的标题
  })  : type = VideoPlayerType.network,
        url = url,
        super(key: key);

  VideoMain.asset({
    Key? key,
    required String dataSource, // 当前需要播放的地址
    this.width: double.infinity,
    this.height: double.infinity,
    this.isSafeArea: false,
    this.title = '', // 视频需要显示的标题
  })  : type = VideoPlayerType.asset,
        url = dataSource,
        super(key: key);

  VideoMain.file({
    Key? key,
    required File file, // 当前需要播放的文件
    this.width: double.infinity,
    this.height: double.infinity,
    this.isSafeArea: false,
    this.title = '', // 视频需要显示的标题
  })  : type = VideoPlayerType.file,
        url = file,
        super(key: key);

  @override
  _VideoUiMainState createState() => _VideoUiMainState();
}

class _VideoUiMainState extends State<VideoMain> {
  late VideoPlayerController _videoPlayController;

  bool get _isFullScreen =>
      widget.isSafeArea &&
      MediaQuery.of(context).orientation == Orientation.landscape;
  Size get _window => MediaQueryData.fromWindow(window).size;

  @override
  void initState() {
    urlChnage();

    Wakelock.enable();
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayController.dispose();
    Wakelock.disable();
    super.dispose();
  }

  urlChnage() {
    // 如果存在控制器就删除控制器
    if (widget.url == null || widget.url == '') return;
    // if (_videoPlayController != null) {
    // _videoPlayController.removeListener(_videoListener);
    // _videoPlayController.dispose();
    // }

    // 根据使用的构造函数类型创建video播放方式
    if (widget.type == VideoPlayerType.file) {
      _videoPlayController = VideoPlayerController.file(widget.url);
    } else if (widget.type == VideoPlayerType.asset) {
      _videoPlayController = VideoPlayerController.asset(widget.url);
    } else {
      _videoPlayController = VideoPlayerController.network(widget.url);
    }

    /// 加载资源完成时，监听播放进度，并且标记_videoInit=true加载完成
    _videoPlayController.addListener(_videoListener);

    print('是否播放${_videoPlayController.value.isPlaying}');

    // 初始化Video控制器
    _videoPlayController.initialize()
      ..then((value) => setState(() {
            // _videoInit = true;
            // _videoError = false;
            _videoPlayController.play();
          }));
  }

  void _videoListener() async {
    Duration? res = await _videoPlayController.position;
    if (res! >= _videoPlayController.value.duration) {
      await _videoPlayController.seekTo(Duration(seconds: 0));
      await _videoPlayController.pause();
    }
    // if (_videoPlayController.value.isPlaying && _key.currentState != null) {
    //   /// 减少build次数
    //   _key.currentState!.setPosition(
    //     position: res,
    //     totalDuration: _videoPlayController.value.duration,
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    if (_videoPlayController.value.isInitialized) {
      return VideoShareWidget(
        videoPlayController: _videoPlayController,
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: _videoPlayController.value.aspectRatio,
              child: VideoPlayer(_videoPlayController),
            ),
            VideoUi(),
          ],
        ),
      );

      // SafeArea(
      //   top: !_isFullScreen,
      //   bottom: !_isFullScreen,
      //   left: !_isFullScreen,
      //   right: !_isFullScreen,
      //   child: Container(
      //     width: _isFullScreen ? _window.width : widget.width,
      //     height: _isFullScreen ? _window.height : widget.height,
      //     child: Container(
      //       // color: Colors.black,
      //       child: ,
      //     ),
      //   ),
      // );
    } else if (_videoPlayController.value.hasError) {
      return Text(
        '加载出错',
        style: TextStyle(color: Colors.white),
      );
    } else if (widget.url == null) {
      return Center(
        child: Text(
          '暂无视频信息',
          style: TextStyle(color: Colors.white),
        ),
      );
    } else {
      return Container(
        child: Text(''),
      );
    }
  }
}
