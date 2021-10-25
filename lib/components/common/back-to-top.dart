///按钮的widget完整写法
import 'package:flutter/material.dart';

class BackToTop extends StatefulWidget {
  final ScrollController controller;

  //传入距离底部的距离
  final double bottom;
  final Widget child;

  BackToTop(this.controller, {required this.child, this.bottom = 40});

  @override
  _BackToTopState createState() => _BackToTopState();
}

class _BackToTopState extends State<BackToTop> {
  bool shown = false;

  void isScroll() {
    final bool toShow =
        (widget.controller.offset) > MediaQuery.of(context).size.height / 2;
    if (toShow ^ shown) {
      setState(() {
        shown = toShow;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        Positioned(
          bottom: MediaQuery.of(context).padding.bottom + (widget.bottom),
          right: 20,
          child: Offstage(
            offstage: !shown,
            child: GestureDetector(
                onTap: () {
                  widget.controller.animateTo(
                    0,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeIn,
                  );
                },
                // 返回顶部按钮样式
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  width: 44,
                  height: 44,
                  child: Center(
                    child: Icon(
                      Icons.arrow_upward,
                      size: 20,
                      color: Colors.black38,
                    ),
                  ),
                )

                // Container(
                //     height: 44,
                //     width: 44,
                //     alignment: Alignment(0, 0),
                //     decoration: new BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.all(Radius.circular(16)),
                //       boxShadow: [
                //         BoxShadow(
                //             color: Color(0xFF000000).withOpacity(0.1),
                //             blurRadius: 4,
                //             spreadRadius: 0),
                //       ],
                //     ),
                //     child: ),
                ),
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    widget.controller.addListener(isScroll);
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeListener(isScroll);
    super.dispose();
  }
}
