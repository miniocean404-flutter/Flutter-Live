import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseDialog extends StatefulWidget {
  final Widget child;
  final double shape; //圆角
  final double horizontal; //左右边距

  const BaseDialog({
    Key? key,
    this.shape = 10,
    this.horizontal = 25,
    required this.child,
  }) : super(key: key);

  @override
  State<BaseDialog> createState() => _BaseDialogState();
}

class _BaseDialogState extends State<BaseDialog> with TickerProviderStateMixin {
  //动画加载控制器
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;

  //初始化动画控制器
  @override
  void initState() {
    super.initState();
    scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 360),
    );
    scaleAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: scaleController, curve: Curves.easeIn),
    );
  }

  @override
  Widget build(BuildContext context) {
    scaleController.forward();
    return Material(
      ///透明样式
      type: MaterialType.transparency,

      ///dialog居中
      child: Center(
        child: ScaleTransition(
          alignment: Alignment.center,
          scale: scaleController,
          child: ListView(
            shrinkWrap: true,
            children: [
              ///背景及内容、边距、圆角等，必须包裹在ListView中
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: widget.horizontal),
                child: Container(
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(widget.shape),
                      ),
                    ),
                  ),
                  child: widget.child,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    scaleController.dispose();
  }
}
