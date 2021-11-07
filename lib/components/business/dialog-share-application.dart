import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/components/common/button-style.dart';
import 'package:my_app/config/assets.dart';
import 'package:my_app/utils/file-operate.dart';
import 'package:my_app/utils/launch.dart';
import 'package:my_app/utils/util.dart';
import 'package:share_plus/share_plus.dart';

import '../common/dialog/dialog-base.dart';

// 分享弹窗
class ShareDialog extends StatelessWidget {
  final String url;

  const ShareDialog({Key? key, this.url = 'https://www.baidu.com'})
      : super(key: key);

  Widget _buildShareIcon(Color color, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Icon(
          icon,
          color: color,
          size: 30,
        ),
        decoration: const BoxDecoration(
          color: Color(0x66E0E6FD),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 50.w),
          Text(
            '标题',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          SizedBox(height: 50.w),
          Text(
            '简介',
            style: TextStyle(color: Color(0xFFB8C0D4), fontSize: 14),
          ),
          SizedBox(height: 10.w),
          Image.asset(
            Assets.imgShareQRCode,
            width: 120,
            height: 120,
          ),
          SizedBox(height: 20.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ///浏览器打开
              _buildShareIcon(
                Color(0xFF24CF5F),
                Icons.public,
                () => {launchURL('https://www.baidu.com')},
              ),

              ///保存在本地
              _buildShareIcon(
                Color(0xFF1F3EC7),
                Icons.link,
                () => {Share.share('www.baidu.com', subject: 'H直播')},
              ),

              ///保存在本地
              _buildShareIcon(
                Color(0xFFFE8C28),
                Icons.download,
                () => {
                  checkPermission((v) {
                    if (v) {
                      saveAssetsGallery(assets: Assets.imgShareQRCode);
                    }
                  })
                },
              ),
            ],
          ),
          SizedBox(height: 50.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ///在浏览器打开
              Text(
                '浏览器打开',
                style: TextStyle(color: Color(0xFFB8C0D4), fontSize: 13),
              ),

              Text(
                '分享链接',
                style: TextStyle(color: Color(0xFFB8C0D4), fontSize: 13),
              ),

              ///保存在本地
              Text(
                '保存到本地',
                style: TextStyle(color: Color(0xFFB8C0D4), fontSize: 13),
              ),
            ],
          ),
          SizedBox(height: 30),

          ///分割线 0.5 - 无边距
          Divider(
            height: 0.5,
            thickness: 0.5,
            color: Color(0x66E0E6FD),
          ),

          SizedBox(
            width: double.infinity,
            height: 60,
            child: TextButton(
              style: ButtonStyles.getNoShapeStyle(),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                '取消',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}
