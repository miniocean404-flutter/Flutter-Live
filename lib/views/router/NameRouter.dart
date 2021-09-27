import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              onPressed: () => {Get.offNamed('/RouterPage')},
            ),
            TextButton(
              child: Text('清空路由栈,并且返回首页'),
              onPressed: () => {Get.offAllNamed('/home')},
            ),
          ],
        ),
      ),
    );
  }
}
