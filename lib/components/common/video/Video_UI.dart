import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import './Video_Control.dart';
import 'Video_Share_Widget.dart';

class VideoUi extends StatefulWidget {
  VideoUi({Key? key}) : super(key: key);

  @override
  _VideoUiState createState() => _VideoUiState();
}

class _VideoUiState extends State<VideoUi> with VideoControl {
  double _videoSchedule = 20;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("共享数据更新");
  }

  @override
  Widget build(BuildContext context) {
    final VideoPlayerController _videoPlayController =
        VideoShareWidget.of(context)!.videoPlayController;
    Size screenSize = MediaQuery.of(context).size;

    void isPlayOrPause() {
      _videoPlayController.value.isPlaying
          ? _videoPlayController.pause()
          : _videoPlayController.play();
    }

    void isFullscreen() {
      // 横着
      if (MediaQuery.of(context).orientation == Orientation.landscape) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
        ]);

        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky); //隐藏
      } else {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge); //恢复
      }
    }

    return Positioned(
      top: 0,
      left: 0,
      width: screenSize.width,
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
                    '时间',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Flexible(
                    child: Slider(
                      value: _videoSchedule,
                      min: 0,
                      max: 100,
                      onChanged: (v) {
                        setState(() {
                          _videoSchedule = v;
                        });
                      },
                    ),
                  ),
                  Text(
                    '时间',
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
