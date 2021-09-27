import 'package:get/get.dart';
// 隐藏滚动水波纹
import 'package:my_app/theme/WaterRipple.dart';
// 路由
import 'package:my_app/views/home/home.dart';
import 'package:my_app/views/category/category.dart';
import 'package:my_app/views/mine/mine.dart';
import 'package:my_app/views/StartPage/StartPage.dart';
import 'package:my_app/views/router/NameRouter.dart';
import 'package:my_app/views/videoPlay/videoPlay.dart';
import 'package:my_app/views/imagePick/ImagePick.dart';
import 'package:my_app/views/PullLoading/PullLoading.dart';
import 'package:my_app/views/router/router.dart';
import 'package:my_app/views/BottomBarPage/BottomBarPage.dart';

class RouteConfig {
  static const String Start_Page = "/";
  static const String Bottom_Bar_Page = "/BottomBarPage";

  static const String home = "/home";
  static const String category = "/category";
  static const String mine = "/mine";

  static const String Video_Play = "/VideoPlay";
  static const String Image_Pick = "/ImagePick";
  static const String Pull_Loading = "/PullLoading";

  // 路由界面
  static const String Name_Router = "/NameRouter";
  static const String Router_Page = "/RouterPage";

  // 别名映射页面
  static final List<GetPage> getPages = [
    GetPage(name: Start_Page, page: () => StartPage()),
    GetPage(
      name: Bottom_Bar_Page,
      page: () => HideScrollWaterRipple(BottomBarPage()),
    ),
    GetPage(name: home, page: () => HomeCotainer()),
    GetPage(name: category, page: () => Category()),
    GetPage(name: mine, page: () => Mine()),
    GetPage(name: Video_Play, page: () => VideoApp()),
    GetPage(name: Image_Pick, page: () => ImagePick()),
    GetPage(name: Pull_Loading, page: () => PullLoading()),
    GetPage(name: Name_Router, page: () => NameRouter()),
    GetPage(name: Router_Page, page: () => RouterPage()),
  ];
}
