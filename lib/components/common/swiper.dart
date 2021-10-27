import 'dart:async';

import 'package:flutter/material.dart';

class Swiper extends StatefulWidget {
  final double height;
  final int druation;
  final List<String> pageList;
  const Swiper({
    Key? key,
    required this.pageList,
    this.height = 230,
    this.druation = 2000,
  }) : super(key: key);

  @override
  _SwiperState createState() => _SwiperState(pageList: pageList);
}

class _SwiperState extends State<Swiper> {
  late PageController pageController;
  late Timer _timer;

  final List<String> pageList;
  int _currentPageIndex = 3 * 10000 ~/ 2 - 1;

  _SwiperState({
    required this.pageList,
  });

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
                return SwiperItem(
                  url: pageList[index % (pageList.length)],
                  onPointerUp: (PointerUpEvent upEvent) {
                    startTimer();
                  },
                  onPointerDown: (PointerDownEvent pointerDownEvent) {
                    _timer.cancel();
                  },
                );
              },
              onPageChanged: (int index) {
                setState(() {
                  // 取余设置当前的轮播图
                  _currentPageIndex = index;
                });
              },
            ),
            Indicator(
              length: pageList.length,
              currentIndex: _currentPageIndex,
            ),
          ],
        ),
      ),
    );
  }
}

// 界面
class SwiperItem extends StatelessWidget {
  final Color backgroundColor = Colors.white;
  final String url;
  final PointerUpEventListener onPointerUp;
  final PointerDownEventListener onPointerDown;

  const SwiperItem({
    Key? key,
    required this.url,
    required this.onPointerUp,
    required this.onPointerDown,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Listener(
      child: Container(
        color: backgroundColor,
        child: Image.network(
          url,
          fit: BoxFit.fill,
        ),
      ),
      onPointerDown: onPointerDown,
      onPointerUp: onPointerUp,
    );
  }
}

// 指示器
class Indicator extends StatelessWidget {
  final int length;
  final int currentIndex;
  const Indicator({
    Key? key,
    required this.length,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(length, (i) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    currentIndex % (length) == i ? Colors.white : Colors.grey,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
