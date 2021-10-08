import 'package:flutter/material.dart';
import 'package:my_app/route/routers.dart';

class RouterUse extends StatelessWidget {
  const RouterUse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: <Widget>[
          TextButton(
            child: Text('基本路由'),
            onPressed: () => {Routers.navigateTo(context, Routers.Router_Page)},
          ),
          TextButton(
            child: Text('命名传参路由'),
            onPressed: () => {Routers.navigateTo(context, Routers.Name_Router)},
          )
        ],
      ),
    );
  }
}
