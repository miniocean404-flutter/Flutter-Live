import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_app/components/common/back-to-top.dart';
import 'package:my_app/components/common/swiper.dart';
import 'package:my_app/http/platform.dart';
import 'package:my_app/route/routers.dart';
import 'package:my_app/utils/util.dart';

class Recommend extends StatefulWidget {
  Recommend({Key? key}) : super(key: key);

  @override
  _RecommendState createState() => _RecommendState();
}

class _RecommendState extends State<Recommend>
    with AutomaticKeepAliveClientMixin {
  ScrollController _controller = new ScrollController();
  late Future<List> initLoading;
  late List recommendList;
  late List<String> swiperList = [];
  int pageNum = 0;

  // AutomaticKeepAliveClientMixin 抽象类的实现
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    initLoading = getRecommendList();

    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        _loadMoreData();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  //  初始化
  Future<List> getRecommendList() async {
    List res = await Platform.getRecommendAll('0', 0);
    recommendList = res;

    for (var i = 0; i < 3; i++) {
      swiperList.add(res[i]['roomThumb']);
    }

    return res;
  }

  //上拉加载更多
  Future<Null> _loadMoreData() async {
    List res = await Platform.getRecommendAll('0', pageNum++);
    setState(() {
      recommendList.addAll(res);
    });
  }

  // 下拉刷新
  Future<Null> _onRefresh() async {
    List res = await Platform.getRecommendAll('0', getRandomRangeInt(1, 100));
    setState(() {
      recommendList = res;
    });
  }

  Widget successWidget() {
    return BackToTop(
      _controller,
      child: ListView(
        controller: _controller,
        children: [
          Swiper(
            pageList: swiperList,
          ),
          ListView.builder(
            shrinkWrap: true, //为true可以解决子控件必须设置高度的问题
            physics: NeverScrollableScrollPhysics(), //禁用滑动事件
            itemCount: recommendList.length,
            // itemCount: 4,
            // itemExtent: 385, // 每一项的高度,极大提升性能
            itemBuilder: (BuildContext context, int index) {
              String showUrl = recommendList[index]['roomThumb'];
              String liveType = recommendList[index]['cateName'];
              String roomName = recommendList[index]['roomName'];
              String liveAvatar =
                  recommendList[index]['avatar'].toString().indexOf('https') >
                          -1
                      ? recommendList[index]['avatar']
                      : 'https:${recommendList[index]['avatar']}';
              String personNum = recommendList[index]['online']
                          .toString()
                          .length >=
                      3
                  ? '${recommendList[index]['online'].toString().substring(0, 3)}万'
                  : '${recommendList[index]['online'].toString()}万';
              String platformAndOwner =
                  '${recommendList[index]['com']} · ${recommendList[index]['ownerName']}';

              return Card(
                child: InkWell(
                  onTap: () {
                    Routers.navigateTo(
                      context,
                      Routers.liveVideoPage,
                      params: recommendList[index],
                    );
                  },
                  child: Column(
                    children: [
                      LiveRoomImage(
                        showUrl: showUrl,
                        liveType: liveType,
                        personNum: personNum,
                      ),
                      LiveRoomTitle(
                        liveAvatar: liveAvatar,
                        platformAndOwner: platformAndOwner,
                        roomName: roomName,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      onRefresh: _onRefresh, //下拉刷新回调
      displacement: 10, //指示器显示时距顶部位置
      color: Colors.blue, //指示器颜色，默认ThemeData.accentColor
      notificationPredicate:
          defaultScrollNotificationPredicate, //是否应处理滚动通知的检查（是否通知下拉刷新动作）
      child: FutureBuilder<List<dynamic>>(
        future: initLoading,
        // initialData: recommendList,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // 请求已结束
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              // 请求失败，显示错误
              return Text("Error: ${snapshot.error}");
            } else {
              // 请求成功，显示数据
              return successWidget();
            }
          } else if (snapshot.connectionState == ConnectionState.active ||
              snapshot.connectionState == ConnectionState.waiting) {
            // 请求未结束，显示loading
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class LiveRoomImage extends StatelessWidget {
  final String showUrl;
  final String liveType;
  final String personNum;
  const LiveRoomImage({
    Key? key,
    required this.showUrl,
    required this.liveType,
    required this.personNum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: showUrl,
          width: double.infinity,
          fit: BoxFit.fitWidth,
          placeholder: (context, url) => Image.asset(
            "assets/cache.png",
            fit: BoxFit.fitWidth,
            width: double.infinity,
          ),
          errorWidget: (context, url, error) => Image.asset(
            "assets/cache.png",
            fit: BoxFit.fitWidth,
            width: double.infinity,
          ),
        ),
        Positioned(
          child: Text(
            liveType,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          left: 15,
          bottom: 15,
        ),
        Positioned(
          child: Row(
            children: [
              Icon(
                Icons.local_fire_department,
                size: 20,
                color: Colors.white,
              ),
              Text(
                personNum,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              )
            ],
          ),
          right: 15,
          bottom: 15,
        ),
      ],
    );
  }
}

class LiveRoomTitle extends StatelessWidget {
  final String liveAvatar;
  final String platformAndOwner;
  final String roomName;

  const LiveRoomTitle({
    Key? key,
    required this.liveAvatar,
    required this.platformAndOwner,
    required this.roomName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.network(
          liveAvatar,
          width: 50,
          height: 50,
        ),
      ),
      title: Text(
        platformAndOwner,
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 20),
      ),
      subtitle: Text(
        roomName,
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
      ),
    );
  }
}
