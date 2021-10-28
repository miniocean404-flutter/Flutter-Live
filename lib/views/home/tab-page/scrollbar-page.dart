import 'package:flutter/material.dart';
import 'package:my_app/components/common/scroll-bar.dart';

class ScrollbarPage extends StatelessWidget {
  const ScrollbarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScrollBar(ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container(
              height: 45,
              alignment: Alignment.center,
              child: Text('$index'),
            ),
          );
        },
        itemCount: 30,
        itemExtent: 50,
      )),
    );
  }
}
