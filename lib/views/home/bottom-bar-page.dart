import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/views/video/dy-video.dart';
import 'package:my_app/views/category/category.dart';
// bottomBar
import 'package:my_app/views/home/home.dart';
import 'package:my_app/views/mine/mine.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  _BottomBarPageState createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
  }

  //监听应用从后台切换到前台时，读取粘贴板中的数据，验证URL，已保存分享
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      var clipboardData = Clipboard.getData(Clipboard.kTextPlain);
      clipboardData.then((v) {
        debugPrint("clipboardData=> ${v?.text}");
        if ((v!.text!.startsWith("https://") ||
            v.text!.startsWith("http://"))) {
          // Get.dialog(ShareArticleDialog(url: value.text!));
        }
      });
    }
  }

  int _currentIndex = 0;
  List<Widget> bottomBarList = [
    HomeContainer(),
    DyVideo(),
    Category(),
    Mine(),
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
      ),
       context: context,
      designSize: Size(1080, 2356),
      orientation: Orientation.portrait,
    );

    return WillPopScope(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed, // 导航条过长是否进行隐藏
          onTap: (int index) {
            setState(() {
              this._currentIndex = index;
            });
          },
          currentIndex: _currentIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '首页',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_call_rounded),
              label: '视频',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: '分类',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '我',
            )
          ],
        ),
        body: IndexedStack(
          index: this._currentIndex,
          children: bottomBarList,
        ),
      ),
      onWillPop: () async {
        return true;
      },
    );
  }
}
