import 'package:flutter/material.dart';

/// 原生的上拉下拉加载更多写法
class OriginRefresh extends StatefulWidget {
  final Future<dynamic> initValue;
  final Future<dynamic> Function() loadingMore;
  final Future<Null> Function() refresh; // 加载更多
  final Widget child;

  const OriginRefresh({
    Key? key,
    required this.initValue,
    required this.loadingMore,
    required this.refresh,
    required this.child,
  }) : super(key: key);

  @override
  _OriginRefreshState createState() => _OriginRefreshState();
}

class _OriginRefreshState extends State<OriginRefresh> {
  ScrollController _controller = new ScrollController(); // 监听滚动底部控制器
  late Future<dynamic> initLoading = widget.initValue; // 初始化的值
  late List recommendList;

  // ListView.builder(
  //     controller: _controller,
  //     shrinkWrap: false, //为true可以解决子控件必须设置高度的问题,但是没有懒加载，非常影响性能
  //     // physics: NeverScrollableScrollPhysics(), //禁用滑动事件
  //     itemCount: recommendList.length,
  //     // itemExtent: 385, // 每一项的高度,极大提升性能
  //     itemBuilder: (BuildContext context, int index) {},
  //   )

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: widget.refresh, //下拉刷新回调
      displacement: 10, //指示器显示时距顶部位置
      color: Colors.blue, //指示器颜色，默认ThemeData.accentColor
      //是否应处理滚动通知的检查（是否通知下拉刷新动作）
      notificationPredicate: defaultScrollNotificationPredicate,
      child: FutureBuilder<dynamic>(
        future: initLoading,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // 请求已结束
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}"); // 请求失败，显示错误
            } else {
              // 请求成功，显示数据
              return widget.child;
            }
          } else if (snapshot.connectionState == ConnectionState.active ||
              snapshot.connectionState == ConnectionState.waiting) {
            // 请求未结束，显示loading
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        widget.loadingMore();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
