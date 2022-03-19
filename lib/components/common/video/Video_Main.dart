import 'dart:io';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';
import './Video_UI.dart';
import './Video_Share_Widget.dart';

enum VideoPlayerType { network, asset, file }

class VideoMain extends StatefulWidget {
  final url;
  final VideoPlayerType type;
  final String title;
  final bool isSafeArea;

  VideoMain.network({
    Key? key,
    required String url, // 当前需要播放的地址
    this.isSafeArea: false,
    this.title = '', // 视频需要显示的标题
  })  : type = VideoPlayerType.network,
        url = url,
        super(key: key);

  VideoMain.asset({
    Key? key,
    required String dataSource, // 当前需要播放的地址
    this.isSafeArea: false,
    this.title = '', // 视频需要显示的标题
  })  : type = VideoPlayerType.asset,
        url = dataSource,
        super(key: key);

  VideoMain.file({
    Key? key,
    required File file, // 当前需要播放的文件
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
  late double containerWidth;
  late double containerHeight;
  late bool _isFullScreen;
  // 可调用子widget数据
  // final GlobalKey<VideoUiState> videoUiKey = GlobalKey<VideoUiState>();
  // Size get _window => MediaQueryData.fromWindow(window).size;

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

    // 根据使用的构造函数类型创建video播放方式
    if (widget.type == VideoPlayerType.file) {
      _videoPlayController = VideoPlayerController.file(widget.url);
    } else if (widget.type == VideoPlayerType.asset) {
      _videoPlayController = VideoPlayerController.asset(widget.url);
    } else {
      _videoPlayController = VideoPlayerController.network(widget.url);
    }

    // 加载资源完成时，监听播放进度，并且标记_videoInit=true加载完成
    // _videoPlayController.addListener(_videoListener);

    // 初始化Video控制器
    _videoPlayController.initialize()
      ..then((value) => setState(() {
            _videoPlayController.play();
          }));
  }

  // void _videoListener() async {
  // var res = await _videoPlayController.position;
  // if (res! >= _videoPlayController.value.duration) {
  //   _videoPlayController
  //       .seekTo(Duration(seconds: 0))
  //       .then((value) => _videoPlayController.pause());
  // }

  // if (_videoPlayController.value.isPlaying &&
  //     videoUiKey.currentState != null) {
  //   // 减少build次数
  //   videoUiKey.currentState!.setPosition(
  //     position: res,
  //   );
  // }
  // }

  @override
  Widget build(BuildContext context) {
    if (_videoPlayController.value.isInitialized) {
      print('VideoMain渲染');
      final size = MediaQuery.of(context).size;
      _isFullScreen =
          MediaQuery.of(context).orientation == Orientation.landscape;
      if (!_isFullScreen) {
        containerWidth = size.width;
        containerHeight =
            containerWidth / _videoPlayController.value.aspectRatio;
      } else {
        containerWidth = size.width;
        containerHeight = size.height;
      }

      return VideoShareWidget(
        videoPlayController: _videoPlayController,
        isFullscreen: _isFullScreen,
        size: size,
        child: Stack(
          children: [
            // 背景
            Container(
              width: containerWidth,
              height: containerHeight,
              decoration: BoxDecoration(color: Colors.black),
              alignment: Alignment.topCenter,
            ),
            // 视频
            Container(
              alignment: Alignment.topCenter,
              child: AspectRatio(
                aspectRatio: _videoPlayController.value.aspectRatio,
                child: VideoPlayer(_videoPlayController),
              ),
            ),
            // 控制UI
            VideoUi(),
          ],
        ),
      );
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
