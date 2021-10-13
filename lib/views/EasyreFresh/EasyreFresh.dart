import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter/material.dart';

class EasyreFresh extends StatefulWidget {
  EasyreFresh({Key? key}) : super(key: key);

  @override
  _EasyreFreshState createState() => _EasyreFreshState();
}

class _EasyreFreshState extends State<EasyreFresh> {
  late EasyRefreshController _controller;
  List<String> list = [];

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    for (int i = 0; i < 100; i++) {
      list.add("i am $i");
    }
  }

  // 项目中没有讲到 在实例化后销毁当前页面时需要销毁该controller
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('下拉刷新'),
      ),
      body: EasyRefresh(
        // 是否开启控制结束加载
        enableControlFinishLoad: false,
        // 控制器
        controller: _controller,
        header: PhoenixHeader(),
        // 下部样式
        footer: ClassicalFooter(
          bgColor: Colors.white,
          // //  更多信息文字颜色
          // infoColor: KColor.refreshTextColor,
          // // 字体颜色
          // textColor: KColor.refreshTextColor,
          // // 加载失败时显示的文字
          // loadText: KString.loadFailedText,
          // // 没有更多时显示的文字
          // noMoreText: '',
          // // 是否显示提示信息
          // showInfo: false,
          // // 正在加载时的文字
          // loadingText: KString.loading,
          // // 准备加载时显示的文字
          // loadReadyText: KString.loadReadyText,
          // // 加载完成显示的文字
          // loadedText: KString.loadedText,
        ),
        // 下拉刷新事件回调 【本项目中没有用到】
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2), () {
            // 事件处理
            // 重置刷新状态 【没错，这里用的是resetLoadState】
            _controller.resetLoadState();
          });
        },
        // 上拉加载事件回调
        onLoad: () async {
          await Future.delayed(Duration(seconds: 2), () {
            // 请求
            // 结束加载
            _controller.finishLoad();
          });
        },
        child: ListView.separated(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return Text(list[index]);
          },
          separatorBuilder: (BuildContext context, int index) => Divider(
            height: 1,
            color: Colors.transparent,
          ),
          // controller: scrollController,
          padding: EdgeInsets.all(0),
        ),
      ),
    );
  }
}
