import 'package:flutter/material.dart';

class Mine extends StatefulWidget {
  Mine({Key? key}) : super(key: key);

  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> with TickerProviderStateMixin {
  double scrollGap = 0; //初始化要加载到图片上的高度
  late BoxFit fitType; //图片填充类型（刚开始滑动时是以宽度填充，拉开之后以高度填充）
  late double firstPositon; //前一次手指所在处的y值

  // 动画
  late AnimationController animationController;
  late Animation<double> anim;

  @override
  void initState() {
    // 初始化数据状态
    super.initState();
    firstPositon = 0;
    fitType = BoxFit.fitWidth;

    // 动画
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    anim = Tween(begin: 0.0, end: 0.0).animate(animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {});
  }

  // * 松手执行反向动画
  void runAnimate() {
    //设置动画让scrollGap的值从当前的值渐渐回到 0
    setState(() {
      anim = Tween(begin: scrollGap, end: 0.0).animate(animationController)
        ..addListener(() {
          if (scrollGap >= 45) {
            //同样改变图片填充类型
            fitType = BoxFit.fitHeight;
          } else {
            fitType = BoxFit.fitWidth;
          }
          setState(() {
            scrollGap = anim.value;
            fitType = fitType;
          });
        });
      firstPositon = 0; //同样归零
    });
  }

  // * 下拉计算高度
  void updatePicHeight(changed) {
    if (firstPositon == 0) {
      // 如果是手指第一次点下时，我们不希望图片大小就直接发生变化，所以进行一个判定。
      firstPositon = changed;
    }

    if (scrollGap >= 45) {
      //当我们加载到图片上的高度大于某个值的时候，改变图片的填充方式，让它由以宽度填充变为以高度填充，从而实现了图片视角上的放大。
      fitType = BoxFit.fitHeight;
    } else {
      fitType = BoxFit.fitWidth;
    }

    scrollGap += changed - firstPositon; // 新的一个y值减去前一次的y值然后累加，作为加载到图片上的高度。
    setState(() {
      //更新数据
      firstPositon = changed;
      scrollGap = scrollGap;
      fitType = fitType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Listener(
        //手指的移动时
        onPointerMove: (result) {
          print(result);
          updatePicHeight(result.position.dy); //自定义方法，图片的放大由它完成。
        },
        //当手指抬起离开屏幕时
        onPointerUp: (_) {
          runAnimate(); //动画执行
          animationController.forward(from: 0); //重置动画
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              // SliverAppBar透明
              // backgroundColor: Colors.transparent,
              // elevation: 0,
              pinned: true, // 代表是否会在顶部保留SliverAppBar
              floating: false, // 代表是否会发生下拉立即出现SliverAppBar
              snap:
                  false, //snap必须与floatingtrue联合使用，表示显示SliverAppBar之后，如果没有完全拉伸，是否会完全神展开
              expandedHeight: 236 + scrollGap, //顶部控件所占的高度,跟随因手指滑动所产生的位置变化而变化。
              flexibleSpace: FlexibleSpaceBar(
                title: null, //标题
                background: SliverTopBar(
                  scrollGap: scrollGap,
                  fitType: fitType,
                ), //自定义Widget
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                TabBar(
                  labelColor: Colors.red,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(icon: Icon(Icons.cake), text: '左侧'),
                    Tab(icon: Icon(Icons.golf_course), text: '右侧'),
                  ],
                  controller: TabController(length: 2, vsync: this),
                ),
              ),
            ),
            // MineBody(),
            SliverList(
              // 无限创建
              delegate: SliverChildBuilderDelegate(
                (context, i) {
                  return Container(
                    padding: EdgeInsets.all(16),
                    child: Text("我是第$i元素"),
                    color: Colors.white70,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SliverTopBar extends StatelessWidget {
  final double scrollGap; // 传入的加载到图片上的高度
  final BoxFit fitType; // 传入的填充方式

  const SliverTopBar({
    Key? key,
    required this.scrollGap,
    required this.fitType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              //缩放的图片
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1531798262708&di=53d278a8427f482c5b836fa0e057f4ea&imgtype=0&src=http%3A%2F%2Fh.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F342ac65c103853434cc02dda9f13b07eca80883a.jpg',
                height: 180 + scrollGap,
                fit: fitType,
              ),
            ),
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 16, top: 10),
                    child: Text("QQ：54063222"),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16, top: 8),
                    child: Text("男：四川 成都"),
                  )
                ],
              ),
            ),
          ],
        ),
        Positioned(
          left: 30,
          top: 130 + scrollGap,
          child: Container(
            width: 100,
            height: 100,
            child: CircleAvatar(
                // backgroundImage: AssetImage('images/bg.jpg'),
                ),
          ),
        )
      ],
    );
  }
}

// Bar

class MineBody extends StatelessWidget {
  const MineBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(''),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
