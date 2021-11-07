import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_app/config/assets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

///刷新状态
enum Refresh {
  ///初次进入页面加载
  refresh,
  first,
  noData,
  error,
}

class RefreshWidget extends StatefulWidget {
  final bool? enablePullUp;
  final bool? enablePullDown;
  final Function? onRefresh;
  final Function? onLoadMore;
  final Refresh state;
  //子类，必须是ListView
  final Widget child;

  const RefreshWidget({
    Key? key,
    required this.state,
    required this.child,
    this.enablePullUp,
    this.enablePullDown,
    this.onRefresh,
    this.onLoadMore,
  }) : super(key: key);

  @override
  _RefreshWidgetState createState() => _RefreshWidgetState();
}

class _RefreshWidgetState extends State<RefreshWidget>
    with AutomaticKeepAliveClientMixin {
  RefreshController controller = RefreshController(initialRefresh: false);
  final TextStyle fontStyle = TextStyle(color: Color(0xFFB8C0D4), fontSize: 14);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Visibility(
            visible: widget.state == Refresh.refresh,
            child: ScrollConfiguration(
              // behavior: OverScrollBehavior(),
              behavior: ScrollBehavior(),
              child: SmartRefresher(
                controller: controller,
                enablePullDown: widget.enablePullDown!,
                enablePullUp: widget.enablePullUp!,
                onRefresh: () => widget.onRefresh!(controller),
                onLoading: () => widget.onLoadMore!(controller),
                child: widget.child,
                header: CustomHeader(
                  builder: (BuildContext context, RefreshStatus? mode) {
                    Widget header;
                    if (mode == RefreshStatus.idle) {
                      ///下拉时显示
                      header = Text('释放刷新', style: fontStyle);
                    } else if (mode == RefreshStatus.refreshing) {
                      ///加载中
                      header = Lottie.asset(
                        Assets.LottieRefreshHeader,
                        width: 100,
                        animate: true,
                      );
                    } else if (mode == RefreshStatus.failed) {
                      ///加载失败
                      header = Text('刷新失败!', style: fontStyle);
                    } else if (mode == RefreshStatus.completed) {
                      ///加载成功
                      header = Text('刷新成功', style: fontStyle);
                    } else {
                      ///超过二层
                      header = Text('释放刷新', style: fontStyle);
                    }

                    return SizedBox(
                      height: 64,
                      child: Center(child: header),
                    );
                  },
                ),
                footer: CustomFooter(
                  builder: (BuildContext context, LoadStatus? mode) {
                    Widget footer;
                    if (mode == LoadStatus.idle) {
                      ///下拉提示
                      footer = Text("上拉加载", style: fontStyle);
                    } else if (mode == LoadStatus.loading) {
                      //加载中
                      footer = Lottie.asset(
                        Assets.LottieRefreshFooter,
                        width: 200,
                        animate: true,
                      );
                    } else if (mode == LoadStatus.failed) {
                      //加载失败
                      footer = Text('加载失败', style: fontStyle);
                    } else if (mode == LoadStatus.noMore) {
                      footer = Text("没有更多数据啦", style: fontStyle);
                    } else if (mode == LoadStatus.canLoading) {
                      footer = Text("下滑取消加载", style: fontStyle);
                    } else {
                      footer = Text("", style: fontStyle);
                    }

                    return SizedBox(
                      height: 60,
                      child: Center(child: footer),
                    );
                  },
                ),
              ),
            ),
          ),

          // * 未加载前显示的动画，加载之后需要隐藏
          Visibility(
            visible: widget.state == Refresh.first,
            child: SizedBox(
              width: 200,
              height: 200,
              child: Lottie.asset(
                Assets.LottiePageLoading,
                width: 200,
                height: 200,
                animate: true,
              ),
            ),
          ),

          // * 加载数据为空的页面
          Visibility(
            visible: widget.state == Refresh.noData,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  Assets.LottieRefreshEmpty,
                  width: 200,
                  animate: true,
                  repeat: false,
                ),
                Text(
                  '没有更多内容啦~',
                  style: TextStyle(color: Color(0xFF1A2F51), fontSize: 18),
                )
              ],
            ),
          ),

          // * 加载出错的页面
          Visibility(
            visible: widget.state == Refresh.error,
            child: Lottie.asset(
              Assets.LottieRefreshError,
              width: 200,
              animate: true,
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
