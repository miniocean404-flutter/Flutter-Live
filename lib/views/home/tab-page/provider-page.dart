import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/provider/theme.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatefulWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  _ProviderPageState createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ColorItem(
          color: Colors.white,
          name: '纯洁白',
        ),
        ColorItem(
          color: Colors.blue,
          name: '知乎蓝',
        ),
        ColorItem(
          color: Colors.green,
          name: '原谅绿',
        ),
        ColorItem(
          color: Colors.red,
          name: '中国红',
        ),
        ColorItem(
          color: Colors.pink,
          name: '哔哩哔哩粉',
        ),
        ColorItem(
          color: Colors.black,
          name: '酷黑',
        ),
      ],
    );
  }
}

class ColorItem extends StatelessWidget {
  final Color color;
  final String name;
  const ColorItem({Key? key, required this.color, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<ThemeInfo>(context, listen: false).setColor = name;
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            SizedBox(
              width: 40.w,
            ),
            Container(
              width: 80.r,
              height: 80.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: color,
              ),
            ),
            SizedBox(
              width: 80.w,
            ),
            Text(name)
          ],
        ),
      ),
    );
  }
}
