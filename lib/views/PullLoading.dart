import 'package:flutter/material.dart';
import 'package:my_app/components/common/Pull.dart';

class PullLoading extends StatefulWidget {
  PullLoading({Key? key}) : super(key: key);

  @override
  _PullLoadingState createState() => _PullLoadingState();
}

class _PullLoadingState extends LnpullListenerState<PullLoading> {
  List<String> list = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 99; i++) {
      list.add("i am $i");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('下拉加载更多'),
      ),
      body: Center(
        child: getPullListener(
          child: ListView.separated(
            itemCount: list.length + 1,
            itemBuilder: (BuildContext context, int position) {
              return getRow(position);
            },
            separatorBuilder: (BuildContext context, int index) => Divider(
              height: 1,
              color: Colors.transparent,
            ),
            // controller: scrollController,
            padding: EdgeInsets.all(0),
          ),
          startRefrensh: onRefrensh,
        ),
      ),
    );
  }

  getRow(int position) {
    if (position == 0) {
      return getRfrenshHeader();
    } else {
      return Text(list[position - 1]);
    }
  }

  onRefrensh() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      finishLoading();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
