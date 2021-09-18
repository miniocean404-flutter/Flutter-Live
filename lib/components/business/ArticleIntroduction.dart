// 文章简介Bar
import 'package:flutter/material.dart';

class Params {
  // 文章内容
  String title = '函数式编程';
  String auth = '李不要熬夜 | 5个月前';
  String content =
      '讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事';
  String thumbNum = '300';
  String messageNum = '6';
  String type = '前端';
}

class ArticleIntroduction extends StatelessWidget with Params {
  // 文章内容
  final String title;
  final String auth;
  final String content;
  final String thumbNum;
  final String messageNum;
  final String type;

  ArticleIntroduction({
    Key? key,
    required this.title,
    required this.auth,
    required this.content,
    required this.thumbNum,
    required this.messageNum,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(0)),
        border: Border.all(width: 1, style: BorderStyle.none),
        boxShadow: [
          BoxShadow(
            spreadRadius: 0.2,
            blurRadius: 1,
            color: Colors.grey,
          ),
        ],
      ),
      child: ContentInfo(),
    );
  }
}

class ContentInfo extends StatelessWidget with Params {
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      textDirection: TextDirection.ltr,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).unselectedWidgetColor,
          ),
        ),
        Text(
          auth,
          style: TextStyle(
            fontSize: 12,
            color: Theme.of(context).unselectedWidgetColor,
          ),
        ),
        Text(
          content,
          style: TextStyle(
            fontSize: 12,
            color: Theme.of(context).unselectedWidgetColor,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Bottom()
      ],
    );
  }
}

class Bottom extends StatelessWidget with Params {
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // 左边图标
        Container(
            width: 80,
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.thumb_up,
                  size: 16,
                  color: Theme.of(context).unselectedWidgetColor,
                ),
                Text(
                  thumbNum,
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).unselectedWidgetColor,
                  ),
                ),
                Icon(
                  Icons.messenger,
                  size: 16,
                  color: Theme.of(context).unselectedWidgetColor,
                ),
                Text(
                  messageNum,
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).unselectedWidgetColor,
                  ),
                ),
              ],
            )),
        // 右边标签
        Container(
          height: 20,
          padding: EdgeInsets.fromLTRB(7, 2, 7, 2),
          decoration: BoxDecoration(
            color: Colors.grey[400],
          ),
          child: Text(
            type,
            style: TextStyle(
              fontSize: 12,
              color: Theme.of(context).unselectedWidgetColor,
            ),
          ),
        )
      ],
    );
  }
}
