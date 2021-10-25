import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';

class LiveVideoPage extends StatefulWidget {
  LiveVideoPage();

  @override
  _LiveVideoPageState createState() => _LiveVideoPageState();
}

class _LiveVideoPageState extends State<LiveVideoPage> {
  final FijkPlayer player = FijkPlayer();

  _LiveVideoPageState();

  @override
  void initState() {
    super.initState();
    // player.setDataSource(widget.url, autoPlay: true);
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
        ));
  }
}
