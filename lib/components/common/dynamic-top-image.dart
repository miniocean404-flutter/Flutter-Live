import 'package:flutter/material.dart';

class DynamicTopImage extends StatefulWidget {
  const DynamicTopImage({Key? key}) : super(key: key);

  @override
  _DynamicTopImageState createState() => _DynamicTopImageState();
}

class _DynamicTopImageState extends State<DynamicTopImage>
    with TickerProviderStateMixin {
  double scrollGap = 0; //初始化要加载到图片上的高度
  late double firstPositon; //前一次手指所在处的y值

  // 动画
  late AnimationController animationController;
  late Animation<double> anim;

  @override
  void initState() {
    // 初始化数据状态
    firstPositon = 0;

    // 动画
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    anim = Tween(begin: 0.0, end: 0.0).animate(animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {});
    super.initState();
  }

  // * 松手执行反向动画
  void runAnimate() {
    //设置动画让scrollGap的值从当前的值渐渐回到 0
    setState(() {
      anim = Tween(begin: scrollGap, end: 0.0).animate(animationController)
        ..addListener(() {
          setState(() {
            scrollGap = anim.value;
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

    scrollGap += changed - firstPositon; // 新的一个y值减去前一次的y值然后累加，作为加载到图片上的高度。
    setState(() {
      //更新数据
      firstPositon = changed;
      scrollGap = scrollGap;
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    anim.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      //手指的移动时
      onPointerMove: (result) {
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
            pinned: false, // 代表是否会在顶部保留SliverAppBar
            floating: false, // 代表是否会发生下拉立即出现SliverAppBar
            //设置为true时，当手指放开时，SliverAppBar会根据当前的位置进行调整，始终保持展开或收起的状态，此效果在floating=true时生效
            snap: false,
            expandedHeight: 170 + scrollGap, //顶部控件所占的高度,跟随因手指滑动所产生的位置变化而变化。
            flexibleSpace: FlexibleSpaceBar(
              title: null, //标题
              background: SliverTopBar(
                scrollGap: scrollGap,
              ), //自定义Widget
            ),
          ),
          SliverList(
            // childCount不设置时候 无限创建
            delegate: SliverChildBuilderDelegate((context, i) {
              return Container(
                height: 65,
                color: Colors.primaries[i % Colors.primaries.length],
              );
            }, childCount: 30),
          )
        ],
      ),
    );
  }
}

class SliverTopBar extends StatelessWidget {
  final double scrollGap; // 传入的加载到图片上的高度

  const SliverTopBar({
    Key? key,
    required this.scrollGap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          //缩放的图片
          child: Image.network(
            'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1531798262708&di=53d278a8427f482c5b836fa0e057f4ea&imgtype=0&src=http%3A%2F%2Fh.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F342ac65c103853434cc02dda9f13b07eca80883a.jpg',
            height: 200 + scrollGap,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
