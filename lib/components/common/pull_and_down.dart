// import 'package:flutter/material.dart';
// import 'package:zetc_app/constants.dart';

// /**
//  * 带上拉刷新和下拉加载的listView
//  */
// class RefreshListView extends StatefulWidget {
//   RefreshListView({
//     // 重新加载函数
//     this.reload,
//     // 列表数据
//     this.dataList,
//     // 页面数据
//     this.pageData,
//     // 生成每一行的样式函数
//     this.itemRow,
//     // 内容高度
//     this.height,
//     // 背景颜色
//     this.bgColor,
//     // 翻页参数
//     this.page,
//     // 是否加载完全部数据
//     this.isLoadedAll,
//   });
//   final reload;
//   final dataList;
//   final pageData;
//   final itemRow;
//   final double height;
//   final int page;
//   final bool isLoadedAll;
//   final Color bgColor;
//   @override
//   _RefreshListViewState createState() => _RefreshListViewState();
// }

// class _RefreshListViewState extends State<RefreshListView> {
//   // 滚动控制器
//   ScrollController _scrollController = new ScrollController();
//   // 是否正在加载中
//   bool isLoading = false;
//   @override
//   void initState() {
//     super.initState();

//     // 添加事件
//     _scrollController.addListener(() {
//       // 当前位置信息
//       var position = _scrollController.position;
//       // 小于50px时，触发上拉加载；
//       if (position.maxScrollExtent - position.pixels < 50) {
//         if (!widget.isLoadedAll && !isLoading) {
//           isLoading = true;
//           // 加载更多方法
//           widget.reload(widget.page, () {
//             isLoading = false;
//           });
//         }
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _scrollController?.dispose();
//     super.dispose();
//   }

//   /**
//    * 上拉刷新方法
//    */
//   Future<void> _onRefresh() async {
//     await widget.reload(1, () {});
//   }

//   Widget _getRow(BuildContext context, int index) {
//     if (index < widget.dataList.length) {
//       return widget.itemRow(context, index, widget.dataList);
//     }
//     return _getMoreWidget();
//   }

//   Widget _getMoreWidget() {
//     if (widget.isLoadedAll) {
//       return Center(
//         child: Padding(
//           padding:
//               EdgeInsets.symmetric(vertical: Constants().h20, horizontal: 0),
//           child: Text(
//             widget.dataList.length > 0 ? '已加载完全部数据' : '暂无数据!',
//             style: TextStyle(fontSize: Constants().sp28),
//           ),
//         ),
//       );
//     } else {
//       return Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             SizedBox(
//               width: Constants().w40,
//               height: Constants().w40,
//               child: CircularProgressIndicator(
//                 strokeWidth: Constants().w2,
//                 valueColor: AlwaysStoppedAnimation<Color>(
//                     Constants().defaultBtnBgColor),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(
//                   vertical: Constants().h10, horizontal: Constants().w30),
//               child: Text(
//                 '加载中...',
//                 style: TextStyle(fontSize: Constants().sp28),
//               ),
//             ),
//           ],
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: widget.height ?? double.infinity,
//         color: widget.bgColor ?? Colors.white,
//         child: RefreshIndicator(
//             color: Constants().defaultFontColor,
//             backgroundColor: Colors.white,
//             child: widget.dataList.length == 0
//                 ? _getMoreWidget()
//                 : ListView.builder(
//                     controller: _scrollController,
//                     itemCount: widget.dataList.length == 0
//                         ? 0
//                         : widget.dataList.length + 1,
//                     itemBuilder: (context, index) {
//                       return _getRow(context, index);
//                     },
//                   ),
//             onRefresh: _onRefresh));
//   }
// }
