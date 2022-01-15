import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';
import 'package:my_app/http/platform.dart';

class LiveVideoPage extends StatefulWidget {
  final String platform;
  final String roomId;
  LiveVideoPage({
    required this.platform,
    required this.roomId,
  });

  @override
  _LiveVideoPageState createState() => _LiveVideoPageState();
}

class _LiveVideoPageState extends State<LiveVideoPage>
    with WidgetsBindingObserver {
  final FijkPlayer player = FijkPlayer();
  final double aspectRatio = 16 / 9;
  late final String url;

  _LiveVideoPageState();

  @override
  void initState() {
    Platform.getLiveUrl(widget.platform, widget.roomId).then((value) => {
          this.setState(() {
            url = value;
          }),
          player.setDataSource(url, autoPlay: true)
        });

    super.initState();
  }

  // WidgetsBindingObserver 实现
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("--" + state.toString());
    switch (state) {
      //切换前后台时,inactive会调用
      case AppLifecycleState.inactive: // 处在不活动状态，无法处理用户响应
        break;
      case AppLifecycleState.resumed: // 恢复-应用程序是可见的
        player.start();
        break;
      case AppLifecycleState.paused: //不可见且不能响应用户的输入，但在后台继续活动中
        player.pause();
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("直播")),
      body: Container(
        child: FijkView(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width / aspectRatio,
          player: player,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    player.release();
  }
}
