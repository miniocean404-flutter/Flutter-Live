// import 'AlbumSelect.dart';
// import 'package:flutter/material.dart';

// class PhotoPickerVideoCover extends StatefulWidget {
//   final PhotoDataSelect photoDataSelect;
//   PhotoPickerVideoCover(this.photoDataSelect);
//   _PhotoPickerVideoCoverState createState() => _PhotoPickerVideoCoverState();
// }

// class _PhotoPickerVideoCoverState extends State<PhotoPickerVideoCover>
//     with AutomaticKeepAliveClientMixin {
//   late String time;
//   @override
//   void initState() {
//     super.initState();
//     _init();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return widget.photoDataSelect.data != null
//         ? Stack(
//             children: [
//               Positioned(
//                 left: 0,
//                 right: 0,
//                 top: 0,
//                 bottom: 0,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: MemoryImage(
//                         widget.photoDataSelect.data,
//                       ),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 0,
//                 right: 0,
//                 top: 0,
//                 bottom: 0,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [Colors.black, Colors.transparent],
//                       begin: Alignment.bottomCenter,
//                       end: Alignment.topCenter,
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 right: 4,
//                 bottom: 4,
//                 child: Container(
//                   child: Text(
//                     time,
//                     style: TextStyle(fontSize: 13, color: Colors.white),
//                   ),
//                 ),
//               )
//             ],
//           )
//         : Container();
//   }

//   _init() {
//     // 视频时长
//     int seconds =
//         widget.photoDataSelect.assetEntity.videoDuration.inSeconds % 60;
//     int minutes = widget.photoDataSelect.assetEntity.videoDuration.inMinutes;
//     time =
//         "${minutes < 10 ? '0$minutes' : minutes} : ${seconds < 10 ? '0$seconds' : seconds}";
//   }

//   @override
//   bool get wantKeepAlive => true;
// }
