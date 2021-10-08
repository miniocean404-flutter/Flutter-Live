import 'dart:async';
import 'package:my_app/route/routers.dart';

import 'package:flutter/material.dart';

// * 启动页
class StartPage extends StatefulWidget {
  StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Timer timer;
  int num = 3;

  void startTiming() {
    timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        this.num--;
      });
    });
  }

  void startJump() {
    timer.cancel();
    Routers.navigateTo(context, Routers.Bottom_Bar_Page, clearStack: true);
  }

  void anmationExec() {
    //创建动画控制器
    _animationController = AnimationController(
      // 1.当创建一个AnimationController时，需要传递一个vsync参数，存在vsync时会防止屏幕外动画（动画的 UI不在当前屏幕时）消耗不必要的资源。
      // 2.通过将SingleTickerProviderStateMixin添加到类定义中，可以将stateful对象作为vsync的值。如果要使用自定义的State对象作为vsync时，请包含TickerProviderStateMixin
      vsync: this,
      duration: Duration(
        milliseconds: this.num * 1000,
      ),
    );
    final _animation =
        Tween(begin: 1.0, end: 1.0).animate(_animationController);

    _animation.addStatusListener((status) {
      // 添加动画的监听，当动画完成后的状态是completed完成状态，则执行这边的代码，跳转到登录页
      if (status == AnimationStatus.completed) {
        this.startJump();
      }
    });
    _animationController.forward();

    // 延迟xx秒执行
    // Future.delayed(
    //   Duration(
    //     milliseconds: num * 1000,
    //   ),
    //   () {
    //     Get.offNamed('/BottomBarPage');
    //   },
    // );
  }

  @override
  void initState() {
    this.anmationExec();
    this.startTiming();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Image.asset(
              'assets/startImg.jpg',
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Positioned(
            top: 50.0,
            right: 20.0,
            child: OutlinedButton(
              child: Text('${num}s跳过'),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              onPressed: () => {this.startJump()},
            ),
          )
        ],
      ),
    );
  }
}
// RoundedRectangleBorder()