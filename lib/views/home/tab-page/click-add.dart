import 'dart:ui';

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
      ElevatedButton(
        child: Text('IOS底部弹窗'),
        onPressed: () {
          showCupertinoModalPopup(
            context: context,
            //对弹出框以外的区域做模糊或者矩阵操作
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            builder: (BuildContext context) {
              return CupertinoActionSheet(
                title: Text('提示'),
                message: Text('是否要删除当前项？'),
                actions: <Widget>[
                  CupertinoActionSheetAction(
                    child: Text('删除'),
                    onPressed: () {},
                    isDefaultAction: true,
                  ),
                  CupertinoActionSheetAction(
                    child: Text('暂时不删'),
                    onPressed: () {},
                    isDestructiveAction: true,
                  ),
                ],
              );
            },
          );
        },
      ),
      ElevatedButton(
        child: Text('底部弹窗'),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.white,
            elevation: 10,
            isScrollControlled: false,
            isDismissible: true, //是否可以点击背景关闭。
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            builder: (BuildContext context) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('老孟$index'),
                  );
                },
                itemExtent: 1,
                itemCount: 3,
              );
              // return BottomSheet(onClosing: onClosing, builder: builder)
            },
          );
        },
      )
    ]));
  }
}
