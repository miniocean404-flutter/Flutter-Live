import 'package:flutter/material.dart';

class ScrollBar extends StatefulWidget {
  final Widget child;

  ScrollBar(this.child, {Key? key}) : super(key: key);

  @override
  _ScrollBarState createState() => _ScrollBarState();
}

class _ScrollBarState extends State<ScrollBar> {
  double _alignmentY = -1;
  bool _handleScrollNotification(ScrollNotification notification) {
    final ScrollMetrics metrics = notification.metrics;
    print('滚动组件最大滚动距离:${metrics.maxScrollExtent}');
    print('当前滚动位置:${metrics.pixels}');
    setState(() {
      _alignmentY = -1 + (metrics.pixels / metrics.maxScrollExtent) * 2;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: Stack(
        alignment: Alignment.topRight,
        children: <Widget>[
          widget.child,
          //滚动条
          Container(
            alignment: Alignment(1, _alignmentY),
            padding: EdgeInsets.only(right: 5),
            child: _ScrollBar(),
          )
        ],
      ),
    );
  }
}

// 滚动条样式
class _ScrollBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 60,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.blue),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.arrow_drop_up,
            size: 18,
          ),
          Icon(
            Icons.arrow_drop_down,
            size: 18,
          ),
        ],
      ),
    );
  }
}
