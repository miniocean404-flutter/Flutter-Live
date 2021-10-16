import 'package:flutter/material.dart';

class RecommendTitle extends StatelessWidget {
  const RecommendTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
            decoration: BoxDecoration(
              color: Color(0xFFf5f6f7),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: Icon(
                    Icons.search,
                    size: 18,
                    color: Theme.of(context).unselectedWidgetColor,
                  ),
                ),
                Text(
                  '搜索',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.collections_bookmark_outlined,
            color: Theme.of(context).unselectedWidgetColor,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.calendar_today_outlined,
            color: Theme.of(context).unselectedWidgetColor,
          ),
        ),
        Text(
          '签到',
          style: TextStyle(
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
