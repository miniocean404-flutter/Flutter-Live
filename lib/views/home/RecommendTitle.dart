import 'package:flutter/material.dart';

class RecommendTitle extends StatelessWidget {
  const RecommendTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
            decoration: BoxDecoration(
              color: Color(0xFFf5f6f7),
              borderRadius: BorderRadius.all(Radius.circular(1)),
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
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Icon(
                  Icons.collections_bookmark_outlined,
                  color: Theme.of(context).unselectedWidgetColor,
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      color: Theme.of(context).unselectedWidgetColor,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        '签到',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
