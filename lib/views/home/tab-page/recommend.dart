import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_app/components/common/back-to-top.dart';
import 'package:my_app/components/common/refresh/refresh.dart';
import 'package:my_app/components/common/swiper.dart';
import 'package:my_app/config/assets.dart';
import 'package:my_app/http/platform.dart';
import 'package:my_app/route/routers.dart';
import 'package:my_app/utils/logger.dart';
import 'package:my_app/utils/util.dart';

class Recommend extends StatefulWidget {
  Recommend({Key? key}) : super(key: key);

  @override
  _RecommendState createState() => _RecommendState();
}

class _RecommendState extends State<Recommend> {
  ScrollController _controller = new ScrollController();
  late List recommendList = [];
  late List<String> swiperList = [];
  int pageNum = 0;
  late Refresh state;

  //  初始化
  void getRecommendList() async {
    state = Refresh.first;

    List res = await Platform.getRecommendAll('0', 0);
    for (var i = 0; i < 3; i++) {
      swiperList.add(res[i]['roomThumb']);
    }

    if (res.length <= 0) {
      state = Refresh.noData;
    } else {
      this.setState(() {
        recommendList = res;
        state = Refresh.refresh;
      });
    }
  }

  //上拉加载更多
  Future<Null> _loadMoreData(c) async {
    List res = await Platform.getRecommendAll('0', pageNum++);
    recommendList.addAll(res);

    if (mounted) setState(() {});
    c.loadComplete();
  }

  // 下拉刷新
  void _onRefresh(c) async {
    state = Refresh.first;
    List res = await Platform.getRecommendAll('0', getRandomRangeInt(1, 100));

    if (res.length <= 0) {
      state = Refresh.noData;
    } else {
      this.setState(() {
        recommendList = res;

        state = Refresh.refresh;
        c.refreshCompleted();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackToTop(
      _controller,
      child: RefreshWidget(
        state: state,
        enablePullDown: true,
        enablePullUp: true,
        onRefresh: _onRefresh,
        onLoadMore: _loadMoreData,
        scrollController: _controller,
        child: CustomScrollView(
          controller: _controller,
          slivers: [
            SliverToBoxAdapter(child: Swiper(pageList: swiperList)),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (content, index) {
                  final Map currentObj = listDataHandle(index);

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
                            showUrl: currentObj['showUrl'],
                            liveType: currentObj['liveType'],
                            personNum: currentObj['personNum'],
                          ),
                          LiveRoomTitle(
                            liveAvatar: currentObj['liveAvatar'],
                            platformAndOwner: currentObj['platformAndOwner'],
                            roomName: currentObj['roomName'],
                          )
                        ],
                      ),
                    ),
                  );
                },
                childCount: recommendList.length,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    getRecommendList();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // 渲染数据处理
  Map<String, dynamic> listDataHandle(index) {
    int length = recommendList[index]['online'].toString().length;
    final bool isAddHttps =
        recommendList[index]['avatar'].toString().indexOf('https') > -1;

    return {
      'showUrl': recommendList[index]['roomThumb'],
      'liveType': recommendList[index]['cateName'],
      'roomName': recommendList[index]['roomName'],
      'liveAvatar': isAddHttps
          ? recommendList[index]['avatar']
          : 'https:${recommendList[index]['avatar']}',
      'personNum': length >= 3
          ? '${recommendList[index]['online'].toString().substring(0, length - 3)}万'
          : '${recommendList[index]['online'].toString()}万',
      'platformAndOwner':
          '${recommendList[index]['com']} · ${recommendList[index]['ownerName']}',
      'recommendList': recommendList[index]['online'].toString().length
    };
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
            Assets.cache,
            fit: BoxFit.fitWidth,
            width: double.infinity,
          ),
          errorWidget: (context, url, error) => Image.asset(
            Assets.cache,
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
