import 'package:flutter/material.dart';

// * 点击添加
class ClickAdd extends StatefulWidget {
  const ClickAdd({Key? key}) : super(key: key);

  @override
  _ClickAddState createState() => _ClickAddState();
}

class _ClickAddState extends State<ClickAdd> {
  int num = 0;

  Widget _addNum() {
    return Column(children: <Widget>[
      Text(
        '$num',
        style: TextStyle(color: Colors.red, fontSize: 32.0),
      ),
      MaterialButton(
        child: Text('点我'),
        textTheme: ButtonTextTheme.primary,
        onPressed: () => {setState(() => this.num++)},
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
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: this._addNum());
  }
}
