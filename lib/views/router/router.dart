import 'package:flutter/material.dart';

class RouterPage extends StatelessWidget {
  const RouterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('基本路由页面'),
        centerTitle: true,
      ),
      body: Container(
        child: TextButton(
          child: Text('返回上一页面'),
          onPressed: () => {Navigator.of(context).pop()},
        ),
      ),
    );
  }
}
