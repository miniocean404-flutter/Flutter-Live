import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/components/common/refresh.dart';

class EasyRefreshPage extends StatefulWidget {
  EasyRefreshPage({Key? key}) : super(key: key);

  @override
  _EasyRefreshPageState createState() => _EasyRefreshPageState();
}

class _EasyRefreshPageState extends State<EasyRefreshPage> {
  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];

  _onRefresh(c) async {
    await Future.delayed(Duration(milliseconds: 1000));
    c.refreshCompleted();
  }

  Future _onLoading(c) async {
    await Future.delayed(Duration(milliseconds: 1000));
    items.add((items.length + 1).toString());
    if (mounted) setState(() {});
    c.loadComplete();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshWidget(
        state: Refresh.refresh,
        enablePullDown: true,
        enablePullUp: true,
        onRefresh: _onRefresh,
        onLoadMore: _onLoading,
        child: ListView.builder(
          itemBuilder: (c, i) => Card(child: Center(child: Text(items[i]))),
          itemExtent: 100.0,
          itemCount: items.length,
        ),
      ),
    );
  }
}
