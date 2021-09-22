import 'package:flutter/material.dart';
import 'package:my_app/components/business/ArticleIntroduction.dart';

// * 主页的容器
class HomeCotainer extends StatelessWidget {
  const HomeCotainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppbar()._buildAppBar(context),
      body: HomeBody(),
    );
  }
}

// * AppBar
class HomeAppbar {
  PreferredSizeWidget _buildAppBar(context) {
    return AppBar(
      title: Row(
        children: <Widget>[
          Expanded(
            flex: 32,
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
            flex: 18,
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
      ),
      centerTitle: true,
      elevation: 0,
      // brightness: Brightness.light,
    );
  }
}

// * Body
class HomeBody extends StatelessWidget {
  final introduction = List.filled(1, {
    'title': '函数式编程',
    'auth': '李不要熬夜 | 6个月前',
    'content':
        "讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事讲个故事",
    'thumbNum': '300',
    'messageNum': '6',
    'type': '前端',
  });

  // Image.network(
  //   'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201610%2F23%2F20161023064129_hNPzZ.jpeg&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1634291846&t=49b8ed2cea29e92b1fdc6a58f7934c18',
  // ),
  // Container(
  //   child: ClickAdd(),
  // )

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: introduction.length,
      itemBuilder: (BuildContext context, int index) {
        return ArticleIntroduction(
          title: this.introduction[index]['title'],
          auth: this.introduction[index]['auth'],
          content: this.introduction[index]['content'],
          thumbNum: this.introduction[index]['thumbNum'],
          messageNum: this.introduction[index]['messageNum'],
          type: this.introduction[index]['type'],
        );
      },
    );
  }
}

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
      ButtonBar(
        children: <Widget>[
          ElevatedButton(
            child: Text('爱你'),
            onPressed: () => {
              setState(() => {print('你好')}),
            },
            style: ButtonStyle(
                // backgroundColor: MaterialStateProperty.all(Colors.transparent),
                ),
          ),
        ],
      ),
      Text(
        '$num',
        style: TextStyle(color: Colors.red, fontSize: 32.0),
      ),
      MaterialButton(
        child: Text('点我'),
        textTheme: ButtonTextTheme.primary,
        onPressed: () => {setState(() => this.num++)},
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: this._addNum());
  }
}
