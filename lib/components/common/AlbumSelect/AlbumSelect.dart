// import 'dart:io';
// import 'dart:typed_data';
// import 'PhotoPickerVideoCover.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_easyrefresh/easyRefresh.dart';
// import 'package:photo_manager/photo_manager.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class PhotoPickerUtils extends StatefulWidget {
//   /// 选择类型
//   final RequestType type;

//   /// 图片最多选择个数
//   final int maxLength;
//   PhotoPickerUtils({this.type = RequestType.common, this.maxLength = 9});
//   _PhotoPickerUtilsState createState() => _PhotoPickerUtilsState();
// }

// class _PhotoPickerUtilsState extends State<PhotoPickerUtils> {
//   // 相册地址列表
//   late List<AssetPathEntity> _pathList;
//   // 记录当前相册地址
//   late AssetPathEntity _currPath;
//   // 展示图片列表
//   List<PhotoDataSelect> _imgFileList = [];
//   // 默认展示最近
//   dynamic _imgTypeId = "isAll";
//   // 选中列表
//   List<PhotoDataSelect> _selected = [];
//   // 是否选则视频
//   bool _isVideo = false;
//   // 刷新 ---》 因为部分机型有无法加载全部图片现象，用来延时刷新
//   bool _isRefresh = false;
//   // 分页
//   int _page = 0;

//   /// 每页加载数
//   int _loadCount = 42;
//   // 错误数 ---》 这个应该没用了
//   int _errorTotal = 0;
//   EasyRefreshController _easyRefreshController = EasyRefreshController();
//   @override
//   void initState() {
//     super.initState();
//     _initImagePath();
//   }

//   @override
//   dispose() {
//     super.dispose();
//     _easyRefreshController.dispose();
//   }

//   /// 加载更多
//   Future<void> _loadMore() async {
//     if (_imgFileList.length > _currPath.assetCount - _errorTotal) {
//       return;
//     }

//     final list = await _currPath.getAssetListPaged(_page + 1, _loadCount);
//     _page = _page + 1;
//     for (int i = 0; i < list.length; i++) {
//       try {
//         Uint8List temp;
//         if (list[i].title!.endsWith("gif")) {
//           File? gif = await list[i].file;
//           temp = gif!.readAsBytesSync();
//         } else {
//           temp = (await list[i].thumbData)!;
//         }
//         _imgFileList.add(PhotoDataSelect(temp, list[i]));
//       } catch (e) {
//         _errorTotal++;
//       }
//     }
//     setState(() {});
//   }

