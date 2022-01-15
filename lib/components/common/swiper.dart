import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Swiper extends StatefulWidget {
  final double height;
  final int druation;
  final List<String> pageList;
  final GestureTapCallback? onTap;

  const Swiper({
    Key? key,
    required this.pageList,
    this.height = 230,
    this.druation = 2000,
    this.onTap,
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
                  onPointerUp: (TapUpDetails tapUpDetails) {
                    startTimer();
                  },
                  onPointerDown: (TapDownDetails tapUpDetails) {
                    _timer.cancel();
                  },
                  onTap: widget.onTap,
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
  final GestureTapUpCallback onPointerUp;
  final GestureTapDownCallback onPointerDown;
  final GestureTapCallback? onTap;

  const SwiperItem({
    Key? key,
    required this.url,
    required this.onPointerUp,
    required this.onPointerDown,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            url,
            fit: BoxFit.fill,
          ),
        ),
      ),
      onTapDown: onPointerDown,
      onTapUp: onPointerUp,
      onTap: onTap,
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
      bottom: 0.05.sw,
      right: 0.05.sw,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(length, (i) {
            final bool isCurrentIndex = currentIndex % (length) == i;

            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              width: isCurrentIndex ? 13 : 6.5,
              height: 6.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: isCurrentIndex ? Colors.orange[600] : Colors.white,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
