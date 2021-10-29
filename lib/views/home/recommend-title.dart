import 'package:flutter/material.dart';
import 'package:my_app/config/color.dart';
import 'package:my_app/route/routers.dart';

class RecommendTitle extends StatelessWidget {
  const RecommendTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Routers.navigateTo(context, Routers.search);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
        decoration: BoxDecoration(
          color: Color(0x30cccccc),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 5),
              child: Icon(
                Icons.search,
                size: 18,
                color: AppColor.un3active,
              ),
            ),
            Text(
              '搜索',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
