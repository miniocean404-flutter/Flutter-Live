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
