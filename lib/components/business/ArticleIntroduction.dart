// 文章简介Bar
import 'package:flutter/material.dart';

abstract class Params extends StatelessWidget {
  // 文章内容
  final String? title;
  final String? auth;
  final String? content;
  final String? thumbNum;
  final String? messageNum;
  final String? type;

  Params({
    this.title,
    this.auth,
    this.content,
    this.thumbNum,
    this.messageNum,
    this.type,
  });
}

class ArticleIntroduction extends Params {
  ArticleIntroduction({
    String? title,
    String? auth,
    String? content,
    String? thumbNum,
    String? messageNum,
    String? type,
  }) : super(
          title: title,
          auth: auth,
          content: content,
          thumbNum: thumbNum,
          messageNum: messageNum,
          type: type,
        );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Container(
          width: double.infinity,
          height: 150,
          margin: EdgeInsets.fromLTRB(0, 6, 0, 3),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(0)),
            // border: Border.all(width: 1, style: BorderStyle.none),
            // boxShadow: [
            //   BoxShadow(
            //     spreadRadius: 0.2,
            //     blurRadius: 1,
            //     color: Colors.grey[300] as Color,
            //   ),
            // ],
          ),
          child: ContentInfo<String>(
            title: this.title,
            auth: this.auth,
            content: this.content,
            child: Bottom<String>(
              thumbNum: this.thumbNum,
              messageNum: this.messageNum,
              type: this.type,
            ),
          ),
        ),
      ),
    );
  }
}

class ContentInfo<T> extends Params {
  final Widget child;

  ContentInfo({
    String? title,
    String? auth,
    String? content,
    required this.child,
  }) : super(
          title: title,
          auth: auth,
          content: content,
        );

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      textDirection: TextDirection.ltr,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          this.title ?? '',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        Text(
          this.auth ?? '',
          style: TextStyle(
            fontSize: 12,
            color: Theme.of(context).unselectedWidgetColor,
          ),
        ),
        Text(
          this.content ?? '',
          style: TextStyle(
            fontSize: 12,
            color: Theme.of(context).unselectedWidgetColor,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        this.child,
      ],
    );
  }
}

class Bottom<T> extends Params {
  Bottom({
    String? thumbNum,
    String? messageNum,
    String? type,
  }) : super(
          thumbNum: thumbNum,
          messageNum: messageNum,
          type: type,
        );

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
                thumbNum ?? '',
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
                messageNum ?? '',
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).unselectedWidgetColor,
                ),
              ),
            ],
          ),
        ),
        // 右边标签
        Container(
          height: 20,
          padding: EdgeInsets.fromLTRB(7, 2, 7, 2),
          decoration: BoxDecoration(
            color: Colors.grey[400],
          ),
          child: Text(
            type ?? '',
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
