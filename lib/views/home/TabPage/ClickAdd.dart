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
        child: Text('MaterialButton'),
        textTheme: ButtonTextTheme.primary,
        onPressed: () => {},
      ),
      ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            child: Text('ButtonBar'),
            onPressed: () => {
              setState(() => {print('你好')}),
            },
            style: ButtonStyle(
                // backgroundColor: MaterialStateProperty.all(Colors.transparent),
                ),
          ),
          ElevatedButton(
            child: Text('ButtonBar'),
            onPressed: () => {
              setState(() => {print('你好')}),
            },
            style: ButtonStyle(
                // backgroundColor: MaterialStateProperty.all(Colors.transparent),
                ),
          ),
        ],
      ),
      ElevatedButton(
        child: Text('IOS弹窗'),
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
                      onPressed: () {
                        Navigator.of(context).pop('cancel');
                      },
                    ),
                    CupertinoDialogAction(
                      child: Text('确认'),
                      onPressed: () {
                        Navigator.of(context).pop('ok');
                      },
                    ),
                  ],
                );
              });
        },
      ),
      Dialog(
        child: Container(
          height: 200,
          child: Text('1'),
        ),
      ),
    ]));
  }
}
