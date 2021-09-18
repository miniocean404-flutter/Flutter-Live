import 'package:flutter/material.dart';
import '../../main.dart';

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
              child: Text('推送并且替换当前路由名称'),
              onPressed: () => {
                Navigator.pushReplacementNamed(context, '/NameRouter'),
              },
            ),
            TextButton(
              child: Text('清空路由栈,并且返回根'),
              onPressed: () => {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                  (route) => false,
                )
              },
            ),
          ],
        ),
      ),
    );
  }
}
