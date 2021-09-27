import 'package:flutter/material.dart';

class Mine extends StatelessWidget {
  const Mine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: MineAppbar()._buildAppBar(),
        body: MineBody(),
      ),
    );
  }
}

// * AppBar
class MineAppbar {
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text('我'),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: (() => {print('我的页面中的搜索按钮点击')}),
        ),
      ],
    );
  }
}

class MineBody extends StatelessWidget {
  const MineBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('鸟'),
    );
  }
}
