import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:my_app/components/business/dialog-share-application.dart';
import 'package:my_app/config/assets.dart';
import 'package:my_app/config/color.dart';
import 'package:my_app/route/routers.dart';
import 'package:share_plus/share_plus.dart';

class Mine extends StatefulWidget {
  const Mine({Key? key}) : super(key: key);

  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 0.07.sw),
        child: Column(
          children: [
            SizedBox(height: 40.w),
            MineInfo(),
            SizedBox(height: 40.w),
            MineAssets(),
            SizedBox(height: 40.w),
            MineSelect(),
          ],
        ),
      ),
    );
  }
}

// * 头像
class MineInfo extends StatelessWidget {
  const MineInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipOval(
                child: Container(
                  width: 200.w,
                  height: 200.w,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Image.network(
                      'http://img.doutula.com/production/uploads/image/2021/10/29/20211029476591_CxDJpO.jpg'),
                ),
              ),
              SizedBox(width: 40.w),
              Text(
                '用户名',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Routers.navigateTo(context, Routers.settings);
            },
            child: Container(
              width: 130.w,
              height: 100.w,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                ),
              ),
              child: Icon(Icons.settings),
            ),
          )
        ],
      ),
    );
  }
}

// * 收藏信息
class MineAssets extends StatelessWidget {
  const MineAssets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.w,
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(vertical: 30.w),
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InfoShow(num: 10, info: '收藏'),
          InfoShow(num: 3, info: '分享'),
          InfoShow(num: 7, info: '积分'),
          InfoShow(num: 11, info: '历史'),
        ],
      ),
    );
  }
}

class InfoShow extends StatelessWidget {
  final int num;
  final String info;
  const InfoShow({
    Key? key,
    required this.num,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          '$num',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text('$info'),
      ],
    );
  }
}

// * 功能
class MineSelect extends StatelessWidget {
  const MineSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.35.sh,
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(vertical: 30.w),
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MineAction(
            info: '个人信息',
            icon: Icons.person_outline_outlined,
            cb: () {},
          ),
          MineAction(
            info: '分享',
            icon: Icons.share,
            cb: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => ShareDialog(),
              );
            },
          ),
          MineAction(
            info: '问题反馈',
            icon: Icons.feedback_outlined,
            cb: () {},
          ),
          MineAction(
            info: '关于',
            icon: Icons.info_outline,
            cb: () {
              Routers.navigateTo(context, Routers.about);
            },
          ),
        ],
      ),
    );
  }
}

class MineAction extends StatelessWidget {
  final String info;
  final IconData icon;
  final GestureTapCallback cb;
  const MineAction({
    Key? key,
    required this.info,
    required this.icon,
    required this.cb,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: cb,
      child: Container(
        color: AppColor.primary,
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon),
                SizedBox(width: 50.w),
                Text(info),
              ],
            ),
            Icon(Icons.chevron_right)
          ],
        ),
      ),
    );
  }
}
