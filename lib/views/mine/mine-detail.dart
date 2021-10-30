import 'package:flutter/material.dart';

class MineDetail extends StatefulWidget {
  MineDetail({Key? key}) : super(key: key);

  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<MineDetail> with TickerProviderStateMixin {
  double scrollGap = 0; //初始化要加载到图片上的高度
  late double oldPosition = 0;
  bool downPull = false;

  // 动画
  // late AnimationController animationController;
  // late Animation<double> anim;

  @override
  void initState() {
    // 初始化数据状态
    super.initState();

    // // 动画
    // animationController =
    //     AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    // anim = Tween(begin: 0.0, end: 0.0).animate(animationController)
    //   ..addListener(() {
    //     setState(() {});
    //   })
    //   ..addStatusListener((status) {});
  }

  // * 松手执行反向动画
  void runAnimate() {
    //设置动画让scrollGap的值从当前的值渐渐回到 0
    // anim = Tween(begin: scrollGap, end: 0.0).animate(animationController)
    //   ..addListener(() {
    //     setState(() {
    //       scrollGap = anim.value;
    //     });
    //   });
    setState(() {
      scrollGap = 0;
      oldPosition = 0;
    });
  }

  // * 滑动计算高度
  void updatePicHeight(y) {
    if (oldPosition == 0) {
      oldPosition = y;
      return;
    }

    double gap = y - oldPosition;
    gap > 0 ? downPull = true : downPull = false;

    this.setState(() {
      scrollGap += gap;
      oldPosition = y;
    });
  }

  @override
  void dispose() {
    // animationController.dispose();
    // anim.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Listener(
        //手指的移动时
        onPointerMove: (result) {
          updatePicHeight(result.position.dy);
        },
        //当手指抬起离开屏幕时
        onPointerUp: (_) {
          runAnimate(); //动画执行
          // animationController.forward(from: 0); //重置动画
        },
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                scrollGap: scrollGap,
                downPull: downPull,
              ),
            ),
            SliverList(
              // childCount不设置时候 无限创建
              delegate: SliverChildBuilderDelegate((context, i) {
                return Container(
                  height: 60,
                  color: Colors.primaries[i % Colors.primaries.length],
                );
              }, childCount: 30),
            )
          ],
        ),
      ),
    );
  }
}

// Bar
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double scrollGap; // 传入的加载到图片上的高度
  final bool downPull;

  const _SliverAppBarDelegate({
    required this.scrollGap,
    required this.downPull,
  });

  @override
  double get maxExtent => scrollGap > 0 ? scrollGap + 200.0 : 200.0;
  @override
  double get minExtent => 80.0;

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return true;
  }

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            child: Image.network(
              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1531798262708&di=53d278a8427f482c5b836fa0e057f4ea&imgtype=0&src=http%3A%2F%2Fh.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F342ac65c103853434cc02dda9f13b07eca80883a.jpg',
              height: downPull == true ? scrollGap + 200 : 200,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            // top: downPull == false ? scrollGap : 0,
          )
        ],
      ),
    );
  }
}
