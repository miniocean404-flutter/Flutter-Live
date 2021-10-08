import 'package:flutter/material.dart';
import 'package:my_app/route/routers.dart';

class NameRouter extends StatelessWidget {
  const NameRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('命名传参路由'),
      ),
      body: Container(
        child: Wrap(
          children: [
            TextButton(
              child: Text('删除当前页面的栈，并进入下一页面'),
              onPressed: () => {
                Routers.navigateTo(context, Routers.Router_Page, replace: true)
              },
            ),
            TextButton(
              child: Text('清空路由栈,并且返回首页'),
              onPressed: () => {
                Routers.navigateTo(
                  context,
                  Routers.Bottom_Bar_Page,
                  clearStack: true,
                )
              },
            ),
          ],
        ),
      ),
    );
  }
}
