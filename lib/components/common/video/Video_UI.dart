import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import './Video_Control.dart';
import './Video_Share_Widget.dart';
import './Silder_UI.dart';

class VideoUi extends StatefulWidget {
  VideoUi({Key? key}) : super(key: key);

  @override
  VideoUiState createState() => VideoUiState();
}

class VideoUiState extends State<VideoUi> with VideoControl {
  late VideoShareWidget? share;
  late VideoPlayerController _videoPlayController;

  // 滚动时间
  late Timer _timer;
  late String videoTotalTime;
  late String videoCurrentTime;

  // 滑动条
  double _videoSchedule = 0;
  double thumbRadius = 6;
  double overlayRadius = 12;

  @override
  void initState() {
    currentPlayPotion();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用，如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("共享数据更新");
  }

  currentPlayPotion() {
    _timer = Timer.periodic(Duration(milliseconds: 1000), (value) {
      setState(() {});
    });
  }

  void isPlayOrPause() {
    if (_videoPlayController.value.isPlaying) {
      _videoPlayController.pause();
      setState(() {
        _timer.cancel();
      });
    } else {
      _videoPlayController.play();
      currentPlayPotion();
    }
  }

  void isFullscreen() {
    // 横着
    if (share!.isFullscreen == false) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft, // 向左旋转
      ]);

      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky); //隐藏
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge); //恢复
    }
  }

  @override
  Widget build(BuildContext context) {
    print('VideoUI渲染');
    // 共享数据
    share = VideoShareWidget.of(context);
    _videoPlayController = share!.videoPlayController;

    // 视频时间
    videoTotalTime =
        _videoPlayController.value.duration.toString().substring(0, 7);
    videoCurrentTime =
        _videoPlayController.value.position.toString().substring(0, 7);

    return Positioned(
      top: 0,
      left: 0,
      width: share!.size!.width,
      height: share!.isFullscreen == true ? share!.size!.height : null,
      child: AspectRatio(
        aspectRatio: _videoPlayController.value.aspectRatio,
        child: Container(
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      _videoPlayController.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: Colors.white,
                    ),
                    onPressed: isPlayOrPause,
                  ),
                  Text(
                    '$videoCurrentTime',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Flexible(
                    child: SilderUI(
                      schedule: _videoSchedule,
                      thumbRadius: thumbRadius,
                      overlayRadius: thumbRadius,
                      //开始滑动时执行的方法,即按下时执行
                      onChangeStart: (double v) {
                        setState(() {});
                      },
                      // 滑动的值改变的时候
                      onChanged: (double v) {
                        setState(() {
                          _videoSchedule = v;
                          this.thumbRadius = 8;
                          this.overlayRadius = 14;
                          _videoPlayController.seekTo(
                              _videoPlayController.value.duration * (v / 100));
                        });
                      },
                      //滑动结束后执行的方法,松开后执行
                      onChangeEnd: (double v) {
                        setState(() {
                          this.thumbRadius = 6;
                          this.overlayRadius = 12;
                        });
                      },
                    ),
                  ),
                  Text(
                    '$videoTotalTime',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.fullscreen,
                      color: Colors.white,
                    ),
                    onPressed: isFullscreen,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
