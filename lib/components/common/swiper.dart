import 'dart:async';

import 'package:flutter/material.dart';

class Swiper extends StatefulWidget {
  final double height;
  final int druation;
  Swiper({Key? key, this.height = 230, this.druation = 2000}) : super(key: key);

  @override
  _SwiperState createState() => _SwiperState();
}

class _SwiperState extends State<Swiper> {
  List<String> pageList = ['轮播图1', '轮播图2', '轮播图3'];
  late PageController pageController;
  int _currentPageIndex = 10002;
  late Timer _timer;

  @override
  void initState() {
    pageController = PageController(initialPage: _currentPageIndex);

    ///当前页面绘制完第一帧后回调
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      startTimer();
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: widget.druation), (value) {
      _currentPageIndex++;
      //触发轮播切换
      pageController.animateToPage(
        _currentPageIndex,
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      );
    });
  }

  // 界面
  _buildPageViewItem(String txt, {Color color = Colors.blue}) {
    return Listener(
      child: Container(
        color: color,
        alignment: Alignment.center,
        child: Text(
          txt,
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
      ),
      onPointerDown: (PointerDownEvent pointerDownEvent) {
        _timer.cancel();
      },
      onPointerUp: (PointerUpEvent upEvent) {
        startTimer();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: widget.height,
        child: Stack(
          children: <Widget>[
            // 连续滚动
            PageView.builder(
              controller: pageController,
              itemCount: pageList.length * 10000,
              itemBuilder: (context, index) {
                return _buildPageViewItem(pageList[index % (pageList.length)]);
              },
              onPageChanged: (int index) {
                setState(() {
                  // 取余设置当前的轮播图
                  _currentPageIndex = index;
                });
              },
            ),
            // 指示器
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(pageList.length, (i) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPageIndex % (pageList.length) == i
                              ? Colors.white
                              : Colors.grey),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
