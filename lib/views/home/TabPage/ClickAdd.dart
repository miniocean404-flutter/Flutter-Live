import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// * 点击添加
class ClickAdd extends StatefulWidget {
  const ClickAdd({Key? key}) : super(key: key);

  @override
  _ClickAddState createState() => _ClickAddState();
}

class _ClickAddState extends State<ClickAdd> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
      MaterialButton(
        child: Text('点我'),
        textTheme: ButtonTextTheme.primary,
        onPressed: () => {},
      ),
      ButtonBar(
        children: <Widget>[
          ElevatedButton(
            child: Text('按钮'),
            onPressed: () => {
              setState(() => {print('你好')}),
            },
            style: ButtonStyle(
                // backgroundColor: MaterialStateProperty.all(Colors.transparent),
                ),
          ),
        ],
      ),
      Dialog(
        child: Container(
          height: 200,
          child: Text('1'),
        ),
      ),
      RaisedButton(
        child: Text('切换'),
        onPressed: () {
          showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: Text('提示'),
                  content: Text('确认删除吗？'),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      child: Text('取消'),
                      onPressed: () {},
                    ),
                    CupertinoDialogAction(
                      child: Text('确认'),
                      onPressed: () {},
                    ),
                  ],
                );
              });
        },
      )
    ]));
  }
}
