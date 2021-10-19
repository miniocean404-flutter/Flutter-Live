import 'package:flutter/material.dart';
import 'package:my_app/components/business/ArticleIntroduction.dart';
import 'package:my_app/components/common/swiper.dart';

class Recommend extends StatefulWidget {
  Recommend({Key? key}) : super(key: key);

  @override
  _RecommendState createState() => _RecommendState();
}

class _RecommendState extends State<Recommend> {
  ScrollController _controller = new ScrollController();
  late final List introduction;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        _loadMoreData();
      }
    });

    introduction = List.filled(
      12,
      {
        'title': '函数式编程',
        'auth': '李不要熬夜 | 6个月前',
        'content':
            "讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事",
        'thumbNum': '300',
        'messageNum': '6',
        'type': '前端',
      },
      growable: true,
    );
  }

  //上拉加载函数
  Future<Null> _loadMoreData() {
    // 延迟1s增加数据
    return Future.delayed(Duration(seconds: 0), () {
      if (mounted) {
        setState(() {
          introduction.add({
            'title': '我是新加的',
            'auth': '李不要熬夜 | 6个月前',
            'content':
                "讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事",
            'thumbNum': '300',
            'messageNum': '6',
            'type': '前端',
          });
        });
      }
    });
  }

  // 下拉刷新函数
  Future<Null> _onRefresh() {
    return Future.delayed(
      Duration(seconds: 1),
      () {
        setState(() {
          introduction.removeRange(9, introduction.length);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh, //下拉刷新回调
      displacement: 10, //指示器显示时距顶部位置
      color: Colors.blue, //指示器颜色，默认ThemeData.accentColor
      notificationPredicate:
          defaultScrollNotificationPredicate, //是否应处理滚动通知的检查（是否通知下拉刷新动作）
      child: ListView.builder(
        itemCount: introduction.length,
        controller: _controller,
        itemBuilder: (BuildContext context, int index) {
          return index == 0
              ? Swiper()
              : ArticleIntroduction(
                  title: this.introduction[index]['title'],
                  auth: this.introduction[index]['auth'],
                  content: this.introduction[index]['content'],
                  thumbNum: this.introduction[index]['thumbNum'],
                  messageNum: this.introduction[index]['messageNum'],
                  type: this.introduction[index]['type'],
                );
        },
      ),
    );
  }
}
