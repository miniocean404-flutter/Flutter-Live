import 'package:flutter/material.dart';

// * 去除水波纹
class NoSplashFactory extends InteractiveInkFeatureFactory {
  const NoSplashFactory();

  InteractiveInkFeature create({
    required MaterialInkController controller,
    required RenderBox referenceBox,
    required Offset position,
    required Color color,
    required TextDirection textDirection,
    bool containedInkWell = false,
    RectCallback? rectCallback,
    BorderRadius? borderRadius,
    ShapeBorder? customBorder,
    double? radius,
    VoidCallback? onRemoved,
  }) {
    return new NoSplash(
      controller: controller,
      referenceBox: referenceBox,
      color: color,
      onRemoved: onRemoved,
    );
  }
}

class NoSplash extends InteractiveInkFeature {
  NoSplash({
    required MaterialInkController controller,
    required RenderBox referenceBox,
    required Color color,
    required VoidCallback? onRemoved,
  })  : assert(controller != null),
        assert(referenceBox != null),
        super(
          controller: controller,
          referenceBox: referenceBox,
          onRemoved: onRemoved,
          color: color,
        ) {
    controller.addInkFeature(this);
  }
  @override
  void paintFeature(Canvas canvas, Matrix4 transform) {}
}

// * 隐藏滚动水波纹配置
class NoShadowScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return child;
      case TargetPlatform.android:
        return GlowingOverscrollIndicator(
          showLeading: false,
          showTrailing: false,
          axisDirection: axisDirection,
          color: Theme.of(context).accentColor,
          child: child,
        );
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return GlowingOverscrollIndicator(
          //不显示头部水波纹
          showLeading: false,
          //不显示尾部水波纹
          showTrailing: false,
          axisDirection: axisDirection,
          color: Theme.of(context).accentColor,
          child: child,
        );
    }
  }
}
