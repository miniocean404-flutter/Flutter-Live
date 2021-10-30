import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

///刷新状态
enum Refresh {
  ///初次进入页面加载
  first,

  ///上拉加载
  pull,

  ///下拉加载
  down,
}

class RefreshWidget extends StatefulWidget {
  final String? tag = null;

  ///是否启用上拉
  final bool enablePullUp;

  ///是否启用下拉
  final bool enablePullDown;

  ///下拉刷新回调
  final VoidCallback? onRefresh;

  ///上拉加载回调
  final VoidCallback? onLoadMore;

  ///子类，必须是ListView
  final Widget child;

  const RefreshWidget({
    Key? key,
    required this.enablePullUp,
    required this.enablePullDown,
    this.onRefresh,
    this.onLoadMore,
    required this.child,
  }) : super(key: key);

  @override
  _RefreshWidgetState createState() => _RefreshWidgetState();
}

class _RefreshWidgetState extends State<RefreshWidget>
    with AutomaticKeepAliveClientMixin {
  RefreshController controller = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    // widget.getController.initPullLoading(controller);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container();
  }

  @override
  bool get wantKeepAlive => true;
}