//   /// 第一次进入加载图片
//   Future _initImagePath() async {
//     try {
//       _pathList = await PhotoManager.getAssetPathList(type: widget.type);
//       List<AssetEntity> imgEntity =
//           await _pathList[0].getAssetListPaged(0, _loadCount);
//       _currPath = _pathList[0];
//       _imgFileList = [];
//       Future.delayed(Duration(seconds: 2), () {
//         // 因为部分机型不能加载全部图片，导致无法setState，故加了这个标签进行延时加载
//         if (!_isRefresh) {
//           setState(() {});
//         }
//       });
//       Future.delayed(Duration(milliseconds: 0), () async {
//         for (int i = 0; i < imgEntity.length; i++) {
//           try {
//             Uint8List temp;
//             // 如果是gif图就不获取缩略图
//             if (imgEntity[i].title!.endsWith("gif")) {
//               File? gif = await imgEntity[i].file;
//               temp = gif!.readAsBytesSync();
//             } else {
//               temp = (await imgEntity[i].thumbData)!;
//             }
//             _imgFileList.add(PhotoDataSelect(temp, imgEntity[i]));
//           } catch (e) {
//             _errorTotal++;
//           }
//         }
//       }).catchError((onError) {}).whenComplete(() {
//         _isRefresh = true;
//         setState(() {});
//       });
//     } catch (e) {
//       _imgFileList = [];
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnnotatedRegion(
//       // 设置系统导航栏字体颜色
//       value: SystemUiOverlayStyle.dark,
//       child: Column(
//         children: [
//           Container(
//             height: MediaQuery.of(context).padding.top,
//           ),
//           Container(
//             height: 56,
//             child: Row(
//               children: [
//                 Expanded(
//                     flex: 1,
//                     child: Container(
//                       child: GestureDetector(
//                         child: Container(
//                           alignment: Alignment.centerLeft,
//                           margin: EdgeInsets.only(left: 15),
//                           child: Text("取消"),
//                         ),
//                         onTap: () => Navigator.of(context).pop(),
//                       ),
//                     )),
//                 Expanded(
//                     flex: 2,
//                     child: Container(
//                       // 下拉选则相册选项
//                       child: _dropdown(),
//                     )),
//                 Expanded(
//                     flex: 1,
//                     child: Container(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           GestureDetector(
//                             child: Container(
//                               width: 56,
//                               height: 30,
//                               margin: EdgeInsets.only(right: 5),
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   color: _selected.length > 0
//                                       ? Color.lerp(Color(0xFF32CCBC),
//                                           Color(0xFF85F0E5), 0.5)
//                                       : Color(0xFFCBCBD0)),
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "确认",
//                                 style: TextStyle(
//                                     fontSize: 13, color: Colors.white),
//                               ),
//                             ),
//                             onTap: _selected.length > 0
//                                 ? () {
//                                     Navigator.of(context).pop(_selected);
//                                   }
//                                 : null,
//                           )
//                         ],
//                       ),
//                     )),
//               ],
//             ),
//           ),
//           _pathList != null
//               ? Expanded(
//                   child: MediaQuery.removePadding(
//                     context: context,
//                     removeTop: true,
//                     child: ScrollConfiguration(
//                       behavior: // !错误
//                           // OverScrollBehavior()
//                           ScrollBehavior(),
//                       child: EasyRefresh(
//                         controller: _easyRefreshController,
//                         footer: MaterialFooter(),
//                         onLoad: () async {
//                           if (_imgFileList.length <
//                               _currPath.assetCount - _errorTotal) {
//                             _easyRefreshController.finishLoad(success: true);
//                             await _loadMore();
//                           } else {
//                             _easyRefreshController.finishLoad(noMore: true);
//                           }
//                         },
//                         child: GridView.builder(
//                           itemCount:
//                               _imgFileList == null ? 0 : _imgFileList.length,
//                           gridDelegate:
//                               SliverGridDelegateWithFixedCrossAxisCount(
//                                   crossAxisCount: 3,
//                                   mainAxisSpacing: 5,
//                                   crossAxisSpacing: 5),
//                           cacheExtent: 100,
//                           padding: EdgeInsets.only(left: 5, right: 5),
//                           itemBuilder: (context, index) {
//                             bool isSelect = false;
//                             int selectIndex = -1;
//                             bool isVideo =
//                                 _imgFileList[index].assetEntity.type ==
//                                     AssetType.video;
//                             if (_selected.contains(_imgFileList[index])) {
//                               isSelect = true;
//                               selectIndex =
//                                   _selected.lastIndexOf(_imgFileList[index]);
//                             }
//                             return Stack(
//                               children: [
//                                 Positioned(
//                                   left: 0,
//                                   right: 0,
//                                   top: 0,
//                                   bottom: 0,
//                                   child: GestureDetector(
//                                     child: Container(
//                                       child: _imgFileList[index]
//                                                   .assetEntity
//                                                   .type ==
//                                               AssetType.video
//                                           ? PhotoPickerVideoCover(
//                                               _imgFileList[index])
//                                           : Image.memory(
//                                               _imgFileList[index].data,
//                                               fit: BoxFit.cover,
//                                             ),
//                                     ),
//                                     onTap: () {
//                                       _handlerSelect(index, isVideo);
//                                     },
//                                   ),
//                                 ),
//                                 Positioned(
//                                   right: 4,
//                                   top: 4,
//                                   child: GestureDetector(
//                                     child: Container(
//                                       width: 20,
//                                       height: 20,
//                                       alignment: Alignment.center,
//                                       decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(64),
//                                           border:
//                                               Border.all(color: Colors.white),
//                                           color: isSelect
//                                               ? Color.fromRGBO(50, 204, 188, 1)
//                                               : Color.fromRGBO(
//                                                   51, 50, 50, 0.5)),
//                                       child: isSelect
//                                           ? Text(
//                                               "${selectIndex + 1}",
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 10),
//                                             )
//                                           : Container(),
//                                     ),
//                                     onTap: () {
//                                       _handlerSelect(index, isVideo);
//                                     },
//                                   ),
//                                 )
//                               ],
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               : Expanded(
//                   child: Container(),
//                 ),
//           Container(
//             height: 40,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(4), topRight: Radius.circular(4))),
//             child: Row(
//               children: [
//                 GestureDetector(
//                   child: Container(
//                     margin: EdgeInsets.only(left: 30),
//                     child: Text(
//                       "预览",
//                       style: TextStyle(
//                         color: Colors.blue,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                   onTap: _selected.length > 0
//                       ? () async {
//                           if (_isVideo) {
//                             // 如果是视频，便播放视频， 这个组件没有提供
//                             File? file = await _selected[0].assetEntity.file;
//                             // Navigator.of(context).push(MaterialPageRoute(builder: (context) => NetVideoPlayer(file.path)));
//                           } else {
//                             List imgPath = [];
//                             for (int i = 0; i < _selected.length; i++) {
//                               File? file = await _selected[i].assetEntity.file;
//                               imgPath.add(file!.path);
//                             }
//                             // 如果是图片，则进行图片预览。这个组件也没提供
//                             // Navigator.of(context).push(MaterialPageRoute(builder: (context) => PhotoBrowser(imgDataArr: imgPath)));
//                           }
//                         }
//                       : null,
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   /// 下拉菜单分类
//   Widget _dropdown() {
//     List<DropdownMenuItem> list = [];
//     _pathList.forEach((element) {
//       list.add(DropdownMenuItem(
//         child: Container(
//           width: MediaQuery.of(context).size.width / 2,
//           alignment: Alignment.center,
//           child: Text(
//             TitleToChinese.getChinese(element.name),
//             style: TextStyle(
//               color: Color(0xFF666666),
//               fontSize: 15,
//             ),
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//           ),
//         ),
//         value: element.id,
//       ));
//     });

//     return DropdownButton<dynamic>(
//       items: list,
//       onChanged: (item) async {
//         // 切换相册时触发，大概和上面的initImagePath相同
//         if (item != _imgTypeId) {
//           if (_pathList != null) {
//             for (int i = 0; i < _pathList.length; i++) {
//               if (_pathList[i].id == item) {
//                 try {
//                   List<AssetEntity> imgEntity =
//                       await _pathList[i].getAssetListPaged(0, _loadCount);
//                   _page = 0;
//                   _errorTotal = 0;
//                   _currPath = _pathList[i];
//                   _imgFileList = [];
//                   _selected = [];
//                   _easyRefreshController.resetLoadState();
//                   for (int j = 0; j < imgEntity.length; j++) {
//                     Uint8List temp;
//                     if (imgEntity[j].title!.endsWith("gif")) {
//                       File? gif = await imgEntity[j].file;
//                       temp = gif!.readAsBytesSync();
//                     } else {
//                       temp = (await imgEntity[j].thumbData)!;
//                     }
//                     _imgFileList.add(PhotoDataSelect(temp, imgEntity[j]));
//                   }
//                   _imgTypeId = item;
//                 } catch (e) {
//                   _imgFileList = [];
//                   _selected = [];
//                   _imgTypeId = item;
//                 }
//                 setState(() {});
//                 break;
//               }
//             }
//           }
//         }
//       },
//       value: _imgTypeId,
//       underline: Container(),
//       icon: Container(),
//     );
//   }

//   // 选择图片或视频， 图片和视频不能同时选择
//   _handlerSelect(index, bool isVideo) async {
//     if (_isVideo && isVideo) {
//       // 如果时视频，且已选择该视频，再点击取消选中
//       if (_selected.contains(_imgFileList[index])) {
//         _selected = [];
//         _isVideo = false;
//         setState(() {});
//       } else {
//         File? file = await _imgFileList[index].assetEntity.file;
//         if (file!.lengthSync() > 30 * 1024 * 1024) {
//           Fluttertoast.showToast(msg: "选择的视频太大了");
//           return;
//         }
//         _selected = [];
//         _selected.add(_imgFileList[index]);
//         setState(() {});
//       }
//     } else if (_isVideo && !isVideo) {
//       _isVideo = false;
//       _selected = [];
//       _selectPhoto(index);
//     } else {
//       if (isVideo && _selected.length > 0) {
//         Fluttertoast.showToast(msg: "不能同时选择图片和视频");
//         return;
//       } else if (!isVideo) {
//         _selectPhoto(index);
//       } else if (isVideo && _selected.length == 0) {
//         File? file = await _imgFileList[index].assetEntity.file;
//         if (file!.lengthSync() > 30 * 1024 * 1024) {
//           Fluttertoast.showToast(msg: "选择的视频太大了");
//           return;
//         }
//         _isVideo = true;
//         _selected.add(_imgFileList[index]);
//         setState(() {});
//       }
//     }
//   }

//   _selectPhoto(index) {
//     if (!_selected.contains(_imgFileList[index])) {
//       setState(() {
//         if (_selected.length < widget.maxLength) {
//           _selected.add(_imgFileList[index]);
//         } else {
//           Fluttertoast.showToast(msg: "最多选择${widget.maxLength}张图片");
//         }
//       });
//     } else {
//       setState(() {
//         _selected.remove(_imgFileList[index]);
//       });
//     }
//   }
// }

// // 标题转中文
// class TitleToChinese {
//   static String getChinese(String title) {
//     switch (title) {
//       case "Recent":
//         return "最近";
//       case "Screenshots":
//         return "截屏";
//       case "Movies":
//         return "电影";
//       case "ScreenRecorder":
//         return "屏幕录制";
//       case "WeiXin":
//         return "微信";
//       case "GoPro-Exports":
//         return "GoPro导出";
//       case "pipixia":
//         return "皮皮虾";
//       case "Camera":
//         return "相机";
//       case "QQ-Images":
//         return "QQ图片";
//       default:
//         return title;
//     }
//   }
// }

// // 照片数据选择
// class PhotoDataSelect {
//   final Uint8List data;
//   final AssetEntity assetEntity;
//   PhotoDataSelect(this.data, this.assetEntity);
// }
