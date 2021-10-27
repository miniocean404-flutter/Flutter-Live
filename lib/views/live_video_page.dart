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

class _LiveVideoPageState extends State<LiveVideoPage> {
  final FijkPlayer player = FijkPlayer();
  late final String url;

  _LiveVideoPageState();

  @override
  void initState() {
    super.initState();

    Platform.getLiveUrl(widget.platform, widget.roomId).then((value) => {
          this.setState(() {
            url = value;
          }),
          player.setDataSource(url, autoPlay: true)
        });
  }

  @override
  void dispose() {
    super.dispose();
    player.release();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("直播")),
      body: Container(
        alignment: Alignment.center,
        child: FijkView(
          player: player,
        ),
      ),
    );
  }
}
