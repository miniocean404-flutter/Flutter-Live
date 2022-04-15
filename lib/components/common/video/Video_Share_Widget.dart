import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoShareWidget extends InheritedWidget {
  final VideoPlayerController videoPlayController;
  final bool? isFullscreen;
  final Size? size;
  final Widget child;

  VideoShareWidget({
    Key? key,
    required this.child,
    required this.videoPlayController,
    this.isFullscreen,
    this.size,
  }) : super(key: key, child: child);

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static VideoShareWidget? of(BuildContext context) {
    //  return context.getElementForInheritedWidgetOfExactType<VideoShareWidget>().widget; 发生变化时候不调用其didChangeDependencies()
    return context.dependOnInheritedWidgetOfExactType<VideoShareWidget>();
  }

  //该回调决定当data发生变化时，是否通知子树中依赖data的Widget
  @override
  bool updateShouldNotify(VideoShareWidget oldWidget) {
    //如果返回true，则子树中依赖(build函数中有调用)本widget的子widget的`state.didChangeDependencies`会被调用
    return oldWidget.videoPlayController != videoPlayController;
  }
}
